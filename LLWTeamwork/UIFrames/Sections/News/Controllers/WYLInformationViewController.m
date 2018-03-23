//
//  WYLInformationViewController.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/8.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "WYLInformationViewController.h"
#import "WYLLatestInformationViewController.h"
#import "WYLCompetitionInformationViewController.h"
#import "WYLNewsInformationViewController.h"
#import "WYLRecreationInformationViewController.h"
#import "SCNavTabBarController.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
@interface WYLInformationViewController ()

@property (nonatomic, retain) UIScrollView *scrollView;

@end

@implementation WYLInformationViewController
- (void)dealloc
{
    self.scrollView = nil;
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    WYLLatestInformationViewController *latestIVC = [[WYLLatestInformationViewController alloc] initWithStyle:(UITableViewStylePlain)];
    WYLCompetitionInformationViewController *competitionIVC = [[WYLCompetitionInformationViewController alloc] initWithStyle:(UITableViewStylePlain)];
    WYLNewsInformationViewController *newsIVC = [[WYLNewsInformationViewController alloc] initWithStyle:(UITableViewStylePlain)];
    WYLRecreationInformationViewController *recreationIVC = [[WYLRecreationInformationViewController alloc] initWithStyle:(UITableViewStylePlain)];
    latestIVC.title = @"最新";
    competitionIVC.title = @"赛事";
    newsIVC.title = @"新闻";
    recreationIVC.title = @"娱乐";
    SCNavTabBarController *scnTC = [[SCNavTabBarController alloc] initWithSubViewControllers:@[latestIVC, competitionIVC, newsIVC, recreationIVC]];
    [latestIVC release];
    [competitionIVC release];
    [newsIVC release];
    [recreationIVC release];
    [scnTC addParentController:self];
    [scnTC release];
    
    
    // Do any additional setup after loading the view.
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
