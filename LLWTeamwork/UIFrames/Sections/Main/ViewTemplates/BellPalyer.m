//
//  BellPalyer.m
//  SlideText9
//
//  Created by lanouhn on 16/1/12.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "BellPalyer.h"
#import <AVFoundation/AVFoundation.h>

@implementation BellPalyer

+ (BellPalyer *)shareBellPlayer {
    
    static BellPalyer *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[BellPalyer alloc] init];
    });
    return manager;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.bellPlayer = [[AVPlayer alloc] init];
    }
    return self;
}

@end
