//
//  DataBase.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "DataBase.h"
#import <sqlite3.h>
#import "WYLInformation.h"
#import "FMDB.h"
#import "LGQNewest.h"
@interface DataBase ()

@property (nonatomic, retain) FMDatabase *db;

@end

@implementation DataBase

static DataBase *single = nil;
+ (DataBase *)shareDataBase {
    @synchronized(self) {
        if (!single) {
            single = [[DataBase alloc] init];
            [single creatDataBase];
        }
    }
    return single;
}

// 创建数据库的方法

- (void)creatDataBase {
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *dbPath = [documents stringByAppendingPathComponent:@"db.sqlite"];
    self.db = [FMDatabase databaseWithPath:dbPath];
    [self.db open];
    [self creatInformationTable];
    [self creatVideoTable];
}

#pragma mark - 资讯
// 创建资讯表格
- (void)creatInformationTable {
    [self.db executeUpdate:@"create table if not exists Information(infor_id integer primary key autoincrement,infor_title text,infor_desc text,infor_cid text,video_url text,ifor_pic_url text)"];
//    NSLog(@"%@", isSuccess ? @"创建资讯表格成功" : @"创建资讯表格失败");
}

// 添加一个资讯
- (void)insertOneInformation:(WYLInformation *)infromation {
    [self.db executeUpdate:@"insert into Information(infor_title,infor_desc,infor_cid,video_url,ifor_pic_url)values(?,?,?,?,?)", infromation.title, infromation.desc,infromation.cid,infromation.video_url,infromation.pic_url];
//    NSLog(@"%@", isSuccess ? @"添加资讯成功" : @"添加资讯失败");
}

// 返回所有资讯
- (NSArray *)selectAllInformations {
    FMResultSet *set = [self.db executeQuery:@"select * from Information"];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    while ([set next]) {
        NSString *title = [set stringForColumn:@"infor_title"];
        NSString *desc = [set stringForColumn:@"infor_desc"];
        NSString *cid = [set stringForColumn:@"infor_cid"];
        NSString *url = [set stringForColumn:@"video_url"];
        NSString *pic_url = [set stringForColumn:@"ifor_pic_url"];
        WYLInformation *information = [[WYLInformation alloc] init];
        information.title = title;
        information.desc = desc;
        information.cid = cid;
        information.video_url = url;
        information.pic_url = pic_url;
        [array addObject:information];
        [information release];
    }
    return array;
}

// 删除一个资讯
- (void)deleteOneInformation:(NSString *)title {
     [self.db executeUpdate:@"delete from Information where infor_title = ?", title];
//    NSLog(@"%@", isSuccess ? @"删除资讯成功" : @"删除资讯失败");
}

// 判断是否已经存在的方法
- (BOOL)isCollecedInformation:(WYLInformation *)information {
    NSMutableArray *array = [NSMutableArray array];
    FMResultSet*set = [self.db executeQuery:@"select * from Information where infor_title = ?", information.title];
    while ([set next]) {
        NSString *title = [set stringForColumn:@"infor_title"];
        NSString *desc = [set stringForColumn:@"infor_desc"];
        WYLInformation *information = [[WYLInformation alloc] init];
        information.title = title;
        information.desc = desc;
        [array addObject:information];
        [information release];
    }
    return 0 == array.count ? YES : NO;
}



// 清空缓存
- (void)deleteAll {
    [self.db executeUpdate:@"delete from Information"];
    [self.db executeUpdate:@"delete from Video"];
}

#pragma mark - 视频

// 创建视频表格
/*
 @property(nonatomic, retain)NSString *desc;// 创做者
 @property(nonatomic, assign)NSTimeInterval published; //更新时间
 @property(nonatomic, retain)NSString *pic_url; //图片
 @property(nonatomic, retain)NSString *video_url; //视频连接
 @property(nonatomic, retain)NSString *title; // 标题;
 */

- (void)creatVideoTable {
     [self.db executeUpdate:@"create table if not exists Video(video_id integer primary key autoincrement,video_title text,video_desc text,video_pic_url text,video_url text,video_published double)"];
//    NSLog(@"%@", isSuccess ? @"创建视频表格成功" : @"创建视频表格失败");
}

// 添加一个视频
- (void)insertOneVideo:(LGQNewest *)video {
     [self.db executeUpdate:@"insert into Video(video_title,video_desc,video_pic_url,video_url,video_published)values(?,?,?,?,?)", video.title, video.desc,video.pic_url,video.video_url,video.published];
//    NSLog(@"%@", isSuccess ? @"添加视频成功" : @"添加视频失败");
}

// 返回所有视频
- (NSArray *)selectAllVideos {
    FMResultSet *set = [self.db executeQuery:@"select * from Video"];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    while ([set next]) {
        NSString *title = [set stringForColumn:@"video_title"];
        NSString *desc = [set stringForColumn:@"video_desc"];
        NSString *pic_url = [set stringForColumn:@"video_pic_url"];
        NSString *video_url = [set stringForColumn:@"video_url"];
        double published = [set doubleForColumn:@"video_published"];
        LGQNewest *video = [[LGQNewest alloc] init];
        video.title = title;
        video.desc = desc;
        video.pic_url = pic_url;
        video.video_url = video_url;
        video.published = published;
        [array addObject:video];
        [video release];
    }
    return array;
}

// 删除一个视频
- (void)deleteOneVideo:(NSString *)title {
    [self.db executeUpdate:@"delete from Video where video_title = ?", title];
//    NSLog(@"%@", isSuccess ? @"删除视频成功" : @"删除视频失败");
}

// 判断是否已经存在视频的方法
- (BOOL)isCollecedvideo:(LGQNewest *)video {
    NSMutableArray *array = [NSMutableArray array];
    FMResultSet*set = [self.db executeQuery:@"select * from Video where video_title = ?", video.title];
    while ([set next]) {
        NSString *title = [set stringForColumn:@"video_title"];
        NSString *desc = [set stringForColumn:@"video_desc"];
        LGQNewest *video = [[LGQNewest alloc] init];
        video.title = title;
        video.desc = desc;
        [array addObject:video];
        [video release];
    }
    return 0 == array.count ? YES : NO;
}



@end
