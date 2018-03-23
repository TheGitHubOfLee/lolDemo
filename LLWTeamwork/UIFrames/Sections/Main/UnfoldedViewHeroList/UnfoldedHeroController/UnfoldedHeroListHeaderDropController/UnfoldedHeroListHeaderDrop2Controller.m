//
//  UnfoldedHeroListHeaderDrop2Controller.m
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/15.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "UnfoldedHeroListHeaderDrop2Controller.h"
#import "HeroListHeaderDrop2Template.h" // 模板
#import "UnfoldedHeroListShowHeaderController.h" // 父控制器
#import "UnfoldedHeroListShowTableController.h" // 父父控制器

@interface UnfoldedHeroListHeaderDrop2Controller ()<HeroListHeaderDrop2TemplateDelegate>

@property (nonatomic , retain) UnfoldedHeroListShowHeaderController *unfoldedHeroLSHC;

@property (nonatomic , retain) UnfoldedHeroListShowTableController *unfoldedHeroLSTC;

@end

@implementation UnfoldedHeroListHeaderDrop2Controller
#pragma mark - 重写dealloc
-(void)dealloc {
    
    self.unfoldedHeroLSHC = nil;
    
    self.unfoldedHeroLSTC = nil;
    
    [super dealloc];
}

#pragma mark - loadView
-(void)loadView {
    
    HeroListHeaderDrop2Template *heroListHD2T = [HeroListHeaderDrop2Template new];
    
    heroListHD2T.delegate = self;
    
    heroListHD2T.alpha = 0.2;
    
    self.view = heroListHD2T;
    
    [heroListHD2T release];
}

#pragma mark - didLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.view.alpha = 0.2;
}

#pragma mark - 实现代理方法
-(void)readDataFromNetWorkingByButton:(UIButton *)sender {
    
    self.unfoldedHeroLSHC = (UnfoldedHeroListShowHeaderController *)self.parentViewController;
    
    [_unfoldedHeroLSHC.allContent setTitle:sender.titleLabel.text forState:(UIControlStateNormal)];
    
    self.unfoldedHeroLSTC = (UnfoldedHeroListShowTableController *)self.parentViewController.parentViewController.childViewControllers.firstObject;
    
    [_unfoldedHeroLSTC readDataFromNetWorkingByButtonTag:sender.tag - 230];
    
    [_unfoldedHeroLSTC getButtonTag:sender];
}

#pragma mark - 内存警告器
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
