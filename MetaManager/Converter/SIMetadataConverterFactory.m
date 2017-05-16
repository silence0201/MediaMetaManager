//
//  SIMetadataConverterFactory.m
//  MetaManagerDemo
//
//  Created by 杨晴贺 on 2017/5/15.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "SIMetadataConverterFactory.h"
#import "SIMetadataKeys.h"

@implementation SIMetadataConverterFactory

- (id <SIMetadataConverter>)converterForKey:(NSString *)key {
    
    id <SIMetadataConverter> converter = nil;
    
    if ([key isEqualToString:SIMetadataKeyArtwork]) {
        converter = [[SIArtworkMetadataConverter alloc] init];
    }
    else if ([key isEqualToString:SIMetadataKeyTrackNumber]) {
        converter = [[SITrackMetadataConverter alloc] init];
    }
    else if ([key isEqualToString:SIMetadataKeyDiscNumber]) {
        converter = [[SIDiscMetadataConverter alloc] init];
    }
    else if ([key isEqualToString:SIMetadataKeyComments]) {
        converter = [[SICommentMetadataConverter alloc] init];
    }
    else if ([key isEqualToString:SIMetadataKeyGenre]) {
        converter = [[SIGenreMetadataConverter alloc] init];
    }
    else {
        converter = [[SIDefaultMetadataConverter alloc] init];
    }
    
    return converter;
}

@end
