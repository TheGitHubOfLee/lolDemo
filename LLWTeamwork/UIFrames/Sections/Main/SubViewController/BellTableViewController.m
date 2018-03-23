
//
//  BellTableViewController.m
//  SlideText9
//
//  Created by lanouhn on 16/1/11.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "BellTableViewController.h"
#import "BellTableViewCell.h"
#define kBellTableViewCell @"bellCell"
#import "AFNetworking.h"
#import "BellCellModel.h"
#import "SVPullToRefresh.h"
#import "BellTableViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import "BellPalyer.h"
#import "Header.h"

@interface BellTableViewController ()
{
    BOOL _isPlay;
    

}
@property (nonatomic , retain) BellTableViewCell *bellTVC; // 创建自定义cell对象

@property (nonatomic , retain) NSMutableArray *dataSource; // 存储数据源

@property (nonatomic , assign) NSInteger page; // 网页页数

@property (nonatomic , retain) BellCellModel *bellCellModel; // 创建模型类

@property (nonatomic , assign) NSInteger selecteRow; // 当前选中的cell

@property (nonatomic , retain) AVPlayerItem *bellPlayerItems; // 铃声播放列表
@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation BellTableViewController

#pragma mark - 重写dealloc
-(void)dealloc {
    
    self.bellTVC = nil;
    
    self.dataSource = nil;
    
    self.bellCellModel = nil;
    
    self.bellPlayerItems = nil;
//    self.playImage1 = nil;
    self.hud = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    [super dealloc];
}

- (MBProgressHUD *)hud {
    if (!_hud) {
        self.hud = [[[MBProgressHUD alloc] initWithView:self.view.window]autorelease];
        //    [self.hud show:YES];
        [self.view.window addSubview:self.hud];
    }
    return [[_hud retain]autorelease];
}

#pragma mark - 懒加载
-(BellTableViewCell *)bellTVC {
    
    if (!_bellTVC) {
        self.bellTVC = [[[BellTableViewCell alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)] autorelease];
        
//        _bellTVC.delegate = self;
    }
    return [[_bellTVC retain] autorelease];
}

//- (UIImageView *)playImage1 {
//    if (!_playImage1) {
//        self.playImage1 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)]autorelease];
//        
//    }
//    return [[_playImage1 retain]autorelease];
//}

-(NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        self.dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return [[_dataSource retain] autorelease];
}

-(BellCellModel *)bellCellModel {
    
    if (!_bellCellModel) {
        
        self.bellCellModel = [[BellCellModel new] autorelease];
    }
    return [[_bellCellModel retain] autorelease];
}


#pragma mark - 主程序
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    hud.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 40, 17.5, 25, 25);
    // 注册cell
    [self.tableView registerClass:[self.bellTVC class] forCellReuseIdentifier:kBellTableViewCell];
    
    self.page = 1;

//    _bellTVC.delegate = self;
    
    [self readDataFromNetWorking];
    
    __block typeof(self) weakSelf = self;
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        
        weakSelf.page = 1;
        
        [weakSelf readDataFromNetWorking];
    } ];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
       
        if (weakSelf.page == 2) {
            
            [weakSelf.tableView.infiniteScrollingView stopAnimating];
        }
        
        weakSelf.page += 1;
        
        [weakSelf readDataFromNetWorking];

    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[BellPalyer shareBellPlayer].bellPlayer pause];
}

#pragma mark - 从网络读取数据
- (void)readDataFromNetWorking {
    
    NSString *stringPath = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/AroundService/ring?page=%ld&i_=866654029856488&t_=1452050646532&p_=21941&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=meizuMartket&u_=&modle_=MX4&" , self.page];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    __block typeof(self) weakSelf = self;
    
    [manager GET:stringPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *array = responseObject[@"data"];
        
        NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:0];
        
        for (NSDictionary *dic in array) {
            
            BellCellModel *bellCM = [BellCellModel new];
            
            [bellCM setValuesForKeysWithDictionary:dic];
            
            [newArray addObject:bellCM];
        }
        
        if (weakSelf.page == 1) {
            
            [weakSelf.dataSource removeAllObjects];
            
            [weakSelf.dataSource addObjectsFromArray:newArray];
            
            [weakSelf.tableView.pullToRefreshView stopAnimating];
            
        }else {
            
            [weakSelf.dataSource addObjectsFromArray:newArray];
            
            [weakSelf.tableView.infiniteScrollingView stopAnimating];
        }
        
        [weakSelf.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
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
    BellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kBellTableViewCell forIndexPath:indexPath];
    
//    if (!cell.delegate) {
//        cell.delegate = self;
//    }

    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    
    self.bellCellModel = self.dataSource[indexPath.row];
    
    [cell passValueByBellCellModel:_bellCellModel];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    self.playImage1.image = [UIImage imageNamed:@"Stop_Pressed_Blue_48px_560472_easyicon.net"];
//    self.bellTVC.playImageView.image = [UIImage imageNamed:@"Stop_Pressed_Blue_48px_560472_easyicon.net"];
//    self.bellTVC = (BellTableViewCell *)[[tapGestureRecognizer.view superview] superview];
    
//    NSIndexPath *indexNum = [self.tableView indexPathForCell:self.bellTVC];
   
    

    self.bellCellModel = self.dataSource[indexPath.row];
    
    self.bellPlayerItems = [[[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:_bellCellModel.path_url]]autorelease];
    
    
    [[BellPalyer shareBellPlayer].bellPlayer replaceCurrentItemWithPlayerItem:_bellPlayerItems];
    if (_isPlay) {
        [[BellPalyer shareBellPlayer].bellPlayer pause];
        _isPlay = NO;
        
    } else {
        [[BellPalyer shareBellPlayer].bellPlayer play];
        _isPlay = YES;
        [self.hud show:YES];
        [self.hud hide:YES afterDelay:1];
    }
    [[BellPalyer shareBellPlayer].bellPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        
        _isPlay = NO;
        
        
    }];
//    [self.bellTVC.playImageView removeFromSuperview];
//    [self.bellTVC.contentView addSubview:self.playImage1];
//[hud hide:YES afterDelay:1];
//    NSLog(@"停止");

}

#pragma mark - 实现代理方法
//- (void)clickPlayIconByTapGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer {
//
//    self.bellTVC = (BellTableViewCell *)[[tapGestureRecognizer.view superview] superview];
//
//    NSIndexPath *indexNum = [self.tableView indexPathForCell:self.bellTVC];
//    
//    self.bellCellModel = self.dataSource[indexNum.row];
//    
//    self.bellPlayerItems = [[[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:_bellCellModel.path_url]]autorelease];
//    
////    NSLog(@"%@" , _bellCellModel.path_url);
//    
//    [[BellPalyer shareBellPlayer].bellPlayer replaceCurrentItemWithPlayerItem:_bellPlayerItems];
//    if (_isPlay) {
//         [[BellPalyer shareBellPlayer].bellPlayer pause];
//        _isPlay = NO;
//    } else {
//    [[BellPalyer shareBellPlayer].bellPlayer play];
//        _isPlay = YES;
//        
//    }
//    [[BellPalyer shareBellPlayer].bellPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
//        
//    }];
//}


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
