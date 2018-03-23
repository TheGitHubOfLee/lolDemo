//
//  WYLDetailViewController.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "WYLDetailViewController.h"
#import "Header.h"
#import "DataBase.h"
#import "WYLInformation.h"
@interface WYLDetailViewController ()<UMSocialUIDelegate>
@property (nonatomic, retain)NSString *urlString;
@end

@implementation WYLDetailViewController
- (void)dealloc
{
    self.cID = nil;
    self.urlString = nil;
    self.information = nil;
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 113)];
    [self.view addSubview:webView];
    webView.scalesPageToFit = YES;
    [webView release];
    self.urlString = [NSString stringWithFormat:kWYLUrl, self.cID, kWYLDetailUrl];
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-gengduo-2"] style:(UIBarButtonItemStylePlain) target:self action:@selector(barButtonAction:)]autorelease];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(leftBarButtonAction:)];
    
    // Do any additional setup after loading the view.
}

- (void)leftBarButtonAction:(UIBarButtonItem *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    [self removeFromParentViewController];
}

- (void)barButtonAction:(UIBarButtonItem *)sender {
//    NSLog(@"收藏");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"收藏" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"收藏");
        if ([[DataBase shareDataBase] isCollecedInformation:self.information]) {
            [[DataBase shareDataBase] insertOneInformation:self.information];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"收藏成功" message:@"收藏成功您可以在'我的资讯收藏'里查看您收藏的资讯" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
            [alert addAction:action];
            
            [self presentViewController:alert animated:YES completion:nil];
        }else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"收藏失败" message:@"该资讯已经被收藏" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
            [alert addAction:action];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    [alert addAction:action1];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:action3];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"分享" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action)  {
    
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:SDKAppKey
                                          shareText:@"你要分享的文字"
                                         shareImage:[UIImage imageNamed:@"123.png"]
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent, UMShareToRenren,nil]
                                           delegate:self];
    
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
    
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
