//
//  SIMetadataConverterFactory.h
//  MetaManagerDemo
//
//  Created by 杨晴贺 on 2017/5/15.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "SIMetadataConverter.h"

@interface SIMetadataConverterFactory : NSObject

- (id <SIMetadataConverter>)converterForKey:(NSString *)key;

@end
