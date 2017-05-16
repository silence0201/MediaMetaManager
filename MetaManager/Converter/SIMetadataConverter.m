//
//  SIMetadataConverter.m
//  MetaManagerDemo
//
//  Created by 杨晴贺 on 2017/5/15.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIMetadataConverter.h"
#import "SIMetadataKeys.h"
#import "SIGenre.h"

@implementation SIDefaultMetadataConverter

- (id)displayValueFromMetadataItem:(AVMetadataItem *)item {
    return item.value;
}

- (AVMetadataItem *)metadataItemFromDisplayValue:(id)value
                                withMetadataItem:(AVMetadataItem *)item {
    
    AVMutableMetadataItem *metadataItem = [item mutableCopy];
    metadataItem.value = value;
    return metadataItem;
}

@end

@implementation SIArtworkMetadataConverter

- (id)displayValueFromMetadataItem:(AVMetadataItem *)item {
    UIImage *image = nil;
    if ([item.value isKindOfClass:[NSData class]]) {
        image = [[UIImage alloc] initWithData:item.dataValue];
    }
    else if ([item.value isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)item.value;
        image = [[UIImage alloc] initWithData:dict[@"data"]];
    }
    return image;
}

- (AVMetadataItem *)metadataItemFromDisplayValue:(id)value
                                withMetadataItem:(AVMetadataItem *)item {
    AVMutableMetadataItem *metadataItem = [item mutableCopy];
    UIImage *image = (UIImage *)value;
    metadataItem.value = UIImagePNGRepresentation(image);
    return metadataItem;
}

@end

@implementation SICommentMetadataConverter

- (id)displayValueFromMetadataItem:(AVMetadataItem *)item {
    NSString *value = nil;
    if ([item.value isKindOfClass:[NSString class]]) {
        value = item.stringValue;
    }
    else if ([item.value isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *) item.value;
        if ([dict[@"identifier"] isEqualToString:@""]) {
            value = dict[@"text"];
        }
    }
    return value;
}

- (AVMetadataItem *)metadataItemFromDisplayValue:(id)value
                                withMetadataItem:(AVMetadataItem *)item {
    AVMutableMetadataItem *metadataItem = [item mutableCopy];
    metadataItem.value = value;
    return metadataItem;
}

@end

@implementation SITrackMetadataConverter

- (id)displayValueFromMetadataItem:(AVMetadataItem *)item {
    NSNumber *number = nil;
    NSNumber *count = nil;
    
    if ([item.value isKindOfClass:[NSString class]]) {
        NSArray *components =
        [item.stringValue componentsSeparatedByString:@"/"];
        number = @([components[0] integerValue]);
        count = @([components[1] integerValue]);
    }
    else if ([item.value isKindOfClass:[NSData class]]) {
        NSData *data = item.dataValue;
        if (data.length == 8) {
            uint16_t *values = (uint16_t *) [data bytes];
            if (values[1] > 0) {
                number = @(CFSwapInt16BigToHost(values[1]));
            }
            if (values[2] > 0) {
                count = @(CFSwapInt16BigToHost(values[2]));
            }
        }
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:number ?: [NSNull null] forKey:SIMetadataKeyTrackNumber];
    [dict setObject:count ?: [NSNull null] forKey:SIMetadataKeyTrackCount];
    return dict;
}

- (AVMetadataItem *)metadataItemFromDisplayValue:(id)value
                                withMetadataItem:(AVMetadataItem *)item {
    AVMutableMetadataItem *metadataItem = [item mutableCopy];
    NSDictionary *trackData = (NSDictionary *)value;
    NSNumber *trackNumber = trackData[SIMetadataKeyTrackNumber];
    NSNumber *trackCount = trackData[SIMetadataKeyTrackCount];
    uint16_t values[4] = {0};
    if (trackNumber && ![trackNumber isKindOfClass:[NSNull class]]) {
        values[1] = CFSwapInt16HostToBig([trackNumber unsignedIntValue]);
    }
    if (trackCount && ![trackCount isKindOfClass:[NSNull class]]) {
        values[2] = CFSwapInt16HostToBig([trackCount unsignedIntValue]);
    }
    size_t length = sizeof(values);
    metadataItem.value = [NSData dataWithBytes:values length:length];
    
    return metadataItem;
}

