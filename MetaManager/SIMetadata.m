//
//  SIMetadata.m
//  MetaManagerDemo
//
//  Created by 杨晴贺 on 2017/5/15.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "SIMetadata.h"
#import "SIMetadataConverterFactory.h"
#import "SIMetadataKeys.h"

@interface SIMetadata ()
@property (strong) NSDictionary *keyMapping;
@property (strong) NSMutableDictionary *metadata;
@property (strong) SIMetadataConverterFactory *converterFactory;
@end

@implementation SIMetadata

- (id)init {
    self = [super init];
    if (self) {
        _keyMapping = [self buildKeyMapping];
        _metadata = [NSMutableDictionary dictionary];
        _converterFactory = [[SIMetadataConverterFactory alloc] init];
    }
    return self;
}

- (NSDictionary *)buildKeyMapping {
    
    return @{
             // Name Mapping
             AVMetadataCommonKeyTitle : SIMetadataKeyName,
             
             // Artist Mapping
             AVMetadataCommonKeyArtist : SIMetadataKeyArtist,
             AVMetadataQuickTimeMetadataKeyProducer : SIMetadataKeyArtist,
             
             // Album Artist Mapping
             AVMetadataID3MetadataKeyBand : SIMetadataKeyAlbumArtist,
             AVMetadataiTunesMetadataKeyAlbumArtist : SIMetadataKeyAlbumArtist,
             @"TP2" : SIMetadataKeyAlbumArtist,
             
             // Album Mapping
             AVMetadataCommonKeyAlbumName : SIMetadataKeyAlbum,
             
             // Artwork Mapping
             AVMetadataCommonKeyArtwork : SIMetadataKeyArtwork,
             
             // Year Mapping
             AVMetadataCommonKeyCreationDate : SIMetadataKeyYear,
             AVMetadataID3MetadataKeyYear : SIMetadataKeyYear,
             @"TYE" : SIMetadataKeyYear,
             AVMetadataQuickTimeMetadataKeyYear : SIMetadataKeyYear,
             AVMetadataID3MetadataKeyRecordingTime : SIMetadataKeyYear,
             
             // BPM Mapping
             AVMetadataiTunesMetadataKeyBeatsPerMin : SIMetadataKeyBPM,
             AVMetadataID3MetadataKeyBeatsPerMinute : SIMetadataKeyBPM,
             @"TBP" : SIMetadataKeyBPM,
             
             // Grouping Mapping
             AVMetadataiTunesMetadataKeyGrouping : SIMetadataKeyGrouping,
             @"@grp" : SIMetadataKeyGrouping,
             AVMetadataCommonKeySubject : SIMetadataKeyGrouping,
             
             // Track Number Mapping
             AVMetadataiTunesMetadataKeyTrackNumber : SIMetadataKeyTrackNumber,
             AVMetadataID3MetadataKeyTrackNumber : SIMetadataKeyTrackNumber,
             @"TRK" : SIMetadataKeyTrackNumber,
             
             // Composer Mapping
             AVMetadataQuickTimeMetadataKeyDirector : SIMetadataKeyComposer,
             AVMetadataiTunesMetadataKeyComposer : SIMetadataKeyComposer,
             AVMetadataCommonKeyCreator : SIMetadataKeyComposer,
             
             // Disc Number Mapping
             AVMetadataiTunesMetadataKeyDiscNumber : SIMetadataKeyDiscNumber,
             AVMetadataID3MetadataKeyPartOfASet : SIMetadataKeyDiscNumber,
             @"TPA" : SIMetadataKeyDiscNumber,
             
             // Comments Mapping
             @"ldes" : SIMetadataKeyComments,
             AVMetadataCommonKeyDescription : SIMetadataKeyComments,
             AVMetadataiTunesMetadataKeyUserComment : SIMetadataKeyComments,
             AVMetadataID3MetadataKeyComments : SIMetadataKeyComments,
             @"COM" : SIMetadataKeyComments,
             
             // Genre Mapping
             AVMetadataQuickTimeMetadataKeyGenre : SIMetadataKeyGenre,
             AVMetadataiTunesMetadataKeyUserGenre : SIMetadataKeyGenre,
             AVMetadataCommonKeyType : SIMetadataKeyGenre
             };
}


- (void)addMetadataItem:(AVMetadataItem *)item withKey:(id)key {
    
    NSString *normalizedKey = self.keyMapping[key];
    
    if (normalizedKey) {
        
        id <SIMetadataConverter> converter =
        [self.converterFactory converterForKey:normalizedKey];
        
        id value = [converter displayValueFromMetadataItem:item];
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            NSDictionary *data = (NSDictionary *) value;
            for (NSString *currentKey in data) {
                if (![data[currentKey] isKindOfClass:[NSNull class]]) {
                    [self setValue:data[currentKey] forKey:currentKey];
                }
            }
        } else {
            [self setValue:value forKey:normalizedKey];
        }
        
        self.metadata[normalizedKey] = item;
    }
}

- (NSArray *)metadataItems {
    
    NSMutableArray *items = [NSMutableArray array];
    
    [self addMetadataItemForNumber:self.trackNumber
                             count:self.trackCount
                         numberKey:SIMetadataKeyTrackNumber
                          countKey:SIMetadataKeyTrackCount
                           toArray:items];
    
    [self addMetadataItemForNumber:self.discNumber
                             count:self.discCount
                         numberKey:SIMetadataKeyDiscNumber
                          countKey:SIMetadataKeyDiscCount
                           toArray:items];
    
    NSMutableDictionary *metaDict = [self.metadata mutableCopy];
    [metaDict removeObjectForKey:SIMetadataKeyTrackNumber];
    [metaDict removeObjectForKey:SIMetadataKeyDiscNumber];
    
    for (NSString *key in metaDict) {
        
        id <SIMetadataConverter> converter = [self.converterFactory converterForKey:key] ;
        
        id value = [self valueForKey:key];
        
        AVMetadataItem *item = [converter metadataItemFromDisplayValue:value withMetadataItem:metaDict[key]] ;
        if (item) {
            [items addObject:item];
        }
    }
    
    return items;
}

- (void)addMetadataItemForNumber:(NSNumber *)number
                           count:(NSNumber *)count
                       numberKey:(NSString *)numberKey
                        countKey:(NSString *)countKey
                         toArray:(NSMutableArray *)items {
    
    id <SIMetadataConverter> converter =
    [self.converterFactory converterForKey:numberKey];
    
    NSDictionary *data = @{numberKey : number ?: [NSNull null],
                           countKey : count ?: [NSNull null]};
    
    AVMetadataItem *sourceItem = self.metadata[numberKey];
    
    AVMetadataItem *item =                                                  
    [converter metadataItemFromDisplayValue:data
                           withMetadataItem:sourceItem];
    if (item) {
        [items addObject:item];
    }
}

@end

