

//
//  BarViewController.m
//  UnfoldedView
//
//  Created by lanouhn on 16/1/13.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "UnfoldedBarViewController.h"
#import "UnfoldedBarViewTemplate.h"
#import "UnfoldedListViewController.h"
#import "UnfoldedListViewTemplate.h"
#import "AppDelegate.h"

@interface UnfoldedBarViewController ()

{
    BOOL _isOpen;
}

@property (nonatomic , retain) UnfoldedListViewController *unfoldedListVC;




@end

@implementation UnfoldedBarViewController
#pragma mark - 重写deallo
- (void)dealloc
{
    self.unfoldedListVC = nil;
    
    self.titleButton = nil;
    
    [super dealloc];
}

#pragma mark - 懒加载
- (UnfoldedListViewController *)unfoldedListVC {
    
    if (!_unfoldedListVC) {
        self.unfoldedListVC = [[[UnfoldedListViewController alloc] init] autorelease];
    }
    return [[_unfoldedListVC retain] autorelease];
}

-(UIButton *)titleButton {
    
    if (!_titleButton) {
        
        self.titleButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        
        _titleButton.backgroundColor = [UIColor blackColor];
        
        _titleButton.titleLabel.tintColor = [UIColor whiteColor];
        
        [_titleButton setTitle:@"艾欧尼亚" forState:(UIControlStateNormal)];
        
        _titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        _titleButton.titleLabel.textAlignment = 1;
        
        _titleButton.tintColor = [UIColor whiteColor];
        
        _titleButton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30);
        
    }
    return [[_titleButton retain] autorelease];
}


#pragma mark - didLoad
-(void)loadView {
    
    UnfoldedBarViewTemplate *unfoldedBarVT = [[UnfoldedBarViewTemplate alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    self.view = unfoldedBarVT;
    
    [unfoldedBarVT release];
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureInterface];
    
    [self.view addSubview:self.titleButton];
    
    [_titleButton addTarget:self action:@selector(popupAreaViewByButton:) forControlEvents:(UIControlEventTouchUpInside)];
    
}


 - (void)configureInterface {

    
     // 添加子控制器
     [self addChildViewController:self.unfoldedListVC];
     
     // 初始化子视图
     _unfoldedListVC.view.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 270);
     
     _unfoldedListVC.view.backgroundColor = [UIColor grayColor];
    
     _unfoldedListVC.view.transform = CGAffineTransformTranslate (CGAffineTransformIdentity, 0, -500);
    
     // 将子视图添加到父视图
     [self.view addSubview:self.unfoldedListVC.view];
}

#pragma mark - 实现button触发事件
- (void)popupAreaViewByButton:(UIButton *)sender {
    
    if (self.view.frame.size.height == 320) {
        
        _isOpen = YES;
        
    }else {
        
        _isOpen = NO;
    }
    
    if (!_isOpen) {
        
        [UIView animateWithDuration:0.1 animations:^{
        
            self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 320);
            
            _unfoldedListVC.view.transform = CGAffineTransformTranslate (CGAffineTransformIdentity, 0, 0);
        }];

    } else {
        
        [UIView animateWithDuration:0.1 animations:^{
            
            self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
            
            self.unfoldedListVC.view.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, -500);
        }];
    }
}

- (void)getButtonTittle:(NSString *)valueStr
{
    [self.titleButton setTitle:valueStr forState:UIControlStateNormal];
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
