

//
//  UnfoldedRootController.m
//  UnfoldedView
//
//  Created by lanouhn on 16/1/13.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "UnfoldedRootController.h"
#import "UnfoldedTableViewController.h"
#import "UnfoldedBarViewController.h"
#import "UnfoldedBarViewTemplate.h"

@interface UnfoldedRootController ()
{
    BOOL _isOpen;
}

@property (nonatomic , retain) UnfoldedTableViewController *unfoldedTableVC;

@property (nonatomic , retain) UnfoldedBarViewController *unfoldedBarVC;

@end

@implementation UnfoldedRootController
#pragma mark - 重写dealloc
-(void)dealloc {
    
    self.unfoldedTableVC = nil;
    
    self.unfoldedBarVC = nil;
    
    [super dealloc];
}

#pragma mark - 懒加载
-(UnfoldedTableViewController *)unfoldedTableVC {
    
    if (!_unfoldedTableVC) {
        
        self.unfoldedTableVC = [[UnfoldedTableViewController new] autorelease];
    }
    return [[_unfoldedTableVC retain] autorelease];
}

-(UnfoldedBarViewController *)unfoldedBarVC {
    
    if (!_unfoldedBarVC) {
        
        self.unfoldedBarVC = [[UnfoldedBarViewController new] autorelease];
    }
    return [[_unfoldedBarVC retain] autorelease];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureInterface];
}

- (void)configureInterface {
    
    // 添加子控制器
    [self addChildViewController:self.unfoldedTableVC];
    
    [self addChildViewController:self.unfoldedBarVC];

    // 初始化控制器子视图
    _unfoldedTableVC.view.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 50);
    
    _unfoldedBarVC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
    
    // 将子视图添加到父视图
    [self.view addSubview:_unfoldedTableVC.view];
    
    [self.view addSubview:_unfoldedBarVC.view];
    
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
