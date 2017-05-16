# MediaMetaManager

![Language](https://img.shields.io/badge/language-objc-orange.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)  

对多媒体的元数据获取进行简单封装

### 导入
将项目中`MetaManager`文件夹拖到项目里   

或者使用`Pod`安装

	pod 'MediaMetaManager', '~> 0.1.0'	

### 使用
1. 导入头文件

	```objective-c
	#import "MediaMetaManager.h"
	```

2. 初始化


	```objective-c
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Demo" withExtension:@"m4a"] ;
    SIMediaItem *mediaItem = [[SIMediaItem alloc]initWithURL:url] ;
	```
	
3. 准备元数据

	```objective-c
    [mediaItem prepareWithCompletionHandler:^(BOOL complete) {
        if (complete) {
            NSLog(@"%@",mediaItem.dictionaryRepresentation) ;
            NSLog(@"%@",mediaItem.metadata.dictionaryRepresentation) ;
        }
    }] ;
	```
	
4. 可以获取的数据如下

	**SIMediaItem**

	```objective-c
	@property (strong, readonly) NSString *filename;
	@property (strong, readonly) NSString *filetype;
	@property (strong, readonly) SIMetadata *metadata;
	@property (readonly, getter = isEditable) BOOL editable;
	```

	**SIMetadata**
	
	```objective-c
	@property (copy) NSString *name;
	@property (copy) NSString *artist;
	@property (copy) NSString *albumArtist;
	@property (copy) NSString *album;
	@property (copy) NSString *grouping;
	@property (copy) NSString *composer;
	@property (copy) NSString *comments;
	@property (strong) UIImage *artwork;
	@property (strong) SIGenre *genre;

	@property NSString *year;
	@property NSNumber *bpm;
	@property NSNumber *trackNumber;
	@property NSNumber *trackCount;
	@property NSNumber *discNumber;
	@property NSNumber *discCount;
	```
5. 保存修改

	```objective-c
    mediaItem.metadata.name = @"TT" ;
    [mediaItem saveChangeWithCompletionHandler:^(BOOL complete) {
        if (complete) {
            NSLog(@"修改成功") ;
        }
    }] ;
	```

	
## MediaMetaManager
MediaMetaManager is available under the MIT license. See the LICENSE file for more info.