//
//  LGQNovelCell.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/23.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "LGQNovelCell.h"
#import "Header.h"

@interface LGQNovelCell ()
@property(nonatomic, retain)UILabel *titleLable;
@property(nonatomic, retain)UILabel *pubdateLable;

@end

@implementation LGQNovelCell

- (void)dealloc
{
    self.titleLable = nil;
    self.pubdateLable = nil;
    self.timeLabel = nil;
    [super dealloc];
}

- (void)setValueForNewestCell:(LGQNewest *)newest
{
    NSDate *publishedDate = [NSDate dateWithTimeIntervalSince1970:newest.published];
    NSTimeInterval time = [publishedDate timeIntervalSinceNow];
    
    if ((- time) < 60) {
        self.timeLabel.text = @"刚刚";
    }else if ((- time) < 3600) {
        self.timeLabel.text = [NSString stringWithFormat:@"%.f分钟之前",(- time) / 60];
    }else if ((- time) < (24 * 3600)) {
        self.timeLabel.text = [NSString stringWithFormat:@"%.f小时之前", (- time) /  3600];
    }else{
        NSDateFormatter *formatter = [[[NSDateFormatter alloc]init]autorelease];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:newest.published];
        self.timeLabel.text = [formatter stringFromDate:date1];
    }
    
    self.titleLable.text = newest.title;
    self.pubdateLable.text = newest.desc;
   
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        {
            [self.contentView addSubview:self.timeLabel];
            [self.contentView addSubview:self.titleLable];
            [self.contentView addSubview:self.pubdateLable];
        }
    }
    return self;
}

- (UILabel *)titleLable {

    if (!_titleLable) {
        self.titleLable = [[[UILabel alloc]initWithFrame:CGRectMake(10, 5, kWidth - 20, 40)]autorelease];
        _titleLable.font = [UIFont boldSystemFontOfSize:16];
        _titleLable.numberOfLines = 0;
    }
    return [[_titleLable retain]autorelease];
}

- (UILabel *)pubdateLable {

    if (!_pubdateLable) {
        self.pubdateLable = [[[UILabel alloc]initWithFrame:CGRectMake(10, 45, kWidth - 20, 15)]autorelease];
        _pubdateLable.textColor = [UIColor grayColor];
        _pubdateLable.font = [UIFont boldSystemFontOfSize:11];
    }
    return [[_pubdateLable retain]autorelease];
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        
        self.timeLabel = [[[UILabel alloc]initWithFrame:CGRectMake(kWidth - 80, 60, 70, 10)]autorelease];
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.textAlignment = 2;
        _timeLabel.font = [UIFont boldSystemFontOfSize:10];
    }
    return [[_timeLabel retain]autorelease];

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
