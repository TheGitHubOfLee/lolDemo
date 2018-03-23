//
//  BellPalyer.h
//  SlideText9
//
//  Created by lanouhn on 16/1/12.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AVPlayer;
@interface BellPalyer : NSObject
@property (nonatomic , retain) AVPlayer *bellPlayer; // 铃声播放器

+ (BellPalyer *)shareBellPlayer;

@end
