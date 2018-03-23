//
//  LGQNewestCell.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "Header.h"

@interface LGQNewestCell ()
@property(nonatomic, retain)UIImageView *image;
@property(nonatomic, retain)UILabel *titleLable;
@property(nonatomic, retain)UIImageView *thumbView;
@property(nonatomic, retain)UILabel *pubdateLable;



@end

@implementation LGQNewestCell

- (void)dealloc
{
    self.image = nil;
    self.titleLable = nil;
    self.thumbView = nil;
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
    NSURL *url = [NSURL URLWithString:newest.pic_url];
    [self.thumbView sd_setImageWithURL:url];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        {
            [self.contentView addSubview:self.timeLabel];
            [self.contentView addSubview:self.titleLable];
            [self.contentView addSubview:self.thumbView];
            [self.contentView addSubview:self.pubdateLable];
            [self.thumbView addSubview:self.image];
        }
    }
    return self;
}

- (UIImageView *)image {

    if (!_image) {
        
        self.image = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)]autorelease];
        self.image.image = [UIImage imageNamed:@"PlayPressed_48px_560454_easyicon.net"];
        self.image.center  = CGPointMake(self.thumbView.frame.size.width / 2, self.thumbView.frame.size.height / 2);

    }
    return [[_image retain]autorelease];
}

- (UILabel *)titleLable {

    if (!_titleLable) {
        self.titleLable = [[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 200, 40)]autorelease];
        _titleLable.font = [UIFont boldSystemFontOfSize:16];
        _titleLable.numberOfLines = 0;
    }
    return [[_titleLable retain]autorelease];

}


- (UIImageView *)thumbView {

    if (!_thumbView) {
        self.thumbView = [[[UIImageView alloc]initWithFrame:CGRectMake(8, 3, 80, 55)]autorelease];
    }
    return [[_thumbView retain]autorelease];

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

- (UILabel *)pubdateLable {

    if (!_pubdateLable) {
        
        self.pubdateLable = [[[UILabel alloc]initWithFrame:CGRectMake(100, 45, 210, 15)]autorelease];
        _pubdateLable.textColor = [UIColor grayColor];
        _pubdateLable.font = [UIFont boldSystemFontOfSize:11];
    }

    return [[_pubdateLable retain]autorelease];

}


@end
