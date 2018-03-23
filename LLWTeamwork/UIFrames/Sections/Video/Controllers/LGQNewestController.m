//
//  LGQNewestController.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/8.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "LGQNewestController.h"
#import "Header.h"
@interface LGQNewestController ()

@property(nonatomic, retain)NSMutableArray *dataSource;
@property(nonatomic, assign)NSInteger page;// 页数
@property (nonatomic, retain)LGQNewestCell *cell;
@end

@implementation LGQNewestController

- (void)dealloc
{
    self.dataSource = nil;
    self.cell = nil;
    [super dealloc];
}

- (NSMutableArray *)dataSource{

    if (!_dataSource) {
    self.dataSource = [[[NSMutableArray alloc]initWithCapacity:0]autorelease];
    }
    return [[_dataSource retain]autorelease];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[LGQNewestCell class] forCellReuseIdentifier:KVideoCell];
    self.page = 1; // 设置第一次请求的偏移量
    [self readDataFromeNetWork];
    [self addRefreshAndLoadMore];//添加上拉加载,下拉刷新
    
    [self.tableView triggerPullToRefresh];
}


- (void)addRefreshAndLoadMore{
    // 添加一个表头的刷新视图,block快中写入出现表头动画后要做的操作
    __block typeof(self)weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        //  NSLog(@"刷新界面");
        weakSelf.page = 1;
        [weakSelf readDataFromeNetWork];
        
    }];
    [self.tableView pullToRefreshView];
    // 添加一个表尾加载视图, 在block块中写入表尾动画需要做的操作
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        //        NSLog(@"加载界面");
        weakSelf.page += 1;
        [weakSelf readDataFromeNetWork];
    }];

}

- (void)readDataFromeNetWork{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSString *urlString = [NSString stringWithFormat:kNewestHTTP, self.page];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    [manger GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id obj = responseObject[@"data"];
        NSMutableArray *currentNews = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in obj) {
            LGQNewest *newest = [[[LGQNewest alloc]init]autorelease];
            [newest setValuesForKeysWithDictionary:dic];
            // news 添加到临时数组,不能直接添加到dataSource,否则会导致数据重复
            [currentNews addObject:newest];
        }
        /// block 块中的数据只能在block块中操作, 要操作这个数据也要在block块中操作.
        // 当page == 1时候, 停止表头的动画
        if (1 == self.page) {
            // 刷新之前 先把之前的数据清空
            [self.dataSource removeAllObjects];
            // 再加上最新的数据
            [self.dataSource addObjectsFromArray:currentNews];
            // 停止动画
            [self.tableView.pullToRefreshView stopAnimating];
        }else {// 当page != 1 的时候停止表尾的动画, 且数据越来越多, 此时吧最新请求下来的数据添加到dataSource中
            [self.dataSource addObjectsFromArray:currentNews];
            [self.tableView.infiniteScrollingView stopAnimating];
        }
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 70;

}

-  (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LGQNewestDetailController *detailVC = [[[LGQNewestDetailController alloc]init]autorelease];
    detailVC.timeString = self.cell.timeLabel.text;
    LGQNewest *newest = self.dataSource[indexPath.row];
   
    [detailVC setValueForDetailUrl:newest];
    detailVC.video = newest;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cell = [tableView dequeueReusableCellWithIdentifier:KVideoCell forIndexPath:indexPath];
    // Configure the cell...
    LGQNewest *newest = self.dataSource[indexPath.row];
    [_cell setValueForNewestCell:newest];
    return _cell;
}



@end
