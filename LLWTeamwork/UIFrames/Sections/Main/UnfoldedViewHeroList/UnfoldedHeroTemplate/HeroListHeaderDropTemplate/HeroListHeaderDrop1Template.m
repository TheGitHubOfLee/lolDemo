
//
//  HeroListHeaderDropTemplate.m
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/15.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "HeroListHeaderDrop1Template.h"

@interface HeroListHeaderDrop1Template ()

@property (nonatomic , retain) UIButton *appearanceRateButton; // 登场率

@property (nonatomic , retain) UIButton *winsButton; // 胜场

@property (nonatomic , retain) UIButton *KDAButton; // KDA

@property (nonatomic , retain) UIButton *fiveKillButton; // 五杀

@property (nonatomic , retain) UIButton *bannedRateButton; // 被禁率

@end

@implementation HeroListHeaderDrop1Template
#pragma mark - dealloc
-(void)dealloc {
    
    self.appearanceRateButton = nil;
    
    self.winsButton = nil;
    
    self.KDAButton = nil;
    
    self.fiveKillButton = nil;
    
    self.bannedRateButton = nil;
    
    [super dealloc];
}

#pragma mark - 懒加载
-(UIButton *)appearanceRateButton {
    
    if (!_appearanceRateButton) {
        
        self.appearanceRateButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        
        [_appearanceRateButton setTitle:@"登场率" forState:(UIControlStateNormal)];
        
        [_appearanceRateButton setTintColor:[UIColor whiteColor]];
        
        _appearanceRateButton.tag = 231;
        
        _appearanceRateButton.frame = CGRectMake(0 , 0 , [UIScreen mainScreen].bounds.size.width / 5 , 30);
        
        [_appearanceRateButton addTarget:self action:@selector(handleAppearanceRateButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_appearanceRateButton retain] autorelease];
}

-(UIButton *)winsButton {
    
    if (!_winsButton) {
        
        self.winsButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        
        [_winsButton setTitle:@"胜场" forState:(UIControlStateNormal)];
        
        [_winsButton setTintColor:[UIColor whiteColor]];
        
        _winsButton.tag = 232;
        
        _winsButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 5  , 0 , [UIScreen mainScreen].bounds.size.width / 5  , 30);
        
        [_winsButton addTarget:self action:@selector(handleWinsButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_winsButton retain] autorelease];
}

- (UIButton *)KDAButton {
    
    if (!_KDAButton) {
        
        self.KDAButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        
        [_KDAButton setTitle:@"KDA" forState:(UIControlStateNormal)];
        
        [_KDAButton setTintColor:[UIColor whiteColor]];
        
        _KDAButton.tag = 233;
        
        _KDAButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 5 * 2 , 0 , [UIScreen mainScreen].bounds.size.width / 5  , 30);
        
        [_KDAButton addTarget:self action:@selector(handleKDAButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_KDAButton retain] autorelease];
}

-(UIButton *)fiveKillButton {
    
    if (!_fiveKillButton) {
        
        self.fiveKillButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        
        [_fiveKillButton setTitle:@"五杀" forState:(UIControlStateNormal)];
        
        [_fiveKillButton setTintColor:[UIColor whiteColor]];
        
        _fiveKillButton.tag = 234;
        
        _fiveKillButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 5 * 3 , 0 , [UIScreen mainScreen].bounds.size.width / 5  , 30);
        
        [_fiveKillButton addTarget:self action:@selector(handleFiveKillButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_fiveKillButton retain] autorelease];
}

-(UIButton *)bannedRateButton {
    
    if (!_bannedRateButton) {
        
        self.bannedRateButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        
        [_bannedRateButton setTitle:@"被禁率" forState:(UIControlStateNormal)];
        
        [_bannedRateButton setTintColor:[UIColor whiteColor]];
        
        _bannedRateButton.tag = 235;
        
        _bannedRateButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 5 * 4 , 0 , [UIScreen mainScreen].bounds.size.width / 5  , 30);
        
        [_bannedRateButton addTarget:self action:@selector(handleBannedRateButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_bannedRateButton retain] autorelease];
}

#pragma mark - 重写init
-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.appearanceRateButton];
        
        [self addSubview:self.winsButton];
        
        [self addSubview:self.KDAButton];
        
        [self addSubview:self.fiveKillButton];
        
        [self addSubview:self.bannedRateButton];
    }
    return self;
}

#pragma mark - button事件
- (void)handleAppearanceRateButton:(UIButton *)sender {
    
    [self.delegate readDataFromNetWorkingByButton:sender];
}

- (void)handleWinsButton:(UIButton *)sender {
    
    [self.delegate readDataFromNetWorkingByButton:sender];
}

- (void)handleKDAButton:(UIButton *)sender {
    
    [self.delegate readDataFromNetWorkingByButton:sender];
}

- (void)handleFiveKillButton:(UIButton *)sender {
    
    [self.delegate readDataFromNetWorkingByButton:sender];
}

- (void)handleBannedRateButton:(UIButton *)sender {
    
    [self.delegate readDataFromNetWorkingByButton:sender];
}

@end
