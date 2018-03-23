//
//  LGQNewestDetailController.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "Header.h"
#import "DataBase.h"
@interface LGQNewestDetailController ()<UITableViewDataSource, UITableViewDelegate,UMSocialUIDelegate>

@property (nonatomic, retain) NSString *detailUrl;
@property (nonatomic, retain) NSString *aTitle;
@property (nonatomic, retain) NSString *desc;
@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *descLabel;
@property (nonatomic, retain) UIImageView *picImage;
@property (nonatomic, retain) UIImageView *playImage;
@property (nonatomic, retain) UITableView *moreView;
@property(nonatomic, retain)NSMutableArray *dataSource;
@property (nonatomic, retain)LGQNewestCell *cell;


@end

@implementation LGQNewestDetailController

- (void)dealloc
{
    self.dataSource = nil;
    self.moreView = nil;
    self.cell = nil;
    self.detailUrl = nil;
    self.aTitle = nil;
    self.desc = nil;
    self.imageUrl = nil;
    self.titleLabel = nil;
    self.descLabel = nil;
    self.picImage = nil;
    self.timeString = nil;
    self.playImage = nil;
    self.video = nil;
    self.moreView = nil;
    [super dealloc];
}



- (NSMutableArray *)dataSource{
    
    if (!_dataSource) {
        self.dataSource = [[[NSMutableArray alloc]initWithCapacity:0]autorelease];
    }
    return [[_dataSource retain]autorelease];
}



- (UIImageView *)playImage {

    if (!_playImage) {
        self.playImage = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)]autorelease];
//        NSLog(@"%.f", self.picImage.center.y);
//        self.playImage.center = self.picImage.center;
        _playImage.center = CGPointMake(self.picImage.frame.size.width / 2, self.picImage.frame.size.height / 2);
        _playImage.image = [UIImage imageNamed:@"PlayPressed_48px_560454_easyicon.net"];
    }
    return [[_playImage retain]autorelease];

}

//- (UILabel *)timeLabel {
//    if (!_timeLabel) {
//        self.timeLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kWidth - 100, 65 , 90, 20)]autorelease];
//        _timeLabel.font = [UIFont boldSystemFontOfSize:12];
////        _timeLabel.textColor = [UIColor whiteColor];
//        _timeLabel.textAlignment = 2;
//        
//    }
//    return [[_timeLabel retain]autorelease];
//}

- (UILabel *)titleLabel {

    if (!_titleLabel) {
        self.titleLabel = [[[UILabel alloc]initWithFrame:CGRectMake(15, 5 , kWidth - 20, 40)]autorelease];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    }
    return [[_titleLabel retain]autorelease];
}

- (UILabel *)descLabel {

    if (!_descLabel) {
        self.descLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kWidth / 8, 45, kWidth - kWidth / 8, 20)]autorelease];
        _descLabel.numberOfLines = 0;
        _descLabel.font = [UIFont boldSystemFontOfSize:13];
        _descLabel.textColor = [UIColor grayColor];
    }
    return [[_descLabel retain]autorelease];
}


- (UIImageView *)picImage {

    if (!_picImage) {
        self.picImage = [[[UIImageView alloc]initWithFrame:CGRectMake(kWidth / 10, 80 , kWidth / 1.25, kHeight / 3.5)]autorelease];
    }
    return [[_picImage retain]autorelease];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.picImage];
    [self.view addSubview:self.descLabel];
//    [self.view addSubview:self.timeLabel];
    [self.picImage addSubview:self.playImage];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"iconfont-gengduo-2"] style:(UIBarButtonItemStylePlain) target:self action:@selector(colletView:)]autorelease];
    
    UITapGestureRecognizer *tap = [[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleStarVideo:)]autorelease];
    self.picImage.userInteractionEnabled = YES;
    [self.picImage addGestureRecognizer:tap];

    [self configureMore];
    
}






