//
//  MineMainViewTemplate.h
//  SlideText9
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kUIScreenWidth [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight [UIScreen mainScreen].bounds.size.height

@protocol MineMainViewTemplateDelegate <NSObject>

#pragma mark - 实现button方法
- (void)clickWallPaPerButton;

- (void)clickBellButton;

- (void)clickManitoListButton;

- (void)clickHeroListButton;

@end

@interface MineMainViewTemplate : UIView

@property (nonatomic , assign) id<MineMainViewTemplateDelegate>delegate;



@end
