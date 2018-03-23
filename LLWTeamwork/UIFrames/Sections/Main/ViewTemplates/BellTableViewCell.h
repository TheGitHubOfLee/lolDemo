//
//  BellTableViewCell.h
//  SlideText9
//
//  Created by lanouhn on 16/1/11.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBProgressHUD;
@class BellCellModel;
/**
 {
 "data": [
 {
 "id": "1",
 "name": "一血",
 "path_url": "http://file.zhangyoubao.com/lol/ring/0/1.mp3"
 }
 }
 */

//@protocol BellTableViewCellDelegate <NSObject>
//
//// 点击播放按钮
////- (void)clickPlayIconByTapGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer;
//
//
//
//@end

@interface BellTableViewCell : UITableViewCell

#pragma mark - kvc赋值方法
- (void)passValueByBellCellModel:(BellCellModel *)bellCellModel;
@property (nonatomic , retain) UIImageView *playImageView; // 播放图标

// 设置代理对象
//@property (nonatomic , assign) id<BellTableViewCellDelegate>delegate; 

@end
