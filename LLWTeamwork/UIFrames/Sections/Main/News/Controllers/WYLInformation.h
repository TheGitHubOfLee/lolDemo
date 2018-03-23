//
//  WYLInformation.h
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYLInformation : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, assign) NSTimeInterval published;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, copy) NSString *video_url;
@property (nonatomic, copy) NSString *pic_url;
@end
