//
//  ImageCellModel.m
//  SlideText9
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "ImageCellModel.h"

@implementation ImageCellModel

- (void)dealloc
{
    self.pic_thumb_url = nil;
    
    self.pic_url = nil;
    
    self.name = nil;
    
    [super dealloc];
}

// 防止崩溃
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        
        self.name = value;
    }
}

@end
