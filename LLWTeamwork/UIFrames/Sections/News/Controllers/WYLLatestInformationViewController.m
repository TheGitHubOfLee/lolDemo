//
//  WYLLatestInformationViewController.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/8.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "WYLLatestInformationViewController.h"
#import "WYLInformation.h"
#import "WYLInformationCell.h"
#import "WYLPageViewCell.h"
#import "AFNetworking.h"
#import "WYLPageView.h"
#import "DCPicScrollView.h"
#import "WYLDetailOfLatestViewController.h"
#import "Header.h"
#define kInformationCell @"informationCell"
#define kPageViewCell @"pageViewCell"

@interface WYLLatestInformationViewController ()

@property (nonatomic, retain) NSMutableArray *dataSource;
@property (nonatomic, retain) NSMutableArray *pageImageViewSource;
@property (nonatomic, assign) NSInteger page; // 页数


@end

@implementation WYLLatestInformationViewController
- (void)dealloc
{
    self.dataSource = nil;
    self.pageImageViewSource = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    
    [self.tableView registerClass:[WYLInformationCell class] forCellReuseIdentifier:kInformationCell];
    [self.tableView registerClass:[WYLPageViewCell class] forCellReuseIdentifier:kPageViewCell];
    [self readDataFromNetWork];
    [self readPageViewDataFromNetWork];
    // 刷新
    self.page = 1;
    // 添加上拉加载,下拉刷新
    [self addRefreshAndLoadMore];
    
    [self.tableView triggerPullToRefresh];
    
}



// 刷新
- (void)addRefreshAndLoadMore {
    // 添加一个表头的刷新视图,block块中写入出现表头动画后要做的操作
    [self.tableView addPullToRefreshWithActionHandler:^{
        self.page = 1;
        [self readDataFromNetWork];
    }];
    
    // 添加一个表尾视图
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        self.page += 1;
        [self readDataFromNetWork];
    }];
}


- (NSMutableArray *)pageImageViewSource {
    if (!_pageImageViewSource) {
        self.pageImageViewSource = [NSMutableArray array];
    }
    return [[_pageImageViewSource retain] autorelease];
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [NSMutableArray array];
    }
    return [[_dataSource retain] autorelease];
}

- (void)readDataFromNetWork {
    
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSString *urlString = [NSString stringWithFormat:kWYLLatestSring, self.page];
    
    [manger GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@", responseObject);
        id obj = responseObject[@"data"];
        // 创建一个临时数组
        NSMutableArray *currentArray = [NSMutableArray array];
        
        for (NSDictionary *dic in obj) {
            WYLInformation *information = [[WYLInformation alloc] init];
            [information setValuesForKeysWithDictionary:dic];
//            NSLog(@"%.f", information.published);
            
            [currentArray addObject:information];
//            [self.dataSource addObject:information];
            [information release];
        }
        if (1 == self.page) {
            [self.dataSource removeAllObjects];
            [self.dataSource addObjectsFromArray:currentArray];
            [self.tableView.pullToRefreshView stopAnimating];
        }else {
            [self.dataSource addObjectsFromArray:currentArray];
            [self.tableView.infiniteScrollingView stopAnimating];
        }
        // 回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@", error);
    }];
}

// 轮播图数据
- (void)readPageViewDataFromNetWork {
    [self.pageImageViewSource removeAllObjects];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSString *urlString = @"http://qt.qq.com/static/pages/news/phone/c13_list_1.shtml";
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSLog(@"%@", responseObject);
        
        // 存储pageView.article_url的数组
        NSMutableArray *pageViewArray = [NSMutableArray array];
        
        id obj = responseObject[@"list"];
        WYLPageView *pageView = [[[WYLPageView alloc] init]autorelease];
        for (NSDictionary *dic in obj) {
            
            [pageView setValuesForKeysWithDictionary:dic];
            [self.pageImageViewSource addObject:pageView.image_url_big];
            [pageViewArray addObject:pageView.article_url];
            //            NSLog(@"%@", pageViewArray);
            //            NSLog(@"%@", self.pageImageViewSource);
            //            NSLog(@"%@", pageView.image_url_big);
            //            NSLog(@"%@", pageView.article_url);
            //            NSLog(@"%ld", pageView.article_url.length);
        }
        
        DCPicScrollView *picView = [[[DCPicScrollView alloc] initWithFrame:(CGRectMake(0, 0, kWidth, 150)) WithImageNames:self.pageImageViewSource]autorelease];
        [picView setImageViewDidTapAtIndex:^(NSInteger index) {
            pageView.article_url = pageViewArray[index];
            
            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 113)];
            
            if (pageView.article_url.length <= 22) {
                NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://101.226.76.163/static/pages/news/phone/%@", pageView.article_url]];
                NSURLRequest *request = [NSURLRequest requestWithURL:url];
                [webView loadRequest:request];
                WYLDetailOfLatestViewController *detaiVC = [[WYLDetailOfLatestViewController alloc] init];
                [detaiVC.view addSubview:webView];
                [webView release];
                [self.navigationController pushViewController:detaiVC animated:YES];
                [detaiVC release];
            }else {
                NSURL *url = [NSURL URLWithString:pageView.article_url];
                NSURLRequest *request = [NSURLRequest requestWithURL:url];
                [webView loadRequest:request];
                WYLDetailOfLatestViewController *detaiVC = [[WYLDetailOfLatestViewController alloc] init];
                [detaiVC.view addSubview:webView];
                [webView release];
                [self.navigationController pushViewController:detaiVC animated:YES];
                [detaiVC release];
            }
        }];
        picView.AutoScrollDelay = 3.0f;
        picView.placeImage = [UIImage imageNamed:@"girl"];
        [self.view addSubview:picView];
        
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@", error);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.row) {
        WYLPageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPageViewCell forIndexPath:indexPath];
        
        return cell;
    }
    WYLInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:kInformationCell forIndexPath:indexPath];
    WYLInformation *information = self.dataSource[indexPath.row];
    [cell setValueForSubViewsByInformation:information];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.row) {
        return 150;
    }else {
        return 70;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 0) {
        WYLInformation *information = self.dataSource[indexPath.row];
        WYLDetailOfLatestViewController *detaiVC = [[[WYLDetailOfLatestViewController alloc] init]autorelease];
        // 如果information的video_url不为空
        if (0 == information.video_url.length) {
            
            UIWebView *webView = [[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 113)]autorelease];
            [detaiVC.view addSubview:webView];
            
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:kWYLUrl, information.cid, kWYLDetailUrl]];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            [webView loadRequest:request];
            detaiVC.information = information;
            [self.navigationController pushViewController:detaiVC animated:YES];
        }else {
            [detaiVC setValueForSubViewsByLatestInformation:information];
            detaiVC.information = information;
            [self.navigationController pushViewController:detaiVC animated:YES];
        }
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
