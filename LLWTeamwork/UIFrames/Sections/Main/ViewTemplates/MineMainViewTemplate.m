
//
//  MineMainViewTemplate.m
//  SlideText9
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "MineMainViewTemplate.h"

@interface MineMainViewTemplate ()

@property (nonatomic , retain) UIButton *wallPaperButton; // 图片button

@property (nonatomic , retain) UIButton *manitoListButton; // 大神榜

@property (nonatomic , retain) UIButton *heroListButton; // 英雄榜

@property (nonatomic , retain) UIButton *bellButton; // 铃声

@end

@implementation MineMainViewTemplate

- (void)dealloc
{
    self.delegate = nil;
    
    self.wallPaperButton = nil;
    
    self.manitoListButton = nil;
    
    self.heroListButton = nil;
    
    self.bellButton = nil;
    
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureInterface];
    }
    return self;
}



- (void)configureInterface {
    
    self.wallPaperButton = [self createButtonName:_wallPaperButton Frame:CGRectMake(kUIScreenWidth / 2  - kUIScreenWidth / 4 - 30 , kUIScreenHeight / 2 - 110 , kUIScreenWidth / 4, kUIScreenWidth / 3)  imageTitle:@"Ahri"];
    
    [self addSubview:self.wallPaperButton];
    
    [_wallPaperButton addTarget:self action:@selector(handleWallPaperButton:) forControlEvents:(UIControlEventTouchUpInside)];
    
    /**
     *
     */
    self.manitoListButton  = [self createButtonName:_wallPaperButton Frame:CGRectMake(kUIScreenWidth /2 + 20 , kUIScreenHeight / 2 - 110 , kUIScreenWidth / 4, kUIScreenWidth / 3) imageTitle:@"zed"];
    
    [self addSubview:_manitoListButton];
    
    [_manitoListButton addTarget:self action:@selector(handleManitoListButton:) forControlEvents:(UIControlEventTouchUpInside)];
    
    /**
     *
     */
    self.heroListButton = [self createButtonName:_heroListButton Frame:CGRectMake(kUIScreenWidth / 2  - kUIScreenWidth / 4 - 30, kUIScreenHeight / 2 + 10 , kUIScreenWidth / 4, kUIScreenWidth / 3)  imageTitle:@"leesin"];
    
    [self addSubview:_heroListButton];
    
    [_heroListButton addTarget:self action:@selector(handleHeroListButton:) forControlEvents:(UIControlEventTouchUpInside)];
    
    /**
     *
     */
    self.bellButton = [self createButtonName:_bellButton Frame:CGRectMake(kUIScreenWidth / 2 + 20, kUIScreenHeight / 2 + 10 , kUIScreenWidth / 4, kUIScreenWidth / 3) imageTitle:@"Sona"];
    
    [self addSubview:_bellButton];
    
    [_bellButton addTarget:self action:@selector(handleBellButton:) forControlEvents:(UIControlEventTouchUpInside)];
    
}



#pragma mark - 实现button方法
- (void)handleWallPaperButton:(UIButton *)sender {
    
    [self.delegate clickWallPaPerButton];
}

- (void)handleManitoListButton:(UIButton *)sender {
    
    [self.delegate clickManitoListButton];
}

- (void)handleHeroListButton:(UIButton *)sender {
    
    [self.delegate clickHeroListButton];
}

- (void)handleBellButton:(UIButton *)sender {
    
    [self.delegate clickBellButton];
}


//#pragma mark - 创建buttonFunction
//- (UIButton *)createButtonName:(UIButton *)name Frame:(CGRect)Frame Title:(NSString *)Title titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets imageTitle:(NSString *)imageTitle imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
//    
//    name = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    
//    name.titleLabel.backgroundColor = [UIColor redColor];
//    
//    name.imageView.backgroundColor = [UIColor orangeColor];
//    
//    name.frame = Frame;
//    
//    name.titleLabel.frame = CGRectMake(0, 60, 60, 30);
//    
//    name.imageView.frame = CGRectMake(0, 0, 60, 60);
//    
//    [name setTitle:Title forState:(UIControlStateNormal)];
//    
//    [name setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
//    
//    [name setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
//    
//    name.titleEdgeInsets = titleEdgeInsets;
//    
//    [name.titleLabel setFont:[UIFont systemFontOfSize:14]];
//    
//    name.titleLabel.textAlignment = NSTextAlignmentCenter;
//    
//    [name setImage:[UIImage imageNamed:imageTitle] forState:(UIControlStateNormal)];
//    
////    [name setBackgroundColor:[UIColor redColor]];
//    
//    [name setImageEdgeInsets:imageEdgeInsets];
//    
//    name.titleLabel.tintColor = [UIColor whiteColor];
//    
//    return name;
//}



#pragma mark - 创建buttonFunction
- (UIButton *)createButtonName:(UIButton *)name Frame:(CGRect)Frame  imageTitle:(NSString *)imageTitle {
    
    name = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    name.frame = Frame;
    
    name.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [name setImage:[UIImage imageNamed:imageTitle] forState:(UIControlStateNormal)];
    
    return name;
}


@end
