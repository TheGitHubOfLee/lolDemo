//
//  ImageShowViewController.m
//  SlideText9
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "ImageShowViewController.h"
#import "ImageCellTemplate.h"
#define kImageCellTemPlate @"imageCellTemplate"
#import "ImageCellModel.h"
#import "AFNetworking.h"
#import "SVPullToRefresh.h"
#import "MBProgressHUD.h"
#import "CheckPhotoController.h"



@interface ImageShowViewController ()<UICollectionViewDelegate , UICollectionViewDelegateFlowLayout , UICollectionViewDataSource>

@property (nonatomic , retain) UICollectionView *collectionView; // 创建集合视图对象

@property (nonatomic , retain) NSMutableArray *dataSource; // 存储图片对象

@property (nonatomic , assign) NSInteger page; // 页数

@property (nonatomic , retain) UIActivityIndicatorView *activityIV; // 加载指示器

@property (nonatomic , retain) UILabel *label; // 显示图片已经加载完了:文字

@property (nonatomic , retain) UILabel *backLabel; // 半透明背景

@end

@implementation ImageShowViewController

#pragma mark - 重写dealloc
- (void)dealloc
{
    self.collectionView = nil;
    
    self.dataSource = nil;
    
    self.activityIV = nil;
    
    self.label = nil;
    
    self.backLabel = nil;
    
    
    
    [super dealloc];
}

#pragma mark - 懒加载
-(NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        self.dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return [[_dataSource retain] autorelease];
}

-(UICollectionView *)collectionView {
    
    if (!_collectionView) {
        self.collectionView = [[[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds] autorelease];
    }
    return [[_collectionView retain] autorelease];
}

-(UIActivityIndicatorView *)activityIV {
    
    if (!_activityIV) {
        self.activityIV = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 40) / 2, [UIScreen mainScreen].bounds.size.height / 2, 40, 40)] autorelease];
        
        _activityIV.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        
        _activityIV.backgroundColor = [UIColor blackColor];
        
        _activityIV.color = [UIColor redColor];
        
        [_activityIV startAnimating];
    }
    return [[_activityIV retain] autorelease];
}

-(UILabel *)backLabel {
    
    if (!_backLabel) {
        self.backLabel = [[[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 150) / 2, 448, 150, 30)] autorelease];
        
        _backLabel.backgroundColor = [UIColor grayColor];
        
        _backLabel.alpha = 0;
        
        [self.view addSubview:_backLabel];
    }
    return [[_backLabel retain] autorelease];
}

-(UILabel *)label {
    if (!_label) {
        self.label = [[[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 150) / 2, [UIScreen mainScreen].bounds.size.height - 124, 150, 30)] autorelease];
        
        _label.backgroundColor = [UIColor clearColor];
        
        _label.text = @"已经没有图片了";
        
        _label.hidden = YES;
        
        _label.layer.cornerRadius = 3;
        
//        _label.backgroundColor.
        
        _label.clipsToBounds = YES;
        
//        _label.alpha = 0.5;
        
        _label.textAlignment = NSTextAlignmentCenter;
        
        _label.textColor = [UIColor whiteColor];
        
        [self.view addSubview:_label];
    }
    return [[_label retain] autorelease];
}



#pragma mark - 加载主程序
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    hud.mode = MBProgressHUDAnimationFade;//枚举类型不同的效果
    
    hud.labelText = @"loading";
    
    [self configurceInterface];
    
    self.page = 1;
    
    __block typeof(self) weakSelf = self;
    
    [self.collectionView addPullToRefreshWithActionHandler:^{
        
        weakSelf.page = 1;
        
        [weakSelf.view addSubview:weakSelf.activityIV];
        
        [weakSelf readDataFromNetWorking];
        
    }];
    
    [self.collectionView addInfiniteScrollingWithActionHandler:^{
        
        
       
        weakSelf.page += 1;
        
        if (weakSelf.page == 4) {
//            NSLog(@"已经没有图片了");
            
            [UILabel animateWithDuration:2.0 animations:^{
                weakSelf.label.hidden = NO;
                
//                weakSelf.backLabel.alpha = 0.7;
                
            [NSTimer scheduledTimerWithTimeInterval:1.0 target:weakSelf selector:@selector(dalayLabelDisappear) userInfo:nil repeats:NO];
            }];
        }
        
        [weakSelf readDataFromNetWorking];
    }];
    
    [self readDataFromNetWorking];
}

- (void)dalayLabelDisappear {
    
    [UILabel animateWithDuration:2.0 animations:^{
        
//        self.backLabel.alpha = 0;
        
        self.label.hidden = YES;
    }];
}


#pragma mark - 网络解析数据
- (void)readDataFromNetWorking {
    
//    [self.dataSource removeAllObjects];
    
    // 创建网络地址
    NSString *urlString = [NSString stringWithFormat:@"http://api.lol.zhangyoubao.com/apis/rest/AroundService/paper?page=%ld&size=1152&i_=866654029856488&t_=1452046399359&p_=30422&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=meizuMartket&u_=&modle_=MX4&", self.page];
    
    // 网络请求
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    __block typeof(self) weakSelf = self;
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *arr = responseObject[@"data"];
        
        NSMutableArray *currentImage = [NSMutableArray arrayWithCapacity:0];
        
        for (NSDictionary *dic in arr) {
            
            ImageCellModel *imageCellModel = [[ImageCellModel alloc] init];
            
            [imageCellModel setValuesForKeysWithDictionary:dic];
            
            [currentImage addObject:imageCellModel];
            
            [imageCellModel release];
        }
        
        if (1 == weakSelf.page) {
            
            [weakSelf.dataSource removeAllObjects];
            
            [weakSelf.dataSource addObjectsFromArray:currentImage];
            
            [weakSelf.collectionView.pullToRefreshView stopAnimating];
        }else {
            
            [weakSelf.dataSource addObjectsFromArray:currentImage];
            
            [weakSelf.collectionView.infiniteScrollingView stopAnimating];
        }
        
        [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
        
        [weakSelf.collectionView reloadData];
        
        [weakSelf.activityIV stopAnimating];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


#pragma mark - 配置界面
-(void)configurceInterface {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 20) / 2, 120);
    
    layout.minimumLineSpacing = 5; // 设置最小行间距
    
    layout.minimumInteritemSpacing = 1; // 设置最小列间距
    
    layout.sectionInset = UIEdgeInsetsMake(2, 7.5, 5, 7.5);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    
    [layout release];
    
    _collectionView.backgroundColor = [UIColor grayColor];
    
    _collectionView.dataSource = self;
    
    _collectionView.delegate = self;
    
    [self.view addSubview:_collectionView];
    
    // 注册集合视图
    [_collectionView registerClass:[ImageCellTemplate class] forCellWithReuseIdentifier:kImageCellTemPlate];
    
    [_collectionView release];
}




#pragma mark - 创建collectionCell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCellTemplate *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCellTemPlate forIndexPath:indexPath];
    
    ImageCellModel *imageCellModel = self.dataSource[indexPath.row];
    
    [cell setImageForCellByImageCellModel:imageCellModel];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CheckPhotoController *checkPhotoC = [[CheckPhotoController new] autorelease];
    
    checkPhotoC.dataSource = [NSArray arrayWithArray:self.dataSource];
    
    checkPhotoC.dataSourceIndex = indexPath.row;

    
    [self.navigationController pushViewController:checkPhotoC animated:YES];
    
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
