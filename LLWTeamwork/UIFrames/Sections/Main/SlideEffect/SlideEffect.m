//
//  SlideEffect.m
//  SlideText9
//
//  Created by lanouhn on 16/1/8.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "SlideEffect.h"
#import "LLWHomeViewController.h"
#import "Header.h"
#import "WYLInformationViewController.h"
#import "MainViewController.h"

@interface SlideEffect ()
{
    
    BOOL _isMain; // 判断是否是主视图
}

@property (nonatomic ,retain) LLWHomeViewController *LLWhomeVC;
@property (nonatomic, retain) LLWHomeViewController *tabBar;
@property (nonatomic, retain) UIViewController *broadSideViewController;
@property (nonatomic, retain) UIView *rightView;
@end

@implementation SlideEffect
#pragma mark - 重写dealloc
-(void)dealloc {
    
    self.LLWhomeVC = nil;
    self.tabBar = nil;
    self.broadSideViewController = nil;
    self.rightView = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (instancetype)initWithMainViewController:(UIViewController *)mainViewController broadSideViewController:(UIViewController *)broadSideViewController {
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"broadBackImage.png"]];
    // 添加子控制器
    [self addChildViewController:broadSideViewController];
    
//    UINavigationController *mainNC = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    
//    LLWHomeViewController *tabBar = [[LLWHomeViewController alloc] init];
    
    VideoController *videoVC = [[[VideoController alloc] init]autorelease];
    
    UINavigationController *videoNC = [[[UINavigationController alloc] initWithRootViewController:videoVC]autorelease];
    videoNC.navigationBar.translucent = NO;
    videoVC.title = @"视频";
    
    videoVC.tabBarItem.image = [UIImage imageNamed:@"iconfont-020film"];
    
    WYLInformationViewController *informationVC = [[[WYLInformationViewController alloc] init]autorelease];
    
    UINavigationController *informationNC = [[[UINavigationController alloc] initWithRootViewController:informationVC]autorelease];
    
    informationNC.navigationBar.translucent = NO;
    informationVC.title = @"资讯";
    informationVC.tabBarItem.image = [UIImage imageNamed:@"iconfont-005newspaper"];
    
    MainViewController *mainVC = [[[MainViewController alloc] init]autorelease];
    
    UINavigationController *mainNC = [[[UINavigationController alloc] initWithRootViewController:mainVC]autorelease];
    
    mainVC.title = @"更多";
    
    mainVC.tabBarItem.image = [UIImage imageNamed:@"iconfont-gengduo1"];
    
    
    LGQNovelController *novelVC = [[[LGQNovelController alloc] init]autorelease];
    
    UINavigationController *novelNC = [[[UINavigationController alloc] initWithRootViewController:novelVC]autorelease];
    
    novelVC.title = @"小说";
    
    novelVC.tabBarItem.image = [UIImage imageNamed:@"iconfont-033books"];

    
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    NSDictionary *dic = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:16.0], NSForegroundColorAttributeName : [UIColor whiteColor]};
    novelNC.navigationBar.tintColor = [UIColor whiteColor];
    novelNC.navigationBar.titleTextAttributes = dic;
    videoNC.navigationBar.tintColor = [UIColor whiteColor];
    
    
    videoNC.navigationBar.titleTextAttributes = dic;
    informationNC.navigationBar.tintColor = [UIColor whiteColor];
    
    informationNC.navigationBar.titleTextAttributes = dic;
    mainNC.navigationBar.titleTextAttributes = dic;
    
    self.LLWhomeVC = [[LLWHomeViewController new] autorelease];
    
    _LLWhomeVC.viewControllers = @[informationNC, videoNC ,novelNC, mainNC];
    
    mainViewController.navigationItem.title = self.barTittle;
    
    mainViewController.navigationController.navigationBar.barTintColor = [UIColor grayColor];
    
    [self addChildViewController:_LLWhomeVC];
    
    // 初始化视图
//    mainNC.view.frame = self.view.bounds;
    
    _LLWhomeVC.view.frame = self.view.bounds;
    
    broadSideViewController.view.frame = CGRectMake(kBroadViewInitializationCenterX, kScreenHeigth / 2, (kScreenWidth - kMainViewDistance) , kScreenHeigth);
    
    // 将子视图添加到父视图
    [self.view addSubview:broadSideViewController.view];
    
//    [self.view addSubview:mainNC.view];
    
    [self.view addSubview:_LLWhomeVC.view];
    
    // 主视图导航栏添加左Button

    mainVC.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"123"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:(UIBarButtonItemStylePlain) target:self action:@selector(handleMainViewControllerLeftBarButton:)]autorelease];
   
    
    videoVC.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"123"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:(UIBarButtonItemStylePlain) target:self action:@selector(handleMainViewControllerLeftBarButton:)]autorelease];
   
   
    informationVC.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"123"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:(UIBarButtonItemStylePlain) target:self action:@selector(handleMainViewControllerLeftBarButton:)]autorelease];
    
        novelVC.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"123"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:(UIBarButtonItemStylePlain) target:self action:@selector(handleMainViewControllerLeftBarButton:)]autorelease];
    
    
    mainVC.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    
    return self;
}



- (void)handleMainViewControllerLeftBarButton:(UIBarButtonItem *)sender {
    
//    UINavigationController *mainNC = self.childViewControllers.lastObject;
    
    self.tabBar = self.childViewControllers.lastObject;
    
    self.broadSideViewController = self.childViewControllers.firstObject;
    
    if (!_isMain) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            _tabBar.view.center = kMainViewCenter;
            
            _tabBar.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, kMainViewScale, kMainViewScale);
            
            _broadSideViewController.view.center = CGPointMake((kScreenWidth - kMainViewDistance) / 2, kScreenHeigth / 2);
            
            _broadSideViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
            
//            NSLog(@"%@" , _isMain ? @"YES" : @"NO");

        }];
        
//        _tabBar.view.userInteractionEnabled = NO;
        self.rightView = [[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds]autorelease];
        [self.tabBar.view addSubview:self.rightView];
        UITapGestureRecognizer * tap = [[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backTuTab)]autorelease];
        [self.rightView addGestureRecognizer:tap];
    }
//    }else {
//        
//        [UIView animateWithDuration:0.3 animations:^{
//            
//            _tabBar.view.center = self.view.center;
//            
//            _tabBar.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
//            
//            _broadSideViewController.view.center = CGPointMake(kBroadViewInitializationCenterX, kScreenHeigth / 2);
//            
//            _broadSideViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, kBroadViewInitializationScale, kBroadViewInitializationScale);
//        }];
//    }
//    _isMain = !_isMain;
}

- (void)backTuTab {
    [UIView animateWithDuration:0.3 animations:^{
        
        _tabBar.view.center = self.view.center;
        
        _tabBar.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
        
        _broadSideViewController.view.center = CGPointMake(kBroadViewInitializationCenterX, kScreenHeigth / 2);
        
        _broadSideViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, kBroadViewInitializationScale, kBroadViewInitializationScale);
    }];
//    _isMain = !_isMain;
//    NSLog(@"%@1" , _isMain ? @"YES" : @"NO");
    [self.rightView removeFromSuperview];
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