@end

@implementation SIDiscMetadataConverter

- (id)displayValueFromMetadataItem:(AVMetadataItem *)item {
    
    NSNumber *number = nil;
    NSNumber *count = nil;
    
    if ([item.value isKindOfClass:[NSString class]]) {
        NSArray *components =
        [item.stringValue componentsSeparatedByString:@"/"];
        number = @([components[0] integerValue]);
        count = @([components[1] integerValue]);
    }
    else if ([item.value isKindOfClass:[NSData class]]) {
        NSData *data = item.dataValue;
        if (data.length == 6) {
            uint16_t *values = (uint16_t *)[data bytes];
            if (values[1] > 0) {
                number = @(CFSwapInt16BigToHost(values[1]));
            }
            if (values[2] > 0) {
                count = @(CFSwapInt16BigToHost(values[2]));
            }
        }
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:number ?: [NSNull null] forKey:SIMetadataKeyDiscNumber];
    [dict setObject:count ?: [NSNull null] forKey:SIMetadataKeyDiscCount];
    
    return dict;
}

- (AVMetadataItem *)metadataItemFromDisplayValue:(id)value
                                withMetadataItem:(AVMetadataItem *)item {
    
    AVMutableMetadataItem *metadataItem = [item mutableCopy];
    NSDictionary *discData = (NSDictionary *)value;
    NSNumber *discNumber = discData[SIMetadataKeyDiscNumber];
    NSNumber *discCount = discData[SIMetadataKeyDiscCount];
    uint16_t values[3] = {0};
    if (discNumber && ![discNumber isKindOfClass:[NSNull class]]) {
        values[1] = CFSwapInt16HostToBig([discNumber unsignedIntValue]);
    }
    if (discCount && ![discCount isKindOfClass:[NSNull class]]) {
        values[2] = CFSwapInt16HostToBig([discCount unsignedIntValue]);
    }
    size_t length = sizeof(values);
    metadataItem.value = [NSData dataWithBytes:values length:length];
    
    return metadataItem;
}

@end

@implementation SIGenreMetadataConverter

- (id)displayValueFromMetadataItem:(AVMetadataItem *)item {
    SIGenre *genre = nil;
    if ([item.value isKindOfClass:[NSString class]]) {
        if ([item.keySpace isEqualToString:AVMetadataKeySpaceID3]) {
            // ID3v2.4 stores the genre as an index value
            if (item.numberValue) {
                NSUInteger genreIndex = [item.numberValue unsignedIntValue];
                genre = [SIGenre id3GenreWithIndex:genreIndex];
            } else {
                genre = [SIGenre id3GenreWithName:item.stringValue];
            }
        } else {
            genre = [SIGenre videoGenreWithName:item.stringValue];
        }
    }
    else if ([item.value isKindOfClass:[NSData class]]) {
        NSData *data = item.dataValue;
        if (data.length == 2) {
            uint16_t *values = (uint16_t *)[data bytes];
            uint16_t genreIndex = CFSwapInt16BigToHost(values[0]);
            genre = [SIGenre iTunesGenreWithIndex:genreIndex];
        }
    }
    return genre;
}

- (AVMetadataItem *)metadataItemFromDisplayValue:(id)value
                                withMetadataItem:(AVMetadataItem *)item {
    
    AVMutableMetadataItem *metadataItem = [item mutableCopy];
    
    SIGenre *genre = (SIGenre *)value;
    
    if ([item.value isKindOfClass:[NSString class]]) {
        metadataItem.value = genre.name;
    }
    else if ([item.value isKindOfClass:[NSData class]]) {
        NSData *data = item.dataValue;
        if (data.length == 2) {
            uint16_t value = CFSwapInt16HostToBig(genre.index + 1);         
            size_t length = sizeof(value);
            metadataItem.value = [NSData dataWithBytes:&value length:length];
        }
    }
    
    return metadataItem;
}

@end


