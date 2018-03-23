//
//  UnfoldedHeroShowHeaderController.m
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "UnfoldedHeroListShowHeaderController.h"

#import "UnfoldedHeroListHeaderDrop1Controller.h" // 添加子控制器1
#import "UnfoldedHeroListHeaderDrop2Controller.h" // 添加子控制器2

@interface UnfoldedHeroListShowHeaderController ()

{
    BOOL _isAppearanceButtonOpen;
    
    BOOL _isAllContentButtonOpen;
    
    BOOL _isClickAppearanceButton;
        
    BOOL _isClickAllContectButton;
}

@property (nonatomic , retain) UnfoldedHeroListHeaderDrop1Controller *unfoldedHeroLHDC1; // 子控制器对象1

@property (nonatomic , retain) UnfoldedHeroListHeaderDrop2Controller *unfoldedHeroLHDC2; // 子控制器对象2

@end

@implementation UnfoldedHeroListShowHeaderController
#pragma mark - 重写dealloc
-(void)dealloc {
    
    self.appearanceRate = nil;
    
    self.allContent = nil;
    
    self.unfoldedHeroLHDC1 = nil;
    
    self.unfoldedHeroLHDC2 = nil;
    
    [super dealloc];
}

#pragma mark - 懒加载
-(UIButton *)appearanceRate {
    
    if (!_appearanceRate) {
        
        self.appearanceRate = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        _appearanceRate.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width / 2, 30);
        
        [_appearanceRate setTitle:@"登场率" forState:(UIControlStateNormal)];
        
        [_appearanceRate setBackgroundColor:[UIColor grayColor]];
        
        _appearanceRate.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_appearanceRate setImage:[UIImage imageNamed:@"btn_backItem10.png"] forState:(UIControlStateNormal)];
        
        [_appearanceRate setTitleEdgeInsets:UIEdgeInsetsMake(0,  -_appearanceRate.imageView.bounds.size.width , 0 , 0)];
        
        [_appearanceRate setImageEdgeInsets:UIEdgeInsetsMake(0, _appearanceRate.titleLabel.bounds.size.width * 2.2 , 0, 0)];
        
        [_appearanceRate setTitleColor:[UIColor blackColor] forState:(UIControlStateHighlighted)];
        
        [_appearanceRate addTarget:self action:@selector(handleAppearanceRate:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_appearanceRate retain] autorelease];
}

-(UIButton *)allContent {
    
    if (!_allContent) {
        
        self.allContent = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        _allContent.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2, 0, [UIScreen mainScreen].bounds.size.width / 2, 30);
        
        [_allContent setBackgroundColor:[UIColor grayColor]];
        
        [_allContent setTitle:@"全部" forState:(UIControlStateNormal)];
        
        [_allContent setImage:[UIImage imageNamed:@"btn_backItem10.png"] forState:(UIControlStateNormal)];
        
        _allContent.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_allContent setTitleEdgeInsets:UIEdgeInsetsMake(0,  -_allContent.imageView.bounds.size.width , 0 , 0)];
        
        [_allContent setImageEdgeInsets:UIEdgeInsetsMake(0, _allContent.titleLabel.bounds.size.width * 2.5 , 0, 0)];
        
        [_allContent addTarget:self action:@selector(handleAllContent:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_allContent retain] autorelease];
}


-(UnfoldedHeroListHeaderDrop1Controller *)unfoldedHeroLHDC1 {
    
    if (!_unfoldedHeroLHDC1) {
        
        self.unfoldedHeroLHDC1 = [[UnfoldedHeroListHeaderDrop1Controller new] autorelease];
    }
    return [[_unfoldedHeroLHDC1 retain] autorelease];
}

-(UnfoldedHeroListHeaderDrop2Controller *)unfoldedHeroLHDC2 {
    
    if (!_unfoldedHeroLHDC2) {
        
        self.unfoldedHeroLHDC2 = [[UnfoldedHeroListHeaderDrop2Controller new] autorelease];
    }
    return [[_unfoldedHeroLHDC2 retain] autorelease];
}

#pragma mark - didLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureInterface];
}

