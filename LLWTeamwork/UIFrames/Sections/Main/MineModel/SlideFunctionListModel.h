//
//  SlideFunctionListModel.h
//  SlideText9
//
//  Created by lanouhn on 16/1/8.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;

@interface SlideFunctionListModel : NSObject

@property (nonatomic , retain) UIImage *image; // 侧边栏功能列表图片

@property (nonatomic , copy) NSString *strTittle;  // 侧边栏功能列表标题

@end
