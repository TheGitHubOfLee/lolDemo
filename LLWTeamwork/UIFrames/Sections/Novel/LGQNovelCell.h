//
//  LGQNovelCell.h
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/23.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGQNewest;

@interface LGQNovelCell : UITableViewCell

@property(nonatomic, retain)UILabel *timeLabel;
- (void)setValueForNewestCell:(LGQNewest *)newest;
@end
