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
#define kInformationCell @"informationCell"
#define kPageViewCell @"pageViewCell"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
@interface WYLLatestInformationViewController ()
@property (nonatomic, retain) NSMutableArray *dataSource;
@property (nonatomic, retain) NSMutableArray *pageImageViewSource;

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
//    [self readPageViewDataFromNetWork];
    
    
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
    [self.dataSource removeAllObjects];
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSString *urlString = @"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10178&cattype=news&page=1&i_=866654029856488&t_=1452220577296&p_=24233&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=meizuMartket&u_=&modle_=MX4&";
    __block typeof(self)weakSelf = self;
    [manger GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@", responseObject);
        id obj = responseObject[@"data"];
        for (NSDictionary *dic in obj) {
            WYLInformation *information = [[WYLInformation alloc] init];
            [information setValuesForKeysWithDictionary:dic];
//            NSLog(@"%.f", information.published);
            NSLog(@"%@", information.cid);
            [self.dataSource addObject:information];
            [information release];
        }
        [weakSelf.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@", error);
    }];
}

- (void)readPageViewDataFromNetWork {
    [self.pageImageViewSource removeAllObjects];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSString *urlString = @"http://qt.qq.com/static/pages/news/phone/c13_list_1.shtml";
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@", responseObject);
        id obj = responseObject[@"list"];
        for (NSDictionary *dic in obj) {
            WYLPageView *pageView = [[WYLPageView alloc] init];
            [pageView setValuesForKeysWithDictionary:dic];
            [self.pageImageViewSource addObject:pageView.image_url_big];
//            NSLog(@"%@", self.pageImageViewSource);
//            NSLog(@"%@", pageView.image_url_big);
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
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
        return 95;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 0) {
        WYLInformation *information = self.dataSource[indexPath.row];
        WYLDetailOfLatestViewController *detaiVC = [[WYLDetailOfLatestViewController alloc] init];
        // 如果information的video_url不为空
        if (0 == information.video_url.length) {
            
            UIWebView *webView = [[UIWebView alloc] initWithFrame:detaiVC.view.bounds];
            [detaiVC.view addSubview:webView];
            
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://lol.zhangyoubao.com/mobiles/item/%@", information.cid]];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            [webView loadRequest:request];
            
            [self.navigationController pushViewController:detaiVC animated:YES];
        }else {
            [detaiVC setValueForSubViewsByLatestInformation:information];
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
