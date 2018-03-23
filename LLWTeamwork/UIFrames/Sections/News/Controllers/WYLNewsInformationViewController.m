//
//  WYLNewsInformationViewController.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/8.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "WYLNewsInformationViewController.h"
#import "WYLInformationCell.h"
#import "AFNetworking.h"
#import "WYLInformation.h"
#import "Header.h"
#import "WYLDetailViewController.h"
#define kInformationCell @"informationCell"


@interface WYLNewsInformationViewController ()

@property (nonatomic, retain) NSMutableArray *dataSource;
@property (nonatomic, assign) NSInteger page;
@end

@implementation WYLNewsInformationViewController
- (void)dealloc
{
    self.dataSource = nil;
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor yellowColor];
    
    [self readDataFromNetWork];
    // 注册cell
    [self.tableView registerClass:[WYLInformationCell class] forCellReuseIdentifier:kInformationCell];
    
    self.page = 1;
    [self addRefreshAndLoadMore];
    
    
    
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

// 读取数据
- (void)readDataFromNetWork {
    
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSString *urlString = [NSString stringWithFormat:kWYLNewsString, self.page];
    
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
//            NSLog(@"%@", currentArray);
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

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [NSMutableArray array];
    }
    return [[_dataSource retain] autorelease];
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
    WYLInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:kInformationCell forIndexPath:indexPath];
        // Configure the cell...
    WYLInformation *information = self.dataSource[indexPath.row];
    [cell setValueForSubViewsByInformation:information];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WYLInformation *information = self.dataSource[indexPath.row];
    WYLDetailViewController *detailVC = [[[WYLDetailViewController alloc] init]autorelease];
    detailVC.cID = information.cid;
    detailVC.information = information;
    [self.navigationController pushViewController:detailVC animated:YES];
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
