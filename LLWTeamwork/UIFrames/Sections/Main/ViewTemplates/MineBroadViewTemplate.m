//
//  MineMainViewTemplate.m
//  SlideText9
//
//  Created by lanouhn on 16/1/8.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "MineBroadViewTemplate.h"
#import "SlideFunctionCell.h"
#import "BroadSideViewController.h"
#import "DataBase.h"
#define kSlideFunctionCell @"slideFunctionCell"
#import "MineCollectionController.h"

@interface MineBroadViewTemplate ()<UITableViewDelegate , UITableViewDataSource>

{
    
    BOOL _isDaytime;
}


@end

@implementation MineBroadViewTemplate

#pragma mark - 重写dealloc
- (void)dealloc
{
    self.headImageView = nil;
    
    self.nameLabel = nil;
    
    self.signatureLabel = nil;
    
    self.tableView = nil;
    
    self.cellText = nil;
    
    self.cellImageTitle = nil;
    
    self.setNightMode = nil;
    
    [super dealloc];
}

#pragma mark - 重写初始化方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self p_create];
        
        [self.tableView reloadData];
    }
    return self;
}

#pragma mark - 布局
- (void)p_create {
    
    [self addSubview:self.headImageView];
    
    [self addSubview:self.nameLabel];
    
    [self addSubview:self.signatureLabel];
    
    [self addSubview:self.tableView];
    
    [self addSubview:self.setNightMode];
    
    self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    
    
    
//    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"122.jpg"]];
    
    
}

#pragma mark - 懒加载
- (UIImageView *)headImageView {
    
    if (!_headImageView) {
        self.headImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 50, 60, 60)] autorelease];
        
        // 创建沙盒路径
        NSString *stringPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        
        // 创建文件路径
        NSString *photoImagePath = [stringPath stringByAppendingPathComponent:@"PhotoImage"];
        
        NSString *readPath = [photoImagePath stringByAppendingString:@"/photoImage.jpg"];
        
        NSData *data = [NSData dataWithContentsOfFile:readPath];
        
        _headImageView.image = [UIImage imageWithData:data];
        
        _headImageView.layer.cornerRadius = 30;
        
        UITapGestureRecognizer *tap = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHeaderImageView:)] autorelease];
        
        [_headImageView addGestureRecognizer:tap];

        _headImageView.userInteractionEnabled = YES;
        
        _headImageView.layer.masksToBounds = YES;
        
        _headImageView.image = [UIImage imageNamed:@"1cbdea2817a5884d7639cfa3d78ff8ea.jpg"];
    }
    
    return [[_headImageView retain] autorelease];
}

-(UILabel *)nameLabel {
    
    if (!_nameLabel) {
        self.nameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(90, 65, 120, 30)] autorelease];
        
        UITapGestureRecognizer *tap = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapNameLabel:)] autorelease];
        
        // 创建沙盒路径
        NSString *sandBoxStringPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        
        // 创建文件路径
        NSString *NickNameStringPath = [sandBoxStringPath stringByAppendingPathComponent:@"NickName"];
        
        NSString *readPath = [NickNameStringPath stringByAppendingString:@"/nickName.txt"];
        
        _nameLabel.text = [NSString stringWithContentsOfFile:readPath encoding:NSUTF8StringEncoding error:nil];
        
        [_nameLabel addGestureRecognizer:tap];
        
        _nameLabel.userInteractionEnabled = YES;
        
//        _nameLabel.backgroundColor = [UIColor redColor];
        _nameLabel.text = @"Lee Sin";
    }
    return [[_nameLabel retain] autorelease];
}

-(UILabel *)signatureLabel {
    if (!_signatureLabel) {
        self.signatureLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 115, 210, 30)] autorelease];
        
        UITapGestureRecognizer *tap = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSignatureLabel:)] autorelease];
        
        [_signatureLabel addGestureRecognizer:tap];
        
        // 创建沙盒路径
        NSString *sandBoxStringPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        
        // 创建文件路径
        NSString *signatureStringPath = [sandBoxStringPath stringByAppendingPathComponent:@"signature"];
        
        NSString *readPath = [signatureStringPath stringByAppendingString:@"/signature.txt"];
        
        _signatureLabel.text = [NSString stringWithContentsOfFile:readPath encoding:NSUTF8StringEncoding error:nil];
        
        _signatureLabel.text = @"我用双手成就你的梦想!";
        
        _signatureLabel.userInteractionEnabled = YES;
    }
    return [[_signatureLabel retain] autorelease];
}

