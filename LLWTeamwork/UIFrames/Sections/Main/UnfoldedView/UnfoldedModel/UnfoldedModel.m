//
//  UnfoldedModel.m
//  UnfoldedView
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "UnfoldedModel.h"

@implementation UnfoldedModel

- (void)dealloc
{
    self.name = nil;
    
    self.url = nil;
    
    self.position = nil;
    
    self.point = nil;
    
    [super dealloc];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
}


@end
