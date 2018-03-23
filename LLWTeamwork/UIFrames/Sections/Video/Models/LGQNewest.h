//
//  LGQNewest.h
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGQNewest : NSObject

@property(nonatomic, retain)NSString *desc;// 创做者
@property(nonatomic, assign)NSTimeInterval published; //更新时间
@property(nonatomic, retain)NSString *pic_url; //图片
@property(nonatomic, retain)NSString *video_url; //视频连接
@property(nonatomic, retain)NSString *title; // 标题;
@property (nonatomic, retain) NSString *item_id;
@end
