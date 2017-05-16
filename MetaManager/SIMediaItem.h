//
//  SIMediaItem.h
//  MetaManagerDemo
//
//  Created by 杨晴贺 on 2017/5/16.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "SIMetadata.h"

typedef void(^SICompletionHandler)(BOOL complete);

@interface SIMediaItem : NSObject

@property (strong, readonly) NSString *filename;
@property (strong, readonly) NSString *filetype;
@property (strong, readonly) SIMetadata *metadata;
@property (readonly, getter = isEditable) BOOL editable;

- (id)initWithURL:(NSURL *)url;
- (void)prepareWithCompletionHandler:(SICompletionHandler)handler;
- (void)saveWithCompletionHandler:(SICompletionHandler)handler;

@end
