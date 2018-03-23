//
//  LGQNovelWebController.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/23.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "LGQNovelWebController.h"
#import "Header.h"
@interface LGQNovelWebController ()

@end

@implementation LGQNovelWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:self.detailUrl];
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    UIWebView *webView = [[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 110)]autorelease];
    
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
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
