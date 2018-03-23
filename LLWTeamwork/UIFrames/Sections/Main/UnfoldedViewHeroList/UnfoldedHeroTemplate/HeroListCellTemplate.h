//
//  HeroListCellTemplate.h
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeroListModel;
@interface HeroListCellTemplate : UITableViewCell

#pragma mark - 重新布置cell控件
- (void)setValueByHeroListModel:(HeroListModel *)heroListModel;

- (void)setValueByHeroList012Model:(HeroListModel *)heroListModel;

- (void)setValueByHeroList34Model:(HeroListModel *)heroListModel;

- (void)setValueByHeroList567891011Model:(HeroListModel *)heroListModel;

@end
