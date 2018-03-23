//
//  LGQNewest.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "LGQNewest.h"

@implementation LGQNewest

- (void)dealloc
{
    self.desc = nil;
    
    self.pic_url = nil;
    
    self.title = nil;
    
    self.video_url = nil;
    
    self.item_id = nil;
   
    [super dealloc];
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

    
}

@end
