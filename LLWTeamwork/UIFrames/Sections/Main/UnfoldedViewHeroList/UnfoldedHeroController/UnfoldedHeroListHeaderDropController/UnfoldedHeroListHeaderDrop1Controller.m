//
//  UnfoldedHeroListHeaderDropController.m
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/15.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "UnfoldedHeroListHeaderDrop1Controller.h"
#import "HeroListHeaderDrop1Template.h"
#import "UnfoldedHeroListShowTableController.h" // 使用接口
#import "UnfoldedHeroListShowHeaderController.h" // 父控制器

@interface UnfoldedHeroListHeaderDrop1Controller ()<HeroListHeaderDrop1TemplateDelegate>

@property (nonatomic , retain) UnfoldedHeroListShowTableController *unfoldedheroLSTC; // 创建创建父父控制器

@property (nonatomic , retain) UnfoldedHeroListShowHeaderController *unfoldedHeroLSHC; // 创建创建父控制器


@end

@implementation UnfoldedHeroListHeaderDrop1Controller
#pragma mark - dealloc
-(void)dealloc {
    
    self.unfoldedheroLSTC = nil;
    
    self.unfoldedHeroLSHC = nil;
    
    [super dealloc];
}

#pragma mark - 懒加载
-(UnfoldedHeroListShowHeaderController *)unfoldedHeroLSHC {
    
    if (!_unfoldedHeroLSHC) {
        
        self.unfoldedHeroLSHC = [[UnfoldedHeroListShowHeaderController new] autorelease];
    }
    return [[_unfoldedHeroLSHC retain] autorelease];
}

#pragma mark - 重新载入load
-(void)loadView {
    
    HeroListHeaderDrop1Template *heroListHeaderDT = [HeroListHeaderDrop1Template new];
    
    heroListHeaderDT.delegate = self;
    
    self.view = heroListHeaderDT; // 实现代理
    
    [heroListHeaderDT release];
}

#pragma mark - didLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
}

#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 实现代理方法
-(void)readDataFromNetWorkingByButton:(UIButton *)sender {
    
    self.unfoldedHeroLSHC = (UnfoldedHeroListShowHeaderController *)self.parentViewController;
    
    [_unfoldedHeroLSHC.appearanceRate setTitle:sender.titleLabel.text forState:(UIControlStateNormal)];

    self.unfoldedheroLSTC = (UnfoldedHeroListShowTableController *)self.parentViewController.parentViewController.childViewControllers.firstObject;
    
    [self.unfoldedheroLSTC readDataFromNetWorkingByButtonTag:sender.tag - 230];
    
    [_unfoldedheroLSTC getButtonTag:sender];
    
    
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
