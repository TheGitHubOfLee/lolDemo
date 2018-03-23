
//
//  MineCollectionController.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/19.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "MineCollectionController.h"
#import "WYLInformationCell.h"
#define kWYLInformationCell @"wylInformationCell"
#import "Header.h"
#import "DataBase.h"
#import "WYLInformation.h"
#import "WYLDetailOfLatestViewController.h"
#define kLGQNewestCell @"lgqNewestCell"

@interface MineCollectionController ()

@property (nonatomic , retain) WYLInformationCell *wylInformationCell; // cell模板

@property (nonatomic , retain) NSMutableArray *dataInforSource; // 存储资讯数据源

@property (nonatomic , retain) NSMutableArray *dataVideoSource; // 存储视频数据源

@property (nonatomic , retain) WYLInformation *wylInformation; // 导入information模型

@property (nonatomic , retain) LGQNewest *lgqNewest; // 导入video模型

@end

@implementation MineCollectionController

#pragma mark - 重写dealloc
- (void)dealloc
{
    self.wylInformationCell = nil;
    
    self.dataInforSource = nil;
    
    self.wylInformation = nil;
    
    self.lgqNewest = nil;
    
    [super dealloc];
}

#pragma mark - 懒加载
- (WYLInformationCell *)wylInformationCell {
    
    if (!_wylInformationCell) {
        
        self.wylInformationCell = [[WYLInformationCell new] autorelease];
    }
    return [[_wylInformationCell retain] autorelease];
}

-(NSMutableArray *)dataInforSource {
    
    if (!_dataInforSource) {
        
        self.dataInforSource = [NSMutableArray arrayWithCapacity:0];
    }
    return [[_dataInforSource retain] autorelease];
}

- (NSMutableArray *)dataVideoSource {
    
    if (!_dataVideoSource) {
        
        self.dataVideoSource = [NSMutableArray arrayWithCapacity:0];
    }
    return [[_dataVideoSource retain] autorelease];
}

#pragma mark - didLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *inforArray = [[DataBase shareDataBase] selectAllInformations];
    
    [self.dataInforSource addObjectsFromArray:inforArray];
    
    NSArray *videoArray = [[DataBase shareDataBase] selectAllVideos];
    
    [self.dataVideoSource addObjectsFromArray:videoArray];
    
//    NSLog(@"%@" , _dataVideoSource);
    
    NSDictionary *dic = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:14.0], NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(handleBack:)];
    
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.titleTextAttributes = dic;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    // 注册informationcell
    [self.tableView registerClass:[WYLInformationCell class] forCellReuseIdentifier:kWYLInformationCell];
    
    // 注册videlcell
    [self.tableView registerClass:[LGQNewestCell class] forCellReuseIdentifier:kLGQNewestCell];
    
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
//    NSLog(@"%lu", self.navigationItem.leftBarButtonItem.retainCount);
    
    [self.navigationItem.leftBarButtonItem release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return self.dataInforSource.count;
    }else {
        
        return self.dataVideoSource.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        WYLInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:kWYLInformationCell forIndexPath:indexPath];
        
        WYLInformation *wylInfor = self.dataInforSource[indexPath.row];
        
        [cell setValueForSubViewsByInformation:wylInfor];
        
        return cell;
    }else {
        
        LGQNewestCell *cell = [tableView dequeueReusableCellWithIdentifier:kLGQNewestCell forIndexPath:indexPath];
        
        LGQNewest *lgqNewes = self.dataVideoSource[indexPath.row];
        
        [cell setValueForNewestCell:lgqNewes];
        
        return cell;
    }
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        UIView *view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)]autorelease];
        
        UIImageView *inforImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 4, 32, 30)];
        
        inforImage.image = [UIImage imageNamed:@"iconfont-zixun"];
        
        [view addSubview:inforImage];
        
        [inforImage release];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(60, 4, 150, 32)];
        
        label.text = @"资讯";
        
        [view addSubview:label];
        
        [label release];
        
        view.backgroundColor = [UIColor grayColor];
        
        return view;
    }else {
        
        UIView *view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)]autorelease];
        
        UIImageView *inforImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 4, 32, 30)];
        
        inforImage.image = [UIImage imageNamed:@"iconfont-shipin"];
        
        [view addSubview:inforImage];
        
        [inforImage release];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(60, 4, 150, 32)];
        
        label.text = @"电影";
        
        [view addSubview:label];
        
        [label release];
        
        view.backgroundColor = [UIColor grayColor];
        
        return view;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (0 == indexPath.section) {
        
        self.wylInformation = self.dataInforSource[indexPath.row];
        
        WYLDetailOfLatestViewController *detaiVC = [[[WYLDetailOfLatestViewController alloc] init]autorelease];
        
        // 如果information的video_url不为空
        if (0 == _wylInformation.video_url.length) {
            
            UIWebView *webView = [[[UIWebView alloc] initWithFrame:detaiVC.view.bounds]autorelease];
            [detaiVC.view addSubview:webView];
            
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:kWYLUrl, _wylInformation.cid, kWYLDetailUrl]];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            [webView loadRequest:request];
            detaiVC.information = _wylInformation;
            [self.navigationController pushViewController:detaiVC animated:YES];
            
        }else {
            
            [detaiVC setValueForSubViewsByLatestInformation:_wylInformation];
            
            self.navigationController.navigationBar.translucent = NO;
            
            [self.navigationController pushViewController:detaiVC animated:YES];
            
        }
    }else {
        
        self.lgqNewest = self.dataVideoSource[indexPath.row];
        
//        NSLog(@"%ld" , indexPath.row);
        
        LGQNewestDetailController *detailVC = [[[LGQNewestDetailController alloc]init]autorelease];
        
        [detailVC setValueForDetailUrl:_lgqNewest];
        
        detailVC.video = _lgqNewest;
        
        [self.navigationController pushViewController:detailVC animated:YES];
    }

}


#pragma mark - 模态回去
- (void)handleBack:(UIBarButtonItem *)barButton {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        if (indexPath.section == 0) {
            
            // 删除数据库
            self.wylInformation = self.dataInforSource[indexPath.row];
            
            [self.dataInforSource removeObject:_wylInformation];
            
            [[DataBase shareDataBase] deleteOneInformation:_wylInformation.title];
            
        }else {
            
            self.lgqNewest = self.dataVideoSource[indexPath.row];
            
            [self.dataVideoSource removeObject:_lgqNewest];
            
            [[DataBase shareDataBase] deleteOneVideo:_lgqNewest.title];
        }
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

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
