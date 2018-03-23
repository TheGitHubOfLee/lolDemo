//
//  HeroListHeaderDrop2Template.m
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/15.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "HeroListHeaderDrop2Template.h"

@interface HeroListHeaderDrop2Template ()

@property (nonatomic , retain) UIButton *allHeroButton; // 全部英雄

@property (nonatomic , retain) UIButton *dyrusHeroButton; // 上单

@property (nonatomic , retain) UIButton *froggenHeroButton; // 中单

@property (nonatomic , retain) UIButton *ADCHeroButton; // ADC

@property (nonatomic , retain) UIButton *assistHeroButton; // 辅助

@property (nonatomic , retain) UIButton *junglerHeroButton; // 打野

@end

@implementation HeroListHeaderDrop2Template
#pragma mark - dealloc
-(void)dealloc {
    
    self.allHeroButton = nil;
    
    self.dyrusHeroButton = nil;
    
    self.froggenHeroButton = nil;
    
    self.ADCHeroButton = nil;
    
    self.assistHeroButton = nil;
    
    self.junglerHeroButton = nil;
    
    [super dealloc];
}

#pragma mark - 懒加载
-(UIButton *)allHeroButton {
    
    if (!_allHeroButton) {
        
        self.allHeroButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        
        _allHeroButton.tag = 236;
        
        _allHeroButton.frame = CGRectMake(0, 0, kUIScreenWidth / 6 , 30);
        
        [_allHeroButton setTitle:@"全部" forState:(UIControlStateNormal)];
        
        [_allHeroButton setTintColor:[UIColor whiteColor]];
        
        _allHeroButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_allHeroButton addTarget:self action:@selector(handleAllHeroButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_allHeroButton retain] autorelease];
}

-(UIButton *)dyrusHeroButton {
    
    if (!_dyrusHeroButton) {
        
        self.dyrusHeroButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        
        _dyrusHeroButton.tag = 237;
        
        _dyrusHeroButton.frame = CGRectMake(kUIScreenWidth / 6 * 1, 0, kUIScreenWidth / 6 , 30);
        
        [_dyrusHeroButton setTitle:@"上单" forState:(UIControlStateNormal)];
        
        [_dyrusHeroButton setTintColor:[UIColor whiteColor]];
        
        _dyrusHeroButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_dyrusHeroButton addTarget:self action:@selector(handleDyrusHeroButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_dyrusHeroButton retain] autorelease];
}

-(UIButton *)froggenHeroButton {
    
    if (!_froggenHeroButton) {
        
        self.froggenHeroButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        
        _froggenHeroButton.tag = 238;
        
        _froggenHeroButton.frame = CGRectMake(kUIScreenWidth / 6 * 2 , 0 , kUIScreenWidth / 6 , 30);
        
        [_froggenHeroButton setTitle:@"中单" forState:(UIControlStateNormal)];
        
        [_froggenHeroButton setTintColor:[UIColor whiteColor]];
        
        _froggenHeroButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_froggenHeroButton addTarget:self action:@selector(handleFroggenHeroButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_froggenHeroButton retain] autorelease];
}

- (UIButton *)ADCHeroButton {
    
    if (!_ADCHeroButton) {
        
        self.ADCHeroButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        
        _ADCHeroButton.tag = 239;
        
        _ADCHeroButton.frame = CGRectMake(kUIScreenWidth / 6 * 3 , 0, kUIScreenWidth / 6  , 30);
        
        [_ADCHeroButton setTitle:@"ADC" forState:(UIControlStateNormal)];
        
        [_ADCHeroButton setTintColor:[UIColor whiteColor]];
        
        _ADCHeroButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_ADCHeroButton addTarget:self action:@selector(handleADCHeroButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_ADCHeroButton retain] autorelease];
}

-(UIButton *)assistHeroButton {
    
    if (!_assistHeroButton) {
        
        self.assistHeroButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        
        _assistHeroButton.tag = 240;
        
        _assistHeroButton.frame = CGRectMake(kUIScreenWidth / 6 * 4, 0, kUIScreenWidth / 6 , 30);
        
        [_assistHeroButton setTitle:@"辅助" forState:(UIControlStateNormal)];
        
        [_assistHeroButton setTintColor:[UIColor whiteColor]];
        
        _assistHeroButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_assistHeroButton addTarget:self action:@selector(handleAssistHeroButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_assistHeroButton retain] autorelease];
}

-(UIButton *)junglerHeroButton {
    
    if (!_junglerHeroButton) {
        
        self.junglerHeroButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        
        _junglerHeroButton.tag = 241;
        
        _junglerHeroButton.frame = CGRectMake(kUIScreenWidth / 6 * 5, 0, kUIScreenWidth / 6 , 30);
        
        [_junglerHeroButton setTitle:@"打野" forState:(UIControlStateNormal)];
        
        [_junglerHeroButton setTintColor:[UIColor whiteColor]];
        
        _junglerHeroButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_junglerHeroButton addTarget:self action:@selector(handleJunglerHeroButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_junglerHeroButton retain] autorelease];
}

#pragma mark - init
-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self p_configureInterface];
    }
    return self;
}

- (void)p_configureInterface {
    
    [self addSubview:self.allHeroButton];
    
    [self addSubview:self.dyrusHeroButton];
    
    [self addSubview:self.froggenHeroButton];
    
    [self addSubview:self.ADCHeroButton];
    
    [self addSubview:self.assistHeroButton];
    
    [self addSubview:self.junglerHeroButton];
}

#pragma mark - button事件
- (void)handleAllHeroButton:(UIButton *)sender {
    
    [self.delegate readDataFromNetWorkingByButton:sender];
}

- (void)handleDyrusHeroButton:(UIButton *)sender {
    
    [self.delegate readDataFromNetWorkingByButton:sender];
}

- (void)handleFroggenHeroButton:(UIButton *)sender {
    
    [self.delegate readDataFromNetWorkingByButton:sender];
}

- (void)handleADCHeroButton:(UIButton *)sender {
    
    [self.delegate readDataFromNetWorkingByButton:sender];
}

- (void)handleAssistHeroButton:(UIButton *)sender {
    
    [self.delegate readDataFromNetWorkingByButton:sender];
}

- (void)handleJunglerHeroButton:(UIButton *)sender {
    
    [self.delegate readDataFromNetWorkingByButton:sender];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
