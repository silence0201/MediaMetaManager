//
//  SIGenre.m
//  MetaManagerDemo
//
//  Created by 杨晴贺 on 2017/5/15.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "SIGenre.h"

@implementation SIGenre

+ (NSArray *)videoGenres {
    static dispatch_once_t predicate;
    static NSArray *videoGenres = nil;
    dispatch_once(&predicate, ^{
        videoGenres = @[[[SIGenre alloc] initWithIndex:4000 name:@"Comedy"],
                        [[SIGenre alloc] initWithIndex:4001 name:@"Drama"],
                        [[SIGenre alloc] initWithIndex:4002 name:@"Animation"],
                        [[SIGenre alloc] initWithIndex:4003 name:@"Action & Adventure"],
                        [[SIGenre alloc] initWithIndex:4004 name:@"Classic"],
                        [[SIGenre alloc] initWithIndex:4005 name:@"Kids"],
                        [[SIGenre alloc] initWithIndex:4006 name:@"Nonfiction"],
                        [[SIGenre alloc] initWithIndex:4007 name:@"Reality TV"],
                        [[SIGenre alloc] initWithIndex:4008 name:@"Sci-Fi & Fantasy"],
                        [[SIGenre alloc] initWithIndex:4009 name:@"Sports"],
                        [[SIGenre alloc] initWithIndex:4010 name:@"Teens"],
                        [[SIGenre alloc] initWithIndex:4011 name:@"Latino TV"]];
    });
    return videoGenres;
}

