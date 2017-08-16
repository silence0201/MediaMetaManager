//
//  SIMediaItem.h
//  MetaManagerDemo
//
//  Created by Silence on 2017/5/16.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "SIMetadata.h"

typedef void(^SICompletionHandler)(BOOL complete);

@interface SIMediaItem : NSObject

@property (strong, readonly) NSString *filename;
@property (strong, readonly) NSString *filetype;
@property (strong, readonly) SIMetadata *metadata;
@property (readonly, getter = isEditable) BOOL editable;

/**
 init With URL

 @param url Resource URL
 @return Resource SIMediaItem
 */
- (id)initWithURL:(NSURL *)url;


/**
 prepare Meta Data

 @param handler is Success
 */
- (void)prepareWithCompletionHandler:(SICompletionHandler)handler;


/**
 Save Change

 @param handler is Success
 */
- (void)saveChangeWithCompletionHandler:(SICompletionHandler)handler;

/**
 Save Media
 
 @param path Custom Path
 
 @param handler is Success
 */
- (void)exportToPath:(NSString *)path withCompletionHandler:(SICompletionHandler)handler;

@end