- (void)colletView:(UIBarButtonItem *)button {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"收藏" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {

//        NSLog(@"收藏");
        
        if ([[DataBase shareDataBase] isCollecedvideo:self.video]) {
            [[DataBase shareDataBase] insertOneVideo:self.video];
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"收藏成功" message:@"收藏成功您可以在'我的视频收藏'里查看您收藏的资讯" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
            [alert addAction:action];
            
            [self presentViewController:alert animated:YES completion:nil];
        }else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"收藏失败" message:@"该视频已经被收藏" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
            [alert addAction:action];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    [alert addAction:action1];

    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:action3];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"分享" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action)  {
    
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:SDKAppKey
                                          shareText:@"你要分享的文字"
                                         shareImage:[UIImage imageNamed:@"123.png"]
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent, UMShareToRenren,nil]
                                           delegate:self];
    
    
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (void)handleStarVideo:(UITapGestureRecognizer *)tap{

    LGQAVPlayerViewController *detailVC = [[[LGQAVPlayerViewController alloc]initWithUrl:self.detailUrl]autorelease];
    [self presentViewController:detailVC animated:YES completion:nil];
    
//    detailVC.delegate = self;
////    //  旋转
//    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//    appDelegate.isRotation = YES;

}

//- (void)dismissViewController {
//    
//    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//    appDelegate.isRotation = NO;
//    
//}


- (void)setValueForDetailUrl:(LGQNewest *)newst {
    self.aTitle = newst.title;
    self.desc = newst.desc;
    self.imageUrl = newst.pic_url;
    self.detailUrl = newst.video_url;
    self.titleLabel.text = newst.title;
    self.descLabel.text = [NSString stringWithFormat:@"简介:%@ 丨 %@", newst.desc, self.timeString];
    NSURL *url = [NSURL URLWithString:newst.pic_url];
    [self.picImage sd_setImageWithURL:url];
}

- (void)configureMore{
    
    self.moreView = [[[UITableView  alloc]initWithFrame:CGRectMake(0, kHeight / 3.5 + 85, kWidth, kHeight - 40 - (kHeight / 3.5 + 100 + 55))]autorelease];
    
//    moreController.view.backgroundColor = [UIColor redColor];
    self.moreView.delegate = self;
    self.moreView.dataSource = self;
    [self.moreView registerClass:[LGQNewestCell class] forCellReuseIdentifier:kDetailCell];

    
    [self readDataFromeNetWork];
    
    
    [self.view addSubview:self.moreView];
    


}

- (void)readDataFromeNetWork{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    NSString *urlString = [NSString stringWithFormat:kNewestHTTP1];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    [manger GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id obj = responseObject[@"data"];
        for (NSDictionary *dic in obj) {
            LGQNewest *newest = [[[LGQNewest alloc]init]autorelease];
            [newest setValuesForKeysWithDictionary:dic];
            // news 添加到临时数组,不能直接添加到dataSource,否则会导致数据重复
            [self.dataSource addObject:newest];
           
        }
        /// block 块中的数据只能在block块中操作, 要操作这个数据也要在block块中操作.
               [self.moreView reloadData];
//         NSLog(@"%@", self.dataSource);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        NSLog(@"%@", error);
    }];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"%ld", self.dataSource.count);
    return self.dataSource.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.cell = [tableView dequeueReusableCellWithIdentifier:kDetailCell forIndexPath:indexPath];
    // Configure the cell...
    LGQNewest *newest = self.dataSource[indexPath.row];
    [_cell setValueForNewestCell:newest];
    return _cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 60;
}

-  (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LGQNewestDetailController *detailVC = [[[LGQNewestDetailController alloc]init]autorelease];
    detailVC.timeString = self.cell.timeLabel.text;
    LGQNewest *newest = self.dataSource[indexPath.row];
    
    [detailVC setValueForDetailUrl:newest];
    detailVC.video = newest;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"撸友们还看了:";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
