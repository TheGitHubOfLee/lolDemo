//
//  LGQCommentaryDetailController.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/13.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "Header.h"

@interface LGQCommentaryDetailController ()
@property(nonatomic, retain)NSMutableArray *dataSource;
@property (nonatomic, retain)LGQNewestCell *cell;
@property(nonatomic, retain)UITableView *NewView;

@end

@implementation LGQCommentaryDetailController

- (void)dealloc
{
    self.dataSource = nil;
    self.detailUrl = nil;
    self.NewView = nil;
    
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
}


- (void)addRefreshAndLoadMore{
    
    // 添加一个表头的刷新视图,block快中写入出现表头动画后要做的操作
    __block typeof(self)weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        
        //        NSLog(@"刷新界面");
        weakSelf.page = 1;
        
        [weakSelf readDataFromeNetWork];
        
    }];
    
    // 添加一个表尾加载视图, 在block块中写入表尾动画需要做的操作
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        //        NSLog(@"加载界面");
        
        weakSelf.page += 1;
        
        [weakSelf readDataFromeNetWork];
        
    }];
    
    
    
}

- (void)readDataFromeNetWork{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSString *str = [NSString stringWithFormat:kAllDetailHTTP3, self.page];
    NSString *urlString = [NSString stringWithFormat:@"%@%@",self.detailUrl, str];
//    NSLog(@"%@", urlString);
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
