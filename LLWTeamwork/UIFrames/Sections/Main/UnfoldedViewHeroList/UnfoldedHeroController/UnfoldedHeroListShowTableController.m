


//
//  UnfoldedHeroListShowTableController.m
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "UnfoldedHeroListShowTableController.h"
#import "HeroListCellTemplate.h"
#import "HeroListModel.h"
#define kHeroListCellTemplate @"heroListCellTemplate"
#import "SVPullToRefresh.h" // 下拉刷新
#import "AFNetworking.h" // 网络请求

@interface UnfoldedHeroListShowTableController ()

@property (nonatomic , retain) NSMutableArray *dataSource; // 存储数据源

@property (nonatomic , retain) HeroListCellTemplate *heroListCellTemplate; // 创建自定义cell对象

@property (nonatomic , retain) HeroListModel *heroListModel; // 创建模型

@property (nonatomic , retain) NSMutableArray *urlDataSource; // 存储url

@end

@implementation UnfoldedHeroListShowTableController
#pragma mark - 重写dealloc
-(void)dealloc {
    
    self.dataSource = nil;
    
    self.heroListModel = nil;
    
    self.heroListCellTemplate = nil;
    
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

-(HeroListCellTemplate *)heroListCellTemplate {
    
    if (!_heroListCellTemplate) {
        
        self.heroListCellTemplate = [[[HeroListCellTemplate alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:kHeroListCellTemplate] autorelease];
        
        _heroListCellTemplate.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
    }
    return [[_heroListCellTemplate retain] autorelease];
}

-(HeroListModel *)heroListModel {
    
    if (!_heroListModel) {
        
        self.heroListModel = [[HeroListModel new] autorelease];
    }
    return [[_heroListModel retain] autorelease];
}

#pragma mark - didLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.urlDataSource = @[@"http://lol.zhangyoubao.com/apis/rest//RolesService/heroRanks?position=0&condition=0&page=1&i_=866654029856488&t_=1452046924952&p_=17201&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=meizuMartket&u_=&modle_=MX4&" , @"http://lol.zhangyoubao.com/apis/rest//RolesService/heroRanks?condition=0&page=1&position=0&i_=866946022037276&t_=1452864808696&p_=28433&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest//RolesService/heroRanks?condition=1&page=1&position=0&i_=866946022037276&t_=1452864945806&p_=19763&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest//RolesService/heroRanks?condition=2&page=1&position=0&i_=866946022037276&t_=1452865588501&p_=27848&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest//RolesService/heroRanks?condition=3&page=1&position=0&i_=866946022037276&t_=1452865623719&p_=13502&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest//RolesService/heroRanks?condition=4&page=1&position=0&i_=866946022037276&t_=1452865640020&p_=2405&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest//RolesService/heroRanks?condition=4&page=1&position=0&i_=866946022037276&t_=1452865687519&p_=24902&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest//RolesService/heroRanks?condition=4&page=1&position=1&i_=866946022037276&t_=1452865716177&p_=20876&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest//RolesService/heroRanks?condition=4&page=1&position=2&i_=866946022037276&t_=1452865727595&p_=25130&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest//RolesService/heroRanks?condition=4&page=1&position=3&i_=866946022037276&t_=1452865747685&p_=25400&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest//RolesService/heroRanks?condition=4&page=1&position=4&i_=866946022037276&t_=1452865773499&p_=12842&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&" , @"http://lol.zhangyoubao.com/apis/rest//RolesService/heroRanks?condition=4&page=1&position=5&i_=866946022037276&t_=1452865794122&p_=14711&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=sogouMartket&u_=&modle_=PLK-AL10&"].mutableCopy;
    
    // 注册cell
    [self.tableView registerClass:[HeroListCellTemplate class] forCellReuseIdentifier:kHeroListCellTemplate];
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        
        [self readDataFromNetWorking];
    }];
    
    [self readDataFromNetWorking];
}

- (void)readDataFromNetWorking {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    __block typeof(self) weakSelf = self;
    
    [manager GET:self.urlDataSource[0] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *dataArray = responseObject[@"data"];
        
        NSInteger n = 0;
        
        for (NSDictionary *dic in dataArray) {
            
            HeroListModel *heroLM = [HeroListModel new];
            
            n += 1;
            
            heroLM.sortInteger = [NSString stringWithFormat:@"%ld" , n];
            
            [heroLM setValuesForKeysWithDictionary:dic];
            
            [weakSelf.dataSource addObject:heroLM];
            
            [heroLM release];
        }
        
        [weakSelf.tableView.pullToRefreshView stopAnimating];
        
        [weakSelf.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark - 内存警告
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
    HeroListCellTemplate *cell = [tableView dequeueReusableCellWithIdentifier:kHeroListCellTemplate forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.heroListModel = self.dataSource[indexPath.row];
    
    switch (self.tagInteger) {
        case 0:
            
            [cell setValueByHeroListModel:_heroListModel];
            
            [cell setValueByHeroList012Model:_heroListModel];
            
            break;
            
        case 1:
            
            [cell setValueByHeroListModel:_heroListModel];
            
            [cell setValueByHeroList012Model:_heroListModel];
            
            break;
            
        case 2:
            
            [cell setValueByHeroListModel:_heroListModel];
            
            [cell setValueByHeroList012Model:_heroListModel];
            
            break;
            
        case 3:
            
            [cell setValueByHeroListModel:_heroListModel];
            
            [cell setValueByHeroList34Model:_heroListModel];
            
            break;
            
        case 4:
            
            [cell setValueByHeroListModel:_heroListModel];
            
            [cell setValueByHeroList34Model:_heroListModel];
            
            break;
            
        case  5:
            
            [cell setValueByHeroListModel:_heroListModel];
            
            [cell setValueByHeroList567891011Model:_heroListModel];
            
            break;
            
        case 6:
            
            [cell setValueByHeroListModel:_heroListModel];
            
            [cell setValueByHeroList567891011Model:_heroListModel];
            
            break;
            
        case 7:
            
            [cell setValueByHeroListModel:_heroListModel];
            
            [cell setValueByHeroList567891011Model:_heroListModel];
            
            break;
            
        case 8:
            
            [cell setValueByHeroListModel:_heroListModel];
            
            [cell setValueByHeroList567891011Model:_heroListModel];
            
            break;
            
        case 9:
            
            [cell setValueByHeroListModel:_heroListModel];
            
            [cell setValueByHeroList567891011Model:_heroListModel];
            
            break;
            
        case 10:
            
            [cell setValueByHeroListModel:_heroListModel];
            
            [cell setValueByHeroList567891011Model:_heroListModel];
            
            break;
            
        case 11:
            
            [cell setValueByHeroListModel:_heroListModel];
            
            [cell setValueByHeroList567891011Model:_heroListModel];
            
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 90;
}

-(void) readDataFromNetWorkingByButtonTag:(NSInteger)number {
    
    [self.dataSource removeAllObjects];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    __block typeof(self) weakSelf = self;
    
    [manager GET:self.urlDataSource[number] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *dataArray = responseObject[@"data"];
        
        NSInteger n = 0;
        
        for (NSDictionary *dic in dataArray) {
            
            HeroListModel *heroLM = [HeroListModel new];
            
            n += 1;
            
            heroLM.sortInteger = [NSString stringWithFormat:@"%ld" , n];
            
            [heroLM setValuesForKeysWithDictionary:dic];
            
            [weakSelf.dataSource addObject:heroLM];
            
            [heroLM release];
        }
        
        [weakSelf.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (void)getButtonTag:(UIButton *)sender {
    
    self.tagInteger = sender.tag - 230;
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
