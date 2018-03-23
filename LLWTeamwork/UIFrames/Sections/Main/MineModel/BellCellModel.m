
//
//  BellCellModel.m
//  SlideText9
//
//  Created by lanouhn on 16/1/11.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "BellCellModel.h"

@implementation BellCellModel

-(void)dealloc {
    
    self.name = nil;
    
    self.path_url = nil;
    
    self.idTitle = nil;
    
    [super dealloc];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        
        self.idTitle = value;
    }
}

@end
