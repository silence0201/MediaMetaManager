//
//  SIMetadataConverter.h
//  MetaManagerDemo
//
//  Created by 杨晴贺 on 2017/5/15.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@protocol SIMetadataConverter <NSObject>

- (id)displayValueFromMetadataItem:(AVMetadataItem *)item;

- (AVMetadataItem *)metadataItemFromDisplayValue:(id)value
                                withMetadataItem:(AVMetadataItem *)item;
@end

@interface SIDefaultMetadataConverter : NSObject <SIMetadataConverter>
@end

@interface SIArtworkMetadataConverter : NSObject <SIMetadataConverter>
@end

@interface SICommentMetadataConverter : NSObject <SIMetadataConverter>
@end

@interface SITrackMetadataConverter : NSObject <SIMetadataConverter>
@end

@interface SIDiscMetadataConverter : NSObject <SIMetadataConverter>
@end

@interface SIGenreMetadataConverter : NSObject <SIMetadataConverter>
@end
