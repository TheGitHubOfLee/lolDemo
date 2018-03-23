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

@interface WYLDetailOfLatestViewController ()

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *videoView;

@end

@implementation WYLDetailOfLatestViewController
- (void)dealloc
{
    self.titleLabel = nil;
    self.videoView = nil;
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.videoView];
}

- (void)addTpaGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
}

// 赋值
- (void)setValueForSubViewsByLatestInformation:(WYLInformation *)information {
    self.titleLabel.text = information.title;
//    self.videoView.image = [UIImage imageNamed:information.pic_url];
    // 加载图片
    NSURL *url = [NSURL URLWithString:information.pic_url];
    // 图片的异步加载
    [self.videoView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"girl"]];
//    [self.actionImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"picholder"]];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[[UILabel alloc] initWithFrame:(CGRectMake(20, 80, 200, 40))] autorelease];
        _titleLabel.backgroundColor = [UIColor redColor];
    }
    return [[_titleLabel retain] autorelease];
}

- (UIImageView *)videoView {
    if (!_videoView) {
        self.videoView = [[[UIImageView alloc] initWithFrame:(CGRectMake(30, 140, 260, 160))] autorelease];
        _videoView.backgroundColor = [UIColor greenColor];
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
