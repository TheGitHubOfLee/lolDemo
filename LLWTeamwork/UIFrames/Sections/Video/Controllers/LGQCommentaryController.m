//
//  LGQCommentaryController.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/12.
//  Copyright © 2016年 wangyulong. All rights reserved.
//


#import "Header.h"
@interface LGQCommentaryController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, retain)NSMutableArray *dataSource;
@property (nonatomic, retain)UICollectionView *collectionView;
@end

@implementation LGQCommentaryController

- (void)dealloc
{
    self.dataSource = nil;
    self.collectionView = nil;
    [super dealloc];
    
}

- (NSMutableArray *)dataSource {

    if (!_dataSource) {
        self.dataSource = [NSMutableArray array];
    }
    return [[_dataSource retain]autorelease];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureCollectionView];
}

- (void)configureCollectionView {

    UICollectionViewFlowLayout *layOut = [[[UICollectionViewFlowLayout alloc]init]autorelease];
    layOut.itemSize = CGSizeMake(80, 110);
    layOut.sectionInset = UIEdgeInsetsMake(10, 10, 40, 10);
    self.collectionView = [[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 120) collectionViewLayout:layOut]autorelease];
    // 配置属性
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[LGQAllCell class] forCellWithReuseIdentifier:kAllCell];
       [self readDataFromNetWork];
}

- (void)refreshView {

    [self readDataFromNetWork];
}


- (void)readDataFromNetWork {

    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSString *urlString = kALLHTTP;
    [manger GET:urlString parameters:self success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@", responseObject);
        NSArray *arr1 = responseObject[@"data"];
        NSDictionary *dic1 = arr1[1];
//        NSLog(@"%ld", arr1.count);
        NSArray *arr2 = dic1[@"catword_id"];
//        NSLog(@"%@",arr2);
        for (NSDictionary *dict in arr2) {
            LGQAllModel *model = [[[LGQAllModel alloc] init]autorelease];
            // KVC 赋值
            [model setValuesForKeysWithDictionary:dict];
            [self.dataSource addObject:model];
//             NSLog(@"%@",self.dataSource);
        }
        [self.collectionView reloadData];
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@", error);
        
    }];

}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataSource.count;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    LGQCommentaryDetailController *detailVC = [[[LGQCommentaryDetailController alloc]init]autorelease];
    LGQAllModel *model = self.dataSource[indexPath.row];
    detailVC.detailUrl =[NSString stringWithFormat:kAllDetailHttp1, model.Aid];

    [self.navigationController pushViewController:detailVC animated:YES];

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    LGQAllCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kAllCell forIndexPath:indexPath];
    LGQAllModel *model = self.dataSource[indexPath.item];
    [cell setValueForSubViewsWithModel:model];
    return cell;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
