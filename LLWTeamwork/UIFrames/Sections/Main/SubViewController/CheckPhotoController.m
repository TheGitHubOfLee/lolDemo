

//
//  CheckPhoto.m
//  SlideText9
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "CheckPhotoController.h"
#import "ImageCellModel.h"
#import "UIImageView+WebCache.h"


@interface CheckPhotoController ()

@property (nonatomic , retain) ImageCellModel *imageCellModel;

@property (nonatomic , retain) UIScrollView *scrollView;


@end

@implementation CheckPhotoController

#pragma mark - 重写dealloc
- (void)dealloc
{
    self.dataSource = nil;
    
    self.scrollView = nil;
    
    self.imageCellModel = nil;
    
    self.scrollView = nil;
    
    [super dealloc];
}

#pragma mark - 懒加载
-(ImageCellModel *)imageCellModel {
    
    if (!_imageCellModel) {
        self.imageCellModel = [[ImageCellModel new] autorelease];
    }
    return [[_imageCellModel retain] autorelease];
}

- (UIScrollView *)scrollView {
    
    if (!_scrollView) {
        self.scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64)] autorelease];
        
        _scrollView.contentSize = CGSizeMake(kScreenWidth * self.dataSource.count, kScreenHeight - 64);
        
        _scrollView.pagingEnabled = YES;
        
        _scrollView.backgroundColor = [UIColor blackColor];
    }
    return [[_scrollView retain] autorelease];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureInterface];
    
    
    
}

- (void)configureInterface {
    
    self.scrollView.contentOffset = CGPointMake(self.dataSourceIndex * kScreenWidth, 0);
    
    [self.view addSubview:self.scrollView];
    
    
    
    for (int i = 0; i < self.dataSource.count; i ++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i , 0, kScreenWidth, kScreenHeight - 64)];
        
        ImageCellModel *imageCM = self.dataSource[i];
        
        imageView.contentMode = UIViewContentModeScaleToFill;
        

//        [imageView sd_setImageWithURL:[NSURL URLWithString:imageCM.pic_url] placeholderImage:[UIImage imageNamed:@"123.png"]];

        [imageView sd_setImageWithURL:[NSURL URLWithString:imageCM.pic_url] placeholderImage:[UIImage imageNamed:@"Picture_128px_1180712_easyicon.net"]];

        
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageCM.pic_url]];
        
        [self.scrollView addSubview:imageView];
        
        [imageView release];
    }
    
//    CGRect rect2 = CGRectMake(kScreenWidth / 2 - 70, kScreenHeight - 114, 140, 30);
//    
//    UIButton *downLoad = [self createButtontitle:@"下载本地" frame:rect2];
//    
//    downLoad.tintColor = [UIColor whiteColor];
//    
//    downLoad.backgroundColor = [UIColor orangeColor];
//    
//    downLoad.layer.cornerRadius = 3;
//    
//    [self.view addSubview:downLoad];
//    
//    [downLoad addTarget:self action:@selector(handledownLoad:) forControlEvents:(UIControlEventTouchUpInside)];
}

#pragma mark - 创建button
- (UIButton *)createButtontitle:(NSString *)title frame:(CGRect)rect {
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    
    button.frame = rect;
    
    [button setTitle:title forState:(UIControlStateNormal)];
    
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    return button;
}

#pragma mark - 实现button功能

- (void)handledownLoad:(UIButton *)sender {
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"警告!" message:@"确认下载图片么?" preferredStyle:(UIAlertControllerStyleAlert)];
    
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    __block typeof(self) weakSelf = self;
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
        // 获取沙盒路径
        NSString *stringPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        
//        NSLog(@"%@" , stringPath);
        
        //  创建文件管理器
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        
        // 创建文件夹的路径
        //    NSString *imagePath = [NSString stringWithFormat:@"%@/image" , stringPath];
        NSString *imagePath = [stringPath stringByAppendingPathComponent:@"image"];
        
        // 判断文件在该路径下是否存在,如果不存在就创建
        if (![[NSFileManager defaultManager] fileExistsAtPath:imagePath]) {
            
            [fileManager createDirectoryAtPath:imagePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        [fileManager release];
        // 找到当前图片在数组中的位置
        NSInteger n = weakSelf.scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
        
        weakSelf.imageCellModel = weakSelf.dataSource[n];
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_imageCellModel.pic_url]]];
        
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[imagePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@%@" , _imageCellModel.name , @".jpg"]] atomically:YES];
    }];
    
    [alertC addAction:cancel];
    
    [alertC addAction:confirm];
    
    [self presentViewController:alertC animated:YES completion:nil];
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