#pragma mark - configureInterface
- (void)configureInterface {
    
    [self.view addSubview:self.appearanceRate];
    
    [self.view addSubview:self.allContent];
    
    // 添加子控器
    [self addChildViewController:self.unfoldedHeroLHDC1];
    
    [self addChildViewController:self.unfoldedHeroLHDC2];
    
    // 初始化子视图
    self.unfoldedHeroLHDC1.view.frame = CGRectMake(0 , 94 , [UIScreen mainScreen].bounds.size.width , 30);
    
    self.unfoldedHeroLHDC1.view.alpha = 0;
    
    self.unfoldedHeroLHDC2.view.frame = CGRectMake(0 , 94 , [UIScreen mainScreen].bounds.size.width , 30);
    
    self.unfoldedHeroLHDC2.view.alpha = 0;
    
    // 添加子视图
    [self.view addSubview:_unfoldedHeroLHDC1.view];
    
    [self.view addSubview:_unfoldedHeroLHDC2.view];
}


#pragma mark - 实现button方法
- (void)handleAppearanceRate:(UIButton *)sender {
    
    if (_isClickAllContectButton) {
        
        [self.allContent setBackgroundColor:[UIColor grayColor]];
        
        [self.allContent setImage:[UIImage imageNamed:@"btn_backItem10"] forState:(UIControlStateNormal)];
        
        _isClickAllContectButton = !_isClickAllContectButton;
        
        
        // 变换子控制器
        self.view.frame = CGRectMake(0 , 0 , [UIScreen mainScreen].bounds.size.width , 124);
        
        self.unfoldedHeroLHDC2.view.frame = CGRectMake(0 , 0, [UIScreen mainScreen].bounds.size.width, 30);
        
        self.unfoldedHeroLHDC2.view.alpha = 0.0;
        
        _isAllContentButtonOpen = !_isAllContentButtonOpen;
    }
    
    if (!_isClickAppearanceButton) {
        
        [sender setBackgroundColor:[UIColor blackColor]];
        
        [sender setImage:[UIImage imageNamed:@"btn_backItem10-"] forState:(UIControlStateNormal)];
        
        
        // 变换子控制器
        self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 124);
        
        self.unfoldedHeroLHDC1.view.frame = CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, 30);
        
        self.unfoldedHeroLHDC1.view.alpha = 1.0;
        
        _isClickAppearanceButton = !_isClickAppearanceButton;
    }else {
        
        [sender setBackgroundColor:[UIColor grayColor]];
        
        [sender setImage:[UIImage imageNamed:@"btn_backItem10"] forState:(UIControlStateNormal)];
        
        // 变换子控制器
        self.view.frame = CGRectMake(0 , 0 , [UIScreen mainScreen].bounds.size.width , 124);
        
        self.unfoldedHeroLHDC1.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30);
        
        self.unfoldedHeroLHDC1.view.alpha = 0.0;
        
        _isClickAppearanceButton = !_isClickAppearanceButton;
    }
    

}

- (void)handleAllContent:(UIButton *)sender {
    
    if (_isClickAppearanceButton) {
        
        [self.appearanceRate setBackgroundColor:[UIColor grayColor]];
        
        [self.appearanceRate setImage:[UIImage imageNamed:@"btn_backItem10"] forState:(UIControlStateNormal)];
        
        _isClickAppearanceButton = !_isClickAppearanceButton;
        
        
        // 变换子控制器
        self.view.frame = CGRectMake(0 , 0 , [UIScreen mainScreen].bounds.size.width , 124);
        
        self.unfoldedHeroLHDC1.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30);
        
        self.unfoldedHeroLHDC1.view.alpha = 0.0;
        
        _isAppearanceButtonOpen = !_isAppearanceButtonOpen;
    }
    
    if (!_isClickAllContectButton) {
        
        [sender setBackgroundColor:[UIColor blackColor]];
        
        [sender setImage:[UIImage imageNamed:@"btn_backItem10-"] forState:(UIControlStateNormal)];
        
        
        // 变换子控制器
        self.view.frame = CGRectMake(0 , 0 , [UIScreen mainScreen].bounds.size.width , 124);
        
        self.unfoldedHeroLHDC2.view.frame = CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, 30);
        
        self.unfoldedHeroLHDC2.view.alpha = 1.0;
        
        _isClickAllContectButton = !_isClickAllContectButton;
    }else {
        
        [sender setBackgroundColor:[UIColor grayColor]];
        
        [sender setImage:[UIImage imageNamed:@"btn_backItem10"] forState:(UIControlStateNormal)];
        
        
        // 变换子控制器
        self.view.frame = CGRectMake(0 , 0 , [UIScreen mainScreen].bounds.size.width , 124);
        
        self.unfoldedHeroLHDC2.view.frame = CGRectMake(0 , 0, [UIScreen mainScreen].bounds.size.width, 30);
        
        self.unfoldedHeroLHDC2.view.alpha = 0.0;
        
        _isClickAllContectButton = !_isClickAllContectButton;
    }
}


#pragma mark - 内存警告器
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
