//
//  CheckPhoto.h
//  SlideText9
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface CheckPhotoController : UIViewController

@property (nonatomic , retain) NSArray *dataSource; // 存储要展示的地址

@property (nonatomic , assign) NSInteger dataSourceIndex; // 存储载入的图片下标

@end
