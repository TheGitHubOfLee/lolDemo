
//
//  UnfoldedListViewController.m
//  UnfoldedView
//
//  Created by lanouhn on 16/1/13.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "UnfoldedListViewController.h"
#import "UnfoldedListViewTemplate.h"
#import "UnfoldedBarViewController.h"
#import "UnfoldedTableViewController.h"

@interface UnfoldedListViewController ()<UnfoldedListViewTemplateDelegate>

@end

@implementation UnfoldedListViewController

- (void)dealloc
{
    
    [super dealloc];
}

-(void)loadView {
    
    UnfoldedListViewTemplate *unfoldedListVT = [[UnfoldedListViewTemplate alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 270)];
    
    unfoldedListVT.delegate = self;
    
    self.view = unfoldedListVT;
    
    [unfoldedListVT release];
}

#pragma mark - 执行协议方法
-(void)getBackUnfoldedListView:(UIButton *)sender {
    
    UnfoldedBarViewController *unfoldedLVC = (UnfoldedBarViewController *)self.parentViewController;
    
    [unfoldedLVC getButtonTittle:sender.titleLabel.text];
    
    UnfoldedTableViewController *unfoldedTVC = (UnfoldedTableViewController *)self.parentViewController.parentViewController.childViewControllers.firstObject;
    
    [unfoldedTVC readDataFromNetWorkingByServer:sender.tag];
    
    if (self.view.frame.size.height == 270) {
        
        _isOpen = YES;
    }
    
    if (_isOpen) {
        
        [UIView animateWithDuration:0.1 animations:^{
            
            self.view.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, -384);
            
            self.view.superview.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
        }];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
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
