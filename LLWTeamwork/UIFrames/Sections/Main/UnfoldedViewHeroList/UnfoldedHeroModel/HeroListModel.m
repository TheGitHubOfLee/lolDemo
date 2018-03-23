
//
//  HeroListModel.m
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "HeroListModel.h"

@implementation HeroListModel

- (void)dealloc
{
    self.progressTittle1 = nil;
    
    self.progressTittle2 = nil;
    
    self.sortInteger = nil;
    
    self.url = nil;
    
    self.name = nil;
    
    self.debut = nil;
    
    self.win = nil;
    
    self.ban = nil;
    
    self.kda = nil;
    
    self.five_kill = nil;
    
    [super dealloc];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
}

@end
