
//
//  UnfoldedTableViewController.m
//  UnfoldedView
//
//  Created by lanouhn on 16/1/13.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "UnfoldedTableViewController.h"
#import "UnfoldedTableViewCellTemplate.h"
#define kUnfoldedTableViewCell @"unfoldedTableViewCell"
#import "AFNetworking.h"
#import "UnfoldedModel.h"
#import "MBProgressHUD.h"

@interface UnfoldedTableViewController ()

@property (nonatomic , retain) NSMutableArray *dataSource; // 存储数据源

@property (nonatomic , retain) NSMutableArray *urlDataSource; // 存储网址

@property (nonatomic , retain) MBProgressHUD *mbProgressHUD; // 菊花

@end

@implementation UnfoldedTableViewController

#pragma mark - 重写dealloc
-(void)dealloc {
    
    self.dataSource = nil;
    
    self.urlDataSource = nil;
    
    [super dealloc];
}

#pragma mark - 懒加载
-(NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        self.dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return [[_dataSource retain] autorelease];
}

-(NSMutableArray *)urlDataSource {
    
    if (!_urlDataSource) {
        
        self.urlDataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return [[_urlDataSource retain] autorelease];
}

-(MBProgressHUD *)mbProgressHUD {
    
    if (!_mbProgressHUD) {
        
        self.mbProgressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        _mbProgressHUD.labelText = @"拼命加载中";
    }
    return [[_mbProgressHUD retain] autorelease];
}

#pragma mark - didLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.urlDataSource = @[@"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?condition=0&server=%E7%94%B5%E4%BF%A1%E4%B8%80&i_=866654029856488&t_=1452046799679&p_=31382&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=meizuMartket&u_=&modle_=MX4&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E4%B8%80&condition=0&i_=866946022037276&t_=1452753117760&p_=25625&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E4%BA%8C&condition=0&i_=866946022037276&t_=1452753003013&p_=11384&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E4%B8%89&condition=0&i_=866946022037276&t_=1452753075475&p_=18770&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E5%9B%9B&condition=0&i_=866946022037276&t_=1452753209011&p_=29378&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E4%BA%94&condition=0&i_=866946022037276&t_=1452753269908&p_=32069&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E5%85%AD&condition=0&i_=866946022037276&t_=1452753294391&p_=15518&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E4%B8%83&condition=0&i_=866946022037276&t_=1452753320773&p_=4664&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E5%85%AB&condition=0&i_=866946022037276&t_=1452753340853&p_=4904&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E4%B9%9D&condition=0&i_=866946022037276&t_=1452753363480&p_=12785&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E5%8D%81&condition=0&i_=866946022037276&t_=1452753377357&p_=24416&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E5%8D%81%E4%B8%80&condition=0&i_=866946022037276&t_=1452753397798&p_=25739&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E5%8D%81%E4%BA%8C&condition=0&i_=866946022037276&t_=1452753425230&p_=18035&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E5%8D%81%E4%B8%89&condition=0&i_=866946022037276&t_=1452753439689&p_=31412&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E5%8D%81%E5%9B%9B&condition=0&i_=866946022037276&t_=1452753468693&p_=28424&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E5%8D%81%E4%BA%94&condition=0&i_=866946022037276&t_=1452753481988&p_=8309&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E5%8D%81%E5%85%AD&condition=0&i_=866946022037276&t_=1452753494764&p_=16637&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E5%8D%81%E4%B8%83&condition=0&i_=866946022037276&t_=1452753508974&p_=29267&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E5%8D%81%E5%85%AB&condition=0&i_=866946022037276&t_=1452753543755&p_=13610&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E5%8D%81%E4%B9%9D&condition=0&i_=866946022037276&t_=1452753559170&p_=29855&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%BD%91%E9%80%9A%E4%B8%80&condition=0&i_=866946022037276&t_=1452753589510&p_=30875&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%BD%91%E9%80%9A%E4%BA%8C&condition=0&i_=866946022037276&t_=1452753607383&p_=24494&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%BD%91%E9%80%9A%E4%B8%89&condition=0&i_=866946022037276&t_=1452753623952&p_=14201&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%BD%91%E9%80%9A%E5%9B%9B&condition=0&i_=866946022037276&t_=1452753635612&p_=19181&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%BD%91%E9%80%9A%E4%BA%94&condition=0&i_=866946022037276&t_=1452753651693&p_=7424&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%BD%91%E9%80%9A%E5%85%AD&condition=0&i_=866946022037276&t_=1452753665294&p_=18227&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%BD%91%E9%80%9A%E4%B8%83&condition=0&i_=866946022037276&t_=1452753691750&p_=7595&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E6%95%99%E8%82%B2%E4%B8%80&condition=0&i_=866946022037276&t_=1452753772478&p_=9779&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&"].mutableCopy;
    
    // 注册cell
    [self.tableView registerClass:[UnfoldedTableViewCellTemplate class] forCellReuseIdentifier:kUnfoldedTableViewCell];
    
//    self.tableView.separatorStyle = NO;
    
    [self.mbProgressHUD hide:YES afterDelay:1.0];
    
    [self.mbProgressHUD showAnimated:YES whileExecutingBlock:^{
        
        [self readDataFromNetWorking];
        
    } completionBlock:^{
        
        [_mbProgressHUD removeFromSuperview];
    }];
    
    
}

- (void)readDataFromNetWorking {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:self.urlDataSource[0] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *dataArray = responseObject[@"data"];
        
        NSInteger n = 0;
        
        for (NSDictionary *dic in dataArray) {
            
            UnfoldedModel *unfoldedModel = [UnfoldedModel new];
            
            [unfoldedModel setValuesForKeysWithDictionary:dic];
            
            n += 1;
            
            unfoldedModel.sortInteger = [NSString stringWithFormat:@"%ld" , n];
            
            [self.dataSource addObject:unfoldedModel];
            
            [unfoldedModel release];
        }
        
        
        
        [self.tableView reloadData];
        
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
    UnfoldedTableViewCellTemplate *cell = [tableView dequeueReusableCellWithIdentifier:kUnfoldedTableViewCell forIndexPath:indexPath];
    
    UnfoldedModel *unfoldedModel = self.dataSource[indexPath.row];
    
    [cell setValuesForCellByUnfoldedModel:unfoldedModel];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 90;
}


- (void)readDataFromNetWorkingByServer:(NSInteger)serverNumber {

    [self.dataSource removeAllObjects];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    [manager GET:self.urlDataSource[serverNumber - 200] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
    
    NSArray *dataArray = responseObject[@"data"];
    
    NSInteger n = 0;
    
    for (NSDictionary *dic in dataArray) {
        
        UnfoldedModel *unfoldedModel = [UnfoldedModel new];
        
        [unfoldedModel setValuesForKeysWithDictionary:dic];
        
        n += 1;
        
        unfoldedModel.sortInteger = [NSString stringWithFormat:@"%ld" , n];
        
        [self.dataSource addObject:unfoldedModel];
        
        [unfoldedModel release];
    }
    
    [self.tableView reloadData];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
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
