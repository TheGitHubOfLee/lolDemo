//
//  UnfoldedTableViewCell.h
//  UnfoldedView
//
//  Created by lanouhn on 16/1/13.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UnfoldedModel;
@interface UnfoldedTableViewCellTemplate : UITableViewCell

#pragma mark - cell赋值
- (void)setValuesForCellByUnfoldedModel:(UnfoldedModel *)unfoldedModel;

@end
