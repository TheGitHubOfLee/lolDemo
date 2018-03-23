//
//  WYLDetailOfLatestViewController.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/11.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "WYLDetailOfLatestViewController.h"
#import "WYLInformation.h"
#import "UIImageView+WebCache.h"
#import "Header.h"
#import "DataBase.h"
@interface WYLDetailOfLatestViewController ()<UMSocialUIDelegate>

@property (nonatomic, copy) NSString *detailUrl;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *videoView;
@property (nonatomic, retain) UIImageView *playImage;
@property (nonatomic, retain) NSString *aTitle;
@property (nonatomic, retain) NSString *url;
@end

@implementation WYLDetailOfLatestViewController
- (void)dealloc
{
    self.aTitle = nil;
    self.url = nil;
    self.titleLabel = nil;
    self.videoView = nil;
    self.detailUrl = nil;
    self.information = nil;
    self.playImage = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.videoView];
    [self.videoView addSubview:self.playImage];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-gengduo-2"] style:(UIBarButtonItemStylePlain) target:self action:@selector(barButtonAction:)]autorelease];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    self.videoView.userInteractionEnabled = YES;
    [self.videoView addGestureRecognizer:tap];
    [tap release];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(leftBarButtonAction:)];
    
    
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

- (void)tapAction:(UITapGestureRecognizer *)sender {
    
    
    
    
    LGQAVPlayerViewController *detailVC = [[[LGQAVPlayerViewController alloc]initWithUrl:self.detailUrl]autorelease];
    [self presentViewController:detailVC animated:YES completion:nil];

//    player2.delegate = self;
//    // 旋转
//    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//    appDelegate.isRotation = YES;
//    [self presentViewController:player2 animated:YES completion:nil];
    
}

//- (void)dismissViewController {
//    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//    appDelegate.isRotation = NO;
//}

// 赋值
- (void)setValueForSubViewsByLatestInformation:(WYLInformation *)information {
    self.aTitle = information.title;
    self.url = information.video_url;
    self.titleLabel.text = information.title;
    self.detailUrl = information.video_url;
//    self.videoView.image = [UIImage imageNamed:information.pic_url];
    // 加载图片
    NSURL *url = [NSURL URLWithString:information.pic_url];
    // 图片的异步加载
    [self.videoView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"girl"]];
//    [self.actionImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"picholder"]];
}

- (UIImageView *)playImage {
    
    if (!_playImage) {
        self.playImage = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)]autorelease];
        //        NSLog(@"%.f", self.picImage.center.y);
        //        self.playImage.center = self.picImage.center;
        _playImage.center = CGPointMake(self.videoView.frame.size.width / 2, self.videoView.frame.size.height / 2);
        _playImage.image = [UIImage imageNamed:@"PlayPressed_48px_560454_easyicon.net"];
    }
    return [[_playImage retain]autorelease];
    
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[[UILabel alloc] initWithFrame:(CGRectMake(20, 20, 200, 40))] autorelease];
//        _titleLabel.backgroundColor = [UIColor redColor];
    }
    return [[_titleLabel retain] autorelease];
}

- (UIImageView *)videoView {
    if (!_videoView) {
        self.videoView = [[[UIImageView alloc] initWithFrame:(CGRectMake(kWidth/10, 70, 4*kWidth/5, 160))] autorelease];
        
//        _videoView.backgroundColor = [UIColor greenColor];
    }
    return [[_videoView retain] autorelease];
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
