//
//  MianViewController.m
//  SlideText9
//
//  Created by lanouhn on 16/1/8.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "MainViewController.h"
#import "MineMainViewTemplate.h"
#import "ImageShowViewController.h"
#import "BellTableViewController.h"
#import "UnfoldedRootController.h"
#import "UnfoldedRootHeroListController.h" // 英雄榜控制器
#import "WYLDetailOfLatestViewController.h"


@interface MainViewController ()<MineMainViewTemplateDelegate>

@property (retain, nonatomic) IBOutlet UIImageView *BImage;

@property (nonatomic , retain) MineMainViewTemplate *mainMVT; // 定义模板对象

@property (nonatomic , retain) ImageShowViewController *imageShowVC; // imageButton跳转对象

@property (nonatomic , retain) BellTableViewController *bellTVC; // 创建铃声列表对象

@property (nonatomic , retain) UnfoldedRootController *unfoldedRC; // 创建大神榜根视图

@property (nonatomic , retain) UnfoldedRootHeroListController *unfoldedRHLC; // 英雄榜根视图

@end

@implementation MainViewController

#pragma mark - 重写dealloc
- (void)dealloc
{
    self.mainMVT = nil;
    
    self.imageShowVC = nil;
    
    self.bellTVC = nil;
    
    self.unfoldedRC = nil;
    
    self.unfoldedRHLC = nil;
    
    [_BImage release];
    [super dealloc];
}

#pragma mark - 载入自定义view
-(void)loadView {
    
    self.mainMVT = [[MineMainViewTemplate alloc] init];
    
    self.view = _mainMVT;
    
    [_mainMVT release];
    
}

#pragma mark - 属性懒加载

-(MineMainViewTemplate *)mainMVT {
    
    if (!_mainMVT) {
        self.mainMVT = [[[MineMainViewTemplate alloc] init] autorelease];;
    }
    return [[_mainMVT retain] autorelease];
}

-(ImageShowViewController *)imageShowVC {
    
    if (!_imageShowVC) {
        self.imageShowVC = [[[ImageShowViewController alloc] init] autorelease];
    }
    return [[_imageShowVC retain] autorelease];
}

-(BellTableViewController *)bellTVC {
    
    if (!_bellTVC) {
        self.bellTVC = [[[BellTableViewController alloc] init] autorelease];
    }
    return [[_bellTVC retain] autorelease];
}

-(UnfoldedRootController *)unfoldedRC {
    
    if (!_unfoldedRC) {
        
        self.unfoldedRC = [[UnfoldedRootController new] autorelease];
    }
    return [[_unfoldedRC retain] autorelease];
}

- (UnfoldedRootHeroListController *)unfoldedRHLC {
    
    if (!_unfoldedRHLC) {
        
        self.unfoldedRHLC = [[UnfoldedRootHeroListController new] autorelease];
    }
    return [[_unfoldedRHLC retain] autorelease];
}


#pragma mark - 主程序
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    UIImageView *bgView = [[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"deb4a289f4eaa647075358cc9c1bcb66 2.jpg"]]autorelease];
    
    bgView.frame = self.view.bounds;
    
   self.view.backgroundColor = [UIColor colorWithPatternImage:bgView.image];
    
    self.mainMVT.delegate = self;
}

#pragma mark - 实现代理方法
-(void)clickWallPaPerButton {

    UINavigationController *nav = [[[UINavigationController alloc] initWithRootViewController:self.imageShowVC] autorelease];
    
    self.imageShowVC.navigationItem.title = @"壁纸";
    
    self.imageShowVC.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.imageShowVC.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(handleWallPaperBack)] autorelease];
    
    self.imageShowVC.navigationController.navigationBar.translucent = NO;
    
    [self presentViewController:nav animated:YES completion:nil];

}

- (void)handleWallPaperBack {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)clickBellButton {
    
    UINavigationController *navigationC = [[[UINavigationController alloc] initWithRootViewController:self.bellTVC] autorelease];
    
    _bellTVC.navigationItem.title = @"铃声";
    
    _bellTVC.navigationController.navigationBar.translucent = NO;
    
    _bellTVC.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    _bellTVC.view.backgroundColor = [UIColor whiteColor];
    
    _bellTVC.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(handleBellBack)] autorelease];
    
    [self presentViewController:navigationC animated:YES completion:nil];
}

- (void)handleBellBack {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)handleManitoBack {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)clickManitoListButton {
    
    UINavigationController *navigationC = [[[UINavigationController alloc] initWithRootViewController:self.unfoldedRC] autorelease];
    
    _unfoldedRC.navigationItem.title = @"大神榜";
    
    _unfoldedRC.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    _unfoldedRC.navigationController.navigationBar.translucent = NO;
    
    _unfoldedRC.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(handleUnfoldedRCBack)] autorelease];
    
    [self presentViewController:navigationC animated:YES completion:nil];
}

- (void)handleUnfoldedRCBack {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)clickHeroListButton {
    
    UINavigationController *navigationC = [[[UINavigationController alloc] initWithRootViewController:self.unfoldedRHLC] autorelease];
    
    _unfoldedRHLC.navigationItem.title = @"英雄榜";
    
    _unfoldedRHLC.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    _unfoldedRHLC.navigationController.navigationBar.translucent = NO;
    
    _unfoldedRHLC.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(handleUnfoldedRHLCBack)] autorelease];
    
    [self presentViewController:navigationC animated:YES completion:nil];
}

- (void)handleUnfoldedRHLCBack {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 内存警告
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
