//
//  UnfoldedHeroListShowTableController.h
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnfoldedHeroListShowTableController : UITableViewController

@property (nonatomic , assign) NSInteger tagInteger; // 接收传入的button tag值

#pragma mark - 根据tag值传值从网络读取数据
- (void) readDataFromNetWorkingByButtonTag:(NSInteger)number;

- (void)getButtonTag:(UIButton *)sender;

@end
