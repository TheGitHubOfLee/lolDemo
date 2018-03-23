//
//  WYLInformationCell.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "WYLInformationCell.h"
#import "WYLInformation.h"
#import "Header.h"
@interface WYLInformationCell ()
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *detailLabel;
@property (nonatomic, retain) UILabel *timeLabel;
@end
@implementation WYLInformationCell
- (void)dealloc
{
    self.titleLabel = nil;
    self.detailLabel = nil;
    self.timeLabel = nil;
    [super dealloc];
}
- (void)setValueForSubViewsByInformation:(WYLInformation *)information {
    self.titleLabel.text = information.title;
    self.detailLabel.text = information.desc;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:information.published];
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init]autorelease];
    [formatter setDateFormat:@"yyyyMM.dd HH:mm"];
    NSString *dateString = [formatter stringFromDate:date];
    NSString *subString = [dateString substringFromIndex:4];
    self.timeLabel.text = subString;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.detailLabel];
        [self.contentView addSubview:self.timeLabel];
    }
    return self;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[[UILabel alloc] initWithFrame:(CGRectMake(8, 5, kWidth - 8 * 2, 40))] autorelease];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.numberOfLines = 0;
    }
    return [[_titleLabel retain] autorelease];
}
- (UILabel *)detailLabel {
    if (!_detailLabel) {
        self.detailLabel = [[[UILabel alloc] initWithFrame:(CGRectMake(8, self.titleLabel.frame.size.height , kWidth - 8 * 2, 15))] autorelease];
//        _detailLabel.backgroundColor = [UIColor orangeColor];
        _detailLabel.font = [UIFont boldSystemFontOfSize:11];
        _detailLabel.numberOfLines = 0;
        _detailLabel.textColor = [UIColor grayColor];
        
    }
    return [[_detailLabel retain] autorelease];
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        self.timeLabel = [[[UILabel alloc] initWithFrame:(CGRectMake(kWidth - 80, 60, 70, 10))] autorelease];
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.textAlignment = 2;
        _timeLabel.font = [UIFont boldSystemFontOfSize:10];
    }
    return [[_timeLabel retain] autorelease];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
