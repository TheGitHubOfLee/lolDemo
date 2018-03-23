//
//  WYLPageViewCell.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "WYLPageViewCell.h"
#import "WYLPageView.h"
#import "UIImageView+WebCache.h"
#import "DCPicScrollView.h"
#import "AFNetworking.h"
@interface WYLPageViewCell ()

@property (nonatomic, retain) UIImageView *photoView;
@property (nonatomic, retain) NSMutableArray *dataSource;
@property (nonatomic, retain) WYLPageView *pageView;
@property (nonatomic, retain) NSMutableArray *pageViewArray;
@end
@implementation WYLPageViewCell
- (void)dealloc
{
    self.photoView = nil;
    self.dataSource = nil;
    self.pageView = nil;
    [super dealloc];
}

- (void)setValueForPhotoViewByPageView:(WYLPageView *)pageView {
    NSURL *url = [NSURL URLWithString:pageView.image_url_big];
    [self.photoView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"girl"]];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.photoView];
//        [self readDataFromNetWork];
        [self readPageViewDataFromNetWork];
    }
    return self;
}

- (NSMutableArray *)pageViewArray {
    if (!_pageViewArray) {
        self.pageViewArray = [NSMutableArray array];
    }
    return [[_pageViewArray retain] autorelease];
}

- (UIImageView *)photoView {
    if (!_photoView) {
        self.photoView = [[[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, 320, 150))] autorelease];
        _photoView.backgroundColor = [UIColor cyanColor];
    }
    return [[_photoView retain] autorelease];
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [NSMutableArray array];
    }
    return [[_dataSource retain] autorelease];
}

- (void)readPageViewDataFromNetWork {
//    [self.dataSource removeAllObjects];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSString *urlString = @"http://qt.qq.com/static/pages/news/phone/c13_list_1.shtml";
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                NSLog(@"%@", responseObject);
        id obj = responseObject[@"list"];
        for (NSDictionary *dic in obj) {
            WYLPageView *pageView = [[WYLPageView alloc] init];
            [pageView setValuesForKeysWithDictionary:dic];
            self.pageView = pageView;
            NSLog(@"%@", self.pageView);
            [self.pageViewArray addObject:pageView.article_url];
            
            [self.dataSource addObject:pageView.image_url_big];
//            NSLog(@"%@", self.dataSource);
//            NSLog(@"%@", pageView.image_url_big);
        }
        DCPicScrollView *picView = [[DCPicScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 150) WithImageNames:self.dataSource];
        [picView setImageViewDidTapAtIndex:^(NSInteger index) {
            NSLog(@"%ld", index);
            UIWebView *webView = [[UIWebView alloc] initWithFrame:self.superview.bounds];
//            self.pageView.article_url = self.pageViewArray[index];
#pragma mark - 轮播图点击没做完
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://101.226.76.163/static/pages/news/phone/%@", self.pageView.article_url]];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            [webView loadRequest:request];
            [self.superview addSubview:webView];
        }];
        picView.AutoScrollDelay = 1.0;
        picView.placeImage = [UIImage imageNamed:@"girl"];
        [self addSubview:picView];
        [picView release];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@", error);
    }];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