-(NSArray *)cellText {
    
    if (!_cellText) {
//        self.cellText = @[@"我的收藏" , @"我的图片" , @"我的音乐" , @"清除缓存"];
        
        self.cellText = @[@"我的收藏" , @"清除缓存", @"免责声明"];
    }
    return [[_cellText retain] autorelease];
}

-(NSArray *)cellImageTitle {
    
    if (!_cellImageTitle) {
        self.cellImageTitle = @[@"Ezreal_Pulsefire_without_LoL_logo_96px_1128802_easyicon.net" , @"Fiora_Headmistress_96px_1128806_easyicon.net" , @"lee_sin_chinese_96px_1128836_easyicon.net" , @"Riven_Championship_96px_1128879_easyicon.net"];
    }
    return [[_cellImageTitle retain] autorelease];
}

#pragma mark - 创建cell
- (UITableView *)tableView {
    
    if (!_tableView) {
        self.tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2 - 50, [UIScreen mainScreen].bounds.size.width - 50, self.cellText.count * 50) style:(UITableViewStylePlain)] autorelease];
        
        [self.tableView registerClass:[SlideFunctionCell class] forCellReuseIdentifier:kSlideFunctionCell];
        
        _tableView.separatorStyle = NO;
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        _tableView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    }
    return [[_tableView retain] autorelease];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    NSLog(@"%ld" , self.cellText.count);
    
    return self.cellText.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SlideFunctionCell *cell = [tableView dequeueReusableCellWithIdentifier:kSlideFunctionCell forIndexPath:indexPath];
    
    cell.titleLabel.text = self.cellText[indexPath.row];
    
    cell.image.image = [UIImage imageNamed:self.cellImageTitle[indexPath.row]];
        
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.row) {
        [self.delegate clickMineCollectionByNSInteger:indexPath.row];

        
    }else if (1 == indexPath.row) {
        
        [self.delegate clickMineCollectionByNSInteger:indexPath.row];
    }else if (2 == indexPath.row) {
        
        [self.delegate clickMineCollectionByNSInteger:indexPath.row];
    }
}
    


#pragma mark - Button懒加载


-(UIButton *)setNightMode {
    
    if (!_setNightMode) {
        self.setNightMode = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        _setNightMode.frame = CGRectMake(160, [UIScreen mainScreen].bounds.size.height - 50, 95, 40);
        
        [_setNightMode setImage:[UIImage imageNamed:@"DaytimeModel.png"] forState:(UIControlStateNormal)];
        
        _isDaytime = !_isDaytime;
        
        [_setNightMode addTarget:self action:@selector(handleSetNightMode:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return [[_setNightMode retain] autorelease];
}

- (void)handleSetNightMode:(UIButton *)sender {
    
    if (!_isDaytime) {
        
        [sender setImage:[UIImage imageNamed:@"DaytimeModel.png"] forState:(UIControlStateNormal)];
        
        self.window.alpha = 1.0;
        
        _isDaytime = !_isDaytime;
    }else {

        [sender setImage:[UIImage imageNamed:@"NightModel.png"] forState:(UIControlStateNormal)];
        
        self.window.alpha = 0.5;
        
        _isDaytime = !_isDaytime;
    }
}


#pragma mark - 实现手势方法
- (void)tapHeaderImageView:(UIGestureRecognizer *)tap {
    
    [self.delegate addPhotoImageBy:tap];
}

- (void)tapNameLabel:(UITapGestureRecognizer *)tap {
    
    [self.delegate writeNameTittleBy:tap];
}

- (void)tapSignatureLabel:(UITapGestureRecognizer *)tap {
    
    [self.delegate writeSignatureBy:tap];
}


@end
