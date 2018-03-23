//
//  WYLInformation.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "WYLInformation.h"

@implementation WYLInformation
- (void)dealloc
{
    self.title = nil;
    self.desc = nil;
    self.video_url = nil;
    self.pic_url = nil;
    self.cid = nil;
    [super dealloc];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.cid = value;
    }
}
@end
