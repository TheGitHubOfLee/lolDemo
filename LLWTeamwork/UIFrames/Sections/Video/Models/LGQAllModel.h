//
//  LGQAllModel.h
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/12.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGQAllModel : NSObject
@property(nonatomic, assign)NSTimeInterval published; //更新时间
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *desc;
@property (nonatomic, retain) NSString *pic_url;
@property (nonatomic, copy)NSString *Aid;

@end