+ (NSArray *)musicGenres {
    static dispatch_once_t predicate;
    static NSArray *musicGenres = nil;
    dispatch_once(&predicate, ^{
        musicGenres = @[[[SIGenre alloc] initWithIndex:0 name:@"Blues"],
                        [[SIGenre alloc] initWithIndex:1 name:@"Classic Rock"],
                        [[SIGenre alloc] initWithIndex:2 name:@"Country"],
                        [[SIGenre alloc] initWithIndex:3 name:@"Dance"],
                        [[SIGenre alloc] initWithIndex:4 name:@"Disco"],
                        [[SIGenre alloc] initWithIndex:5 name:@"Funk"],
                        [[SIGenre alloc] initWithIndex:6 name:@"Grunge"],
                        [[SIGenre alloc] initWithIndex:7 name:@"Hip-Hop"],
                        [[SIGenre alloc] initWithIndex:8 name:@"Jazz"],
                        [[SIGenre alloc] initWithIndex:9 name:@"Metal"],
                        [[SIGenre alloc] initWithIndex:10 name:@"New Age"],
                        [[SIGenre alloc] initWithIndex:11 name:@"Oldies"],
                        [[SIGenre alloc] initWithIndex:12 name:@"Other"],
                        [[SIGenre alloc] initWithIndex:13 name:@"Pop"],
                        [[SIGenre alloc] initWithIndex:14 name:@"R&B"],
                        [[SIGenre alloc] initWithIndex:15 name:@"Rap"],
                        [[SIGenre alloc] initWithIndex:16 name:@"Reggae"],
                        [[SIGenre alloc] initWithIndex:17 name:@"Rock"],
                        [[SIGenre alloc] initWithIndex:18 name:@"Techno"],
                        [[SIGenre alloc] initWithIndex:19 name:@"Industrial"],
                        [[SIGenre alloc] initWithIndex:20 name:@"Alternative"],
                        [[SIGenre alloc] initWithIndex:21 name:@"Ska"],
                        [[SIGenre alloc] initWithIndex:22 name:@"Death Metal"],
                        [[SIGenre alloc] initWithIndex:23 name:@"Pranks"],
                        [[SIGenre alloc] initWithIndex:24 name:@"Soundtrack"],
                        [[SIGenre alloc] initWithIndex:25 name:@"Euro-Techno"],
                        [[SIGenre alloc] initWithIndex:26 name:@"Ambient"],
                        [[SIGenre alloc] initWithIndex:27 name:@"Trip-Hop"],
                        [[SIGenre alloc] initWithIndex:28 name:@"Vocal"],
                        [[SIGenre alloc] initWithIndex:29 name:@"Jazz+Funk"],
                        [[SIGenre alloc] initWithIndex:30 name:@"Fusion"],
                        [[SIGenre alloc] initWithIndex:31 name:@"Trance"],
                        [[SIGenre alloc] initWithIndex:32 name:@"Classical"],
                        [[SIGenre alloc] initWithIndex:33 name:@"Instrumental"],
                        [[SIGenre alloc] initWithIndex:34 name:@"Acid"],
                        [[SIGenre alloc] initWithIndex:35 name:@"House"],
                        [[SIGenre alloc] initWithIndex:36 name:@"Game"],
                        [[SIGenre alloc] initWithIndex:37 name:@"Sound Clip"],
                        [[SIGenre alloc] initWithIndex:38 name:@"Gospel"],
                        [[SIGenre alloc] initWithIndex:39 name:@"Noise"],
                        [[SIGenre alloc] initWithIndex:40 name:@"AlternRock"],
                        [[SIGenre alloc] initWithIndex:41 name:@"Bass"],
                        [[SIGenre alloc] initWithIndex:42 name:@"Soul"],
                        [[SIGenre alloc] initWithIndex:43 name:@"Punk"],
                        [[SIGenre alloc] initWithIndex:44 name:@"Space"],
                        [[SIGenre alloc] initWithIndex:45 name:@"Meditative"],
                        [[SIGenre alloc] initWithIndex:46 name:@"Instrumental Pop"],
                        [[SIGenre alloc] initWithIndex:47 name:@"Instrumental Rock"],
                        [[SIGenre alloc] initWithIndex:48 name:@"Ethnic"],
                        [[SIGenre alloc] initWithIndex:49 name:@"Gothic"],
                        [[SIGenre alloc] initWithIndex:50 name:@"Darkwave"],
                        [[SIGenre alloc] initWithIndex:51 name:@"Techno-Industrial"],
                        [[SIGenre alloc] initWithIndex:52 name:@"Electronic"],
                        [[SIGenre alloc] initWithIndex:53 name:@"Pop-Folk"],
                        [[SIGenre alloc] initWithIndex:54 name:@"Eurodance"],
                        [[SIGenre alloc] initWithIndex:55 name:@"Dream"],
                        [[SIGenre alloc] initWithIndex:56 name:@"Southern Rock"],
                        [[SIGenre alloc] initWithIndex:57 name:@"Comedy"],
                        [[SIGenre alloc] initWithIndex:58 name:@"Cult"],
                        [[SIGenre alloc] initWithIndex:59 name:@"Gangsta"],
                        [[SIGenre alloc] initWithIndex:60 name:@"Top 40"],
                        [[SIGenre alloc] initWithIndex:61 name:@"Christian Rap"],
                        [[SIGenre alloc] initWithIndex:62 name:@"Pop/Funk"],
                        [[SIGenre alloc] initWithIndex:63 name:@"Jungle"],
                        [[SIGenre alloc] initWithIndex:64 name:@"Native American"],
                        [[SIGenre alloc] initWithIndex:65 name:@"Cabaret"],
                        [[SIGenre alloc] initWithIndex:66 name:@"New Wave"],
                        [[SIGenre alloc] initWithIndex:67 name:@"Psychedelic"],
                        [[SIGenre alloc] initWithIndex:68 name:@"Rave"],
                        [[SIGenre alloc] initWithIndex:69 name:@"Showtunes"],
                        [[SIGenre alloc] initWithIndex:70 name:@"Trailer"],
                        [[SIGenre alloc] initWithIndex:71 name:@"Lo-Fi"],
                        [[SIGenre alloc] initWithIndex:72 name:@"Tribal"],
                        [[SIGenre alloc] initWithIndex:73 name:@"Acid Punk"],
                        [[SIGenre alloc] initWithIndex:74 name:@"Acid Jazz"],
                        [[SIGenre alloc] initWithIndex:75 name:@"Polka"],
                        [[SIGenre alloc] initWithIndex:76 name:@"Retro"],
                        [[SIGenre alloc] initWithIndex:77 name:@"Musical"],
                        [[SIGenre alloc] initWithIndex:78 name:@"Rock & Roll"],
                        [[SIGenre alloc] initWithIndex:79 name:@"Hard Rock"],
                        [[SIGenre alloc] initWithIndex:80 name:@"Folk"],
                        [[SIGenre alloc] initWithIndex:81 name:@"Folk-Rock"],
                        [[SIGenre alloc] initWithIndex:82 name:@"National Folk"],
                        [[SIGenre alloc] initWithIndex:83 name:@"Swing"],
                        [[SIGenre alloc] initWithIndex:84 name:@"Fast Fusion"],
                        [[SIGenre alloc] initWithIndex:85 name:@"Bebob"],
                        [[SIGenre alloc] initWithIndex:86 name:@"Latin"],
                        [[SIGenre alloc] initWithIndex:87 name:@"Revival"],
                        [[SIGenre alloc] initWithIndex:88 name:@"Celtic"],
                        [[SIGenre alloc] initWithIndex:89 name:@"Bluegrass"],
                        [[SIGenre alloc] initWithIndex:90 name:@"Avantgarde"],
                        [[SIGenre alloc] initWithIndex:91 name:@"Gothic Rock"],
                        [[SIGenre alloc] initWithIndex:92 name:@"Progressive Rock"],
                        [[SIGenre alloc] initWithIndex:93 name:@"Psychedelic Rock"],
                        [[SIGenre alloc] initWithIndex:94 name:@"Symphonic Rock"],
                        [[SIGenre alloc] initWithIndex:95 name:@"Slow Rock"],
                        [[SIGenre alloc] initWithIndex:96 name:@"Big Band"],
                        [[SIGenre alloc] initWithIndex:97 name:@"Chorus"],
                        [[SIGenre alloc] initWithIndex:98 name:@"Easy Listening"],
                        [[SIGenre alloc] initWithIndex:99 name:@"Acoustic"],
                        [[SIGenre alloc] initWithIndex:100 name:@"Humour"],
                        [[SIGenre alloc] initWithIndex:101 name:@"Speech"],
                        [[SIGenre alloc] initWithIndex:102 name:@"Chanson"],
                        [[SIGenre alloc] initWithIndex:103 name:@"Opera"],
                        [[SIGenre alloc] initWithIndex:104 name:@"Chamber Music"],
                        [[SIGenre alloc] initWithIndex:105 name:@"Sonata"],
                        [[SIGenre alloc] initWithIndex:106 name:@"Symphony"],
                        [[SIGenre alloc] initWithIndex:107 name:@"Booty Bass"],
                        [[SIGenre alloc] initWithIndex:108 name:@"Primus"],
                        [[SIGenre alloc] initWithIndex:109 name:@"Porn Groove"],
                        [[SIGenre alloc] initWithIndex:110 name:@"Satire"],
                        [[SIGenre alloc] initWithIndex:111 name:@"Slow Jam"],
                        [[SIGenre alloc] initWithIndex:112 name:@"Club"],
                        [[SIGenre alloc] initWithIndex:113 name:@"Tango"],
                        [[SIGenre alloc] initWithIndex:114 name:@"Samba"],
                        [[SIGenre alloc] initWithIndex:115 name:@"Folklore"],
                        [[SIGenre alloc] initWithIndex:116 name:@"Ballad"],
                        [[SIGenre alloc] initWithIndex:117 name:@"Power Ballad"],
                        [[SIGenre alloc] initWithIndex:118 name:@"Rhythmic Soul"],
                        [[SIGenre alloc] initWithIndex:119 name:@"Freestyle"],
                        [[SIGenre alloc] initWithIndex:120 name:@"Duet"],
                        [[SIGenre alloc] initWithIndex:121 name:@"Punk Rock"],
                        [[SIGenre alloc] initWithIndex:122 name:@"Drum Solo"],
                        [[SIGenre alloc] initWithIndex:123 name:@"A Capella"],
                        [[SIGenre alloc] initWithIndex:124 name:@"Euro-House"],
                        [[SIGenre alloc] initWithIndex:125 name:@"Dance Hall"]];
    });
    return musicGenres;
}

