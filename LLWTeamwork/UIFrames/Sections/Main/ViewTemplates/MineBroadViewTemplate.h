//
//  MineMainViewTemplate.h
//  SlideText9
//
//  Created by lanouhn on 16/1/8.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MineBroadViewTemplateDedelegate <NSObject>

- (void)addPhotoImageBy:(UIGestureRecognizer *)tap; // 将图片写入本地

- (void)writeNameTittleBy:(UITapGestureRecognizer *)tap; // 将昵称写入本地

- (void)writeSignatureBy:(UITapGestureRecognizer *)tap; // 将警示语写入本地

- (void)clickMineCollectionByNSInteger:(NSInteger)integer; // 点击收藏cell;

//- (void)clickMineCollectionByNSInteger:(NSInteger)integer

@end

@class BroadSideViewController;
@interface MineBroadViewTemplate : UIView

// 定义一个指针指向它的视图控制器
@property (nonatomic, assign) BroadSideViewController *broadSVC;

@property (nonatomic , retain) NSArray *cellText; // 功能列表detail名称

@property (nonatomic , retain) NSArray *cellImageTitle; // 功能列表image名称

@property (nonatomic , retain) UITableView *tableView; // 功能列表



@property (nonatomic , retain) UIImageView *headImageView; // 头像

@property (nonatomic , retain) UILabel *nameLabel; // 头像姓名

@property (nonatomic , retain) UILabel *signatureLabel; // 签名



@property (nonatomic , retain) UIButton *setNightMode; // 设置夜间模式

@property (nonatomic , assign) id<MineBroadViewTemplateDedelegate>delegate;


//- (void)setImageForHeaderImageViewBy:(UIImage *)image;

@end
