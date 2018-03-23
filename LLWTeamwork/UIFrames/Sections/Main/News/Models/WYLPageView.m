//
//  WYLPageView.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "WYLPageView.h"

@implementation WYLPageView
- (void)dealloc
{
    self.image_url_big = nil;
    self.article_url = nil;
    [super dealloc];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end
