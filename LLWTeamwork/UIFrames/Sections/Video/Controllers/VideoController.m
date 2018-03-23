//
//  VideoController.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/8.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "Header.h"

@interface VideoController ()

@end

@implementation VideoController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureUISegment];
    
}



- (void)configureUISegment{
    LGQNewestController *newestVC = [[[LGQNewestController alloc]initWithStyle:(UITableViewStylePlain)]autorelease];
    LGQCommentaryController *commentVC = [[[LGQCommentaryController alloc]init]autorelease];
    LGQMatchController *matchVC = [[[LGQMatchController alloc]init]autorelease];
    LGQMoreController *moreVC = [[[LGQMoreController alloc]init]autorelease];
//    newestVC.view.backgroundColor = [UIColor redColor];
    commentVC.view.backgroundColor = [UIColor yellowColor];
    matchVC.view.backgroundColor = [UIColor grayColor];
    newestVC.title = @"最新";
    commentVC.title = @"解说";
    matchVC.title = @"赛事";
    moreVC.title = @"更多";
    SCNavTabBarController *scnTC = [[[SCNavTabBarController alloc]initWithSubViewControllers:@[newestVC, commentVC, matchVC, moreVC]]autorelease];
//    scnTC.showArrowButton = YES;
//    scnTC.mainViewBounces = YES;
    
    [scnTC addParentController:self];

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
