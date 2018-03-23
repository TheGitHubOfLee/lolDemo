//
//  LGQAllModel.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/12.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "LGQAllModel.h"

@implementation LGQAllModel

- (void)dealloc
{
    self.pic_url = nil;
    self.desc = nil;
    self.Aid = nil;
    self.name = nil;
    [super dealloc];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

    if ([key isEqualToString:@"id"]) {
        
        self.Aid = value;
    }
    
}

@end
