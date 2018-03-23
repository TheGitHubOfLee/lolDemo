//
//  SlideEffect.h
//  SlideText9
//
//  Created by lanouhn on 16/1/8.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenWidth     [UIScreen mainScreen].bounds.size.width  // 屏幕宽度
#define kScreenHeigth    [UIScreen mainScreen].bounds.size.height // 屏幕高度
#define kMainViewScale 0.8 // 主视图缩放比例
#define kMainViewCenter CGPointMake(kScreenWidth + (kScreenWidth * kMainViewScale) / 2 - kMainViewDistance, kScreenHeigth / 2) // 主视图缩放后的位置
#define kMainViewDistance 50 // 主视图缩放后右边距离屏幕的距离
#define kBroadViewInitializationCenterX 30 // 侧边中心X坐标初始化位置
#define kBroadViewInitializationScale 0.7  // 侧边初始化缩放比例
#define kViewController UIViewController

@interface SlideEffect : UIViewController

@property (nonatomic , copy) NSString *barTittle; // 导航栏名称

- (instancetype)initWithMainViewController:(UIViewController *)mainViewController broadSideViewController:(UIViewController *)broadSideViewController;

@end
