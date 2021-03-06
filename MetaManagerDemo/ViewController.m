//
//  ViewController.m
//  MetaManagerDemo
//
//  Created by 杨晴贺 on 2017/5/15.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "ViewController.h"
#import "MediaMetaManager.h"
#import "NSObject+AutoCoding.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Demo" withExtension:@"m4a"] ;
    SIMediaItem *mediaItem = [[SIMediaItem alloc]initWithURL:url] ;
    [mediaItem prepareWithCompletionHandler:^(BOOL complete) {
        if (complete) {
            NSLog(@"%@",mediaItem.dictionaryRepresentation) ;
            NSLog(@"%@",mediaItem.metadata.dictionaryRepresentation) ;
        }
    }] ;
    
    mediaItem.metadata.name = @"TT" ;
    [mediaItem saveChangeWithCompletionHandler:^(BOOL complete) {
        if (complete) {
            NSLog(@"修改成功") ;
        }
    }] ;
    

}



@end
