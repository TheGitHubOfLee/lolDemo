//
//  WYLInformationCell.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "WYLInformationCell.h"
#import "WYLInformation.h"
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
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
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
        self.titleLabel = [[[UILabel alloc] initWithFrame:(CGRectMake(5, 5, 300, 30))] autorelease];
        _titleLabel.backgroundColor = [UIColor redColor];
    }
    return [[_titleLabel retain] autorelease];
}
- (UILabel *)detailLabel {
    if (!_detailLabel) {
        self.detailLabel = [[[UILabel alloc] initWithFrame:(CGRectMake(5, 40, 300, 30))] autorelease];
        _detailLabel.backgroundColor = [UIColor orangeColor];
        _detailLabel.font = [UIFont boldSystemFontOfSize:10];
    }
    return [[_detailLabel retain] autorelease];
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        self.timeLabel = [[[UILabel alloc] initWithFrame:(CGRectMake(220, 75, 80, 20))] autorelease];
        _timeLabel.backgroundColor = [UIColor yellowColor];
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
