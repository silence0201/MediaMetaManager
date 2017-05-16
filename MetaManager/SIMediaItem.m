//
//  SIMediaItem.m
//  MetaManagerDemo
//
//  Created by 杨晴贺 on 2017/5/16.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "SIMediaItem.h"

#define COMMON_META_KEY     @"commonMetadata"
#define AVAILABLE_META_KEY  @"availableMetadataFormats"

@interface AVMetadataItem (KeyString)

@property (readonly) NSString *keyString;

@end

@implementation AVMetadataItem (KeyString)

- (NSString *)keyString {
    if ([self.key isKindOfClass:[NSString class]]) {
        return (NSString *)self.key;
    }
    else if ([self.key isKindOfClass:[NSNumber class]]) {
        UInt32 keyValue = [(NSNumber *) self.key unsignedIntValue];
        size_t length = sizeof(UInt32);
        if ((keyValue >> 24) == 0) --length;
        if ((keyValue >> 16) == 0) --length;
        if ((keyValue >> 8) == 0) --length;
        if ((keyValue >> 0) == 0) --length;
        long address = (unsigned long)&keyValue;
        address += (sizeof(UInt32) - length);
        keyValue = CFSwapInt32BigToHost(keyValue);
        char cstring[length];
        strncpy(cstring, (char *) address, length);
        cstring[length] = '\0';
        if (cstring[0] == '\xA9') {
            cstring[0] = '@';
        }
        return [NSString stringWithCString:(char *) cstring                 
                                  encoding:NSUTF8StringEncoding];
        
    }
    else {
        return @"<<unknown>>";
    }
}

@end


@interface SIMediaItem ()

@property (strong) NSURL *url;
@property (strong) AVAsset *asset;
@property (strong) SIMetadata *metadata;
@property (strong) NSArray *acceptedFormats;
@property BOOL prepared;

@end

@implementation SIMediaItem

- (id)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        _url = url;
        _asset = [AVAsset assetWithURL:url];
        _filename = [url lastPathComponent];
        _filetype = [self fileTypeForURL:url];
        _editable = ![_filetype isEqualToString:AVFileTypeMPEGLayer3];
        _acceptedFormats = @[
                             AVMetadataFormatQuickTimeMetadata,
                             AVMetadataFormatiTunesMetadata,
                             AVMetadataFormatID3Metadata
                             ];
    }
    return self;
}

- (NSString *)fileTypeForURL:(NSURL *)url {
    NSString *ext = [[self.url lastPathComponent] pathExtension];
    NSString *type = nil;
    if ([ext isEqualToString:@"m4a"]) {
        type = AVFileTypeAppleM4A;
    } else if ([ext isEqualToString:@"m4v"]) {
        type = AVFileTypeAppleM4V;
    } else if ([ext isEqualToString:@"mov"]) {
        type = AVFileTypeQuickTimeMovie;
    } else if ([ext isEqualToString:@"mp4"]) {
        type = AVFileTypeMPEG4;
    } else {
        type = AVFileTypeMPEGLayer3;
    }
    return type;
}

- (void)prepareWithCompletionHandler:(SICompletionHandler)completionHandler {
    
    if (self.prepared) {
        completionHandler(self.prepared);
        return;
    }
    
    self.metadata = [[SIMetadata alloc] init];
    
    NSArray *keys = @[COMMON_META_KEY, AVAILABLE_META_KEY];
    
    [self.asset loadValuesAsynchronouslyForKeys:keys completionHandler:^{
        
        AVKeyValueStatus commonStatus =
        [self.asset statusOfValueForKey:COMMON_META_KEY error:nil];
        
        AVKeyValueStatus formatsStatus =
        [self.asset statusOfValueForKey:AVAILABLE_META_KEY error:nil];
        
        self.prepared = (commonStatus == AVKeyValueStatusLoaded) &&
        (formatsStatus == AVKeyValueStatusLoaded);
        
        if (self.prepared) {
            for (AVMetadataItem *item in self.asset.commonMetadata) {
                // NSLog(@"%@: %@", item.keyString, item.value);
                [self.metadata addMetadataItem:item withKey:item.commonKey];
            }
            
            for (id format in self.asset.availableMetadataFormats) {
                if ([self.acceptedFormats containsObject:format]) {
                    NSArray *items = [self.asset metadataForFormat:format];
                    for (AVMetadataItem *item in items) {
                        // NSLog(@"%@: %@", item.keyString, item.value);
                        [self.metadata addMetadataItem:item
                                               withKey:item.keyString];
                    }
                }
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(self.prepared);
        });
        
    }];
}

- (void)saveWithCompletionHandler:(SICompletionHandler)handler {
    
    NSString *presetName = AVAssetExportPresetPassthrough;
    AVAssetExportSession *session =
    [[AVAssetExportSession alloc] initWithAsset:self.asset
                                     presetName:presetName];
    
    NSURL *outputURL = [self tempURL];
    session.outputURL = outputURL;
    session.outputFileType = self.filetype;
    session.metadata = [self.metadata metadataItems];
    
    [session exportAsynchronouslyWithCompletionHandler:^{
        AVAssetExportSessionStatus status = session.status;
        BOOL success = (status == AVAssetExportSessionStatusCompleted);
        if (success) {
            NSURL *sourceURL = self.url;
            NSFileManager *manager = [NSFileManager defaultManager];
            [manager removeItemAtURL:outputURL error:nil];
            [manager copyItemAtURL:sourceURL toURL:outputURL error:nil];
            [self reset];                                                   
        }
        
        if (handler) {
            dispatch_async(dispatch_get_main_queue(), ^{
                handler(success);
            });
        }
    }];
}

- (NSURL *)tempURL {
    NSString *tempDir = NSTemporaryDirectory();
    NSString *ext = [[self.url lastPathComponent] pathExtension];
    NSString *tempName = [NSString stringWithFormat:@"temp.%@", ext];
    NSString *tempPath = [tempDir stringByAppendingPathComponent:tempName];
    return [NSURL fileURLWithPath:tempPath];
}

- (void)reset {
    _prepared = NO;
    _asset = [AVAsset assetWithURL:self.url];
}


@end
