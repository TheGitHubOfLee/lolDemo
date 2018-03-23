//
//  UnfoldedRootHeroListController.m
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "UnfoldedRootHeroListController.h"
#import "UnfoldedHeroListShowTableController.h" // 英雄展示控制器
#import "UnfoldedHeroListShowHeaderController.h" // 英雄展示bar控制器

@interface UnfoldedRootHeroListController ()

@property (nonatomic , retain) UnfoldedHeroListShowTableController *unfoldedHeroLSTC;

@property (nonatomic , retain) UnfoldedHeroListShowHeaderController *unfoldedHeroLSHC;

@end

@implementation UnfoldedRootHeroListController

#pragma mark - 重写dealloc
-(void)dealloc {
    
    self.unfoldedHeroLSTC = nil;
    
    self.unfoldedHeroLSHC = nil;
    
    [super dealloc];
}

#pragma mark - 懒加载
-(UnfoldedHeroListShowTableController *)unfoldedHeroLSTC {
    
    if (!_unfoldedHeroLSTC) {
        
        self.unfoldedHeroLSTC = [[[UnfoldedHeroListShowTableController alloc] initWithStyle:(UITableViewStylePlain)] autorelease];
    }
    return [[_unfoldedHeroLSTC retain] autorelease];
}

-(UnfoldedHeroListShowHeaderController *)unfoldedHeroLSHC {
    
    if (!_unfoldedHeroLSHC) {
        
        self.unfoldedHeroLSHC = [[UnfoldedHeroListShowHeaderController new] autorelease];
    }
    return [[_unfoldedHeroLSHC retain] autorelease];
}

#pragma mark - didLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureInterface];
}

#pragma mark - 配置界面
- (void) configureInterface {
    
    // 添加子控制器
    [self addChildViewController:self.unfoldedHeroLSTC];
    
    [self addChildViewController:self.unfoldedHeroLSHC];
    
    // 初始化子视图
    self.unfoldedHeroLSTC.view.frame = CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 30);
    
    self.unfoldedHeroLSHC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 94);
    
    // 添加子视图
    [self.view addSubview:_unfoldedHeroLSTC.view];
    
    [self.view addSubview:_unfoldedHeroLSHC.view];
    
}

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