+ (SIGenre *)id3GenreWithName:(NSString *)name {
    for (SIGenre *genre in [self musicGenres]) {
        if ([genre.name isEqualToString:name]) {
            return genre;
        }
    }
    return [[SIGenre alloc] initWithIndex:255 name:name];
}

+ (SIGenre *)id3GenreWithIndex:(NSUInteger)genreIndex {
    for (SIGenre *genre in [self musicGenres]) {
        if (genre.index == genreIndex) {
            return genre;
        }
    }
    return [[SIGenre alloc] initWithIndex:255 name:@"Custom"];
}

+ (SIGenre *)iTunesGenreWithIndex:(NSUInteger)genreIndex {
    return [self id3GenreWithIndex:genreIndex - 1];
}

+ (SIGenre *)videoGenreWithName:(NSString *)name {
    for (SIGenre *genre in [self videoGenres]) {
        if ([genre.name isEqualToString:name]) {
            return genre;
        }
    }
    return nil;
}

- (instancetype)initWithIndex:(NSUInteger)genreIndex name:(NSString *)name {
    self = [super init];
    if (self) {
        _index = genreIndex;
        _name = [name copy];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[SIGenre alloc] initWithIndex:_index name:_name];
}

- (NSString *)description {
    return self.name;
}

- (BOOL)isEqual:(id)other {
    if (self == other) {
        return YES;
    }
    if (!other || ![other isMemberOfClass:[self class]]) {
        return NO;
    }
    return self.index == [other index] && [self.name isEqual:[other name]];
}

- (NSUInteger)hash {
    NSUInteger prime = 37;
    NSUInteger hash = 0;
    hash += (_index + 1) * prime;
    hash += [self.name hash] * prime;
    return hash;
}

@end
