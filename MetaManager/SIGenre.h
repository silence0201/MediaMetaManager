//
//  SIGenre.h
//  MetaManagerDemo
//
//  Created by 杨晴贺 on 2017/5/15.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIGenre : NSObject <NSCopying>

@property (nonatomic, readonly) NSUInteger index;
@property (nonatomic, copy, readonly) NSString *name;

+ (NSArray *)musicGenres;
+ (NSArray *)videoGenres;

+ (SIGenre *)id3GenreWithIndex:(NSUInteger)index;
+ (SIGenre *)id3GenreWithName:(NSString *)name;
+ (SIGenre *)iTunesGenreWithIndex:(NSUInteger)index;
+ (SIGenre *)videoGenreWithName:(NSString *)name;


@end
