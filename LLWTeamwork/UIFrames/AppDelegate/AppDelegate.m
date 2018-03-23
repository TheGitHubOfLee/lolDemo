//
//  AppDelegate.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/7.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "AppDelegate.h"
#import "LLWHomeViewController.h"
#import "Header.h"
#import "MainViewController.h"
#import "BroadSideViewController.h"
#import "SlideEffect.h"
#import "BellPalyer.h"

@interface AppDelegate ()
@property (nonatomic, retain)ZWIntroductionViewController *introductionView;
@property (nonatomic, retain) UIAlertController *alert;

@end

@implementation AppDelegate

- (void)dealloc
{
    self.window = nil;
    self.introductionView = nil;
    [super dealloc];
}




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]autorelease];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    // Override point for customization after application launch.
    [UMSocialData setAppKey:SDKAppKey];
//    [NSThread sleepForTimeInterval:0.1];
    
    MainViewController *mainVC = [MainViewController new];
    
    BroadSideViewController *broadSVC = [BroadSideViewController new];
    
    SlideEffect *slide = [[SlideEffect alloc] initWithMainViewController:mainVC broadSideViewController:broadSVC];
    
    self.window.rootViewController = slide;
    
    [mainVC release];
    
    [broadSVC release];
    
    [slide release];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    BOOL isFirst = [[NSUserDefaults standardUserDefaults] boolForKey:@"NB"];
    if (!isFirst) {
        
        
        [self configureZWIntroductionViewController];
    }
    
//    NSLog(@"%@" , NSHomeDirectory());
    [self JudgeNetstate];

    return YES;

}

- (void)configureZWIntroductionViewController{
    

    // Added Introduction View Controller
    NSArray *coverImageNames = @[@"img_index_01txt", @"img_index_02txt", @"img_index_03txt"];
    NSArray *backgroundImageNames = @[@"img_index_01bg", @"img_index_02bg", @"img_index_03bg"];
    
    self.introductionView = [[[ZWIntroductionViewController alloc] initWithCoverImageNames:coverImageNames backgroundImageNames:backgroundImageNames]autorelease];
    
    // Example 1 : Simple
//        self.introductionView = [[ZWIntroductionViewController alloc] initWithCoverImageNames:backgroundImageNames];
    
    // Example 2 : Custom Button
//        UIButton *enterButton = [UIButton new];
//        [enterButton setBackgroundImage:[UIImage imageNamed:@"bg_bar"] forState:UIControlStateNormal];
//        self.introductionView = [[ZWIntroductionViewController alloc] initWithCoverImageNames:coverImageNames backgroundImageNames:backgroundImageNames button:enterButton];
    
    [self.window addSubview:self.introductionView.view];
    
    __block AppDelegate *weakSelf = self;
    self.introductionView.didSelectedEnter = ^() {
//         [self.introductionView.view removeFromSuperview];
        weakSelf.introductionView = nil;
    };
}




- (void)applicationWillResignActive:(UIApplication *)application {

    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[BellPalyer shareBellPlayer].bellPlayer pause];

    }

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 判断网络环境
- (void)JudgeNetstate {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"当前未知网络" preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
                [alert addAction:action];
                [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"当前无网络" preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
                [alert addAction:action];
                [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"当前3G/4G网络,请注意您的流量" preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
                [alert addAction:action];
                [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                UIAlertController *alert4 = [UIAlertController alertControllerWithTitle:nil message:@"当前WIFI网络,可以放心使用" preferredStyle:(UIAlertControllerStyleAlert)];
//                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
//                [alert4 addAction:action];
                
                [self.window.rootViewController presentViewController:alert4 animated:YES completion:nil];
                [alert4 dismissViewControllerAnimated:YES completion:nil];
                
            }
                break;
            default:
                break;
        }
    }];
}





@end
