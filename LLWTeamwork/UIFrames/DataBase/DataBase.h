//
//  DataBase.h
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WYLInformation;
@class LGQNewest;
@interface DataBase : NSObject

+ (DataBase *)shareDataBase;

// 添加一个资讯
- (void)insertOneInformation:(WYLInformation *)infromation;

// 返回所有资讯
- (NSArray *)selectAllInformations;

// 删除一个资讯
- (void)deleteOneInformation:(NSString *)title;

// 判断是否已经存在的方法
- (BOOL)isCollecedInformation:(WYLInformation *)information;



// 清空缓存
- (void)deleteAll;



//========================视频===================
// 添加一个视频
- (void)insertOneVideo:(LGQNewest *)video;

// 返回所有视频
- (NSArray *)selectAllVideos;

// 删除一个视频
- (void)deleteOneVideo:(NSString *)title;

// 判断是否已经存在视频的方法
- (BOOL)isCollecedvideo:(LGQNewest *)video;



@end
