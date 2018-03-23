//
//  WYLPageViewCell.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import "WYLPageViewCell.h"
#import "WYLPageView.h"
#import "UIImageView+WebCache.h"
#import "DCPicScrollView.h"
#import "AFNetworking.h"
#import "Header.h"
@interface WYLPageViewCell ()

@property (nonatomic, retain) UIImageView *photoView;

@end
@implementation WYLPageViewCell
- (void)dealloc
{
    self.photoView = nil;
    [super dealloc];
}

- (void)setValueForPhotoViewByPageView:(WYLPageView *)pageView {
    NSURL *url = [NSURL URLWithString:pageView.image_url_big];
    [self.photoView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"girl"]];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.photoView];
    }
    return self;
}

- (UIImageView *)photoView {
    if (!_photoView) {
        self.photoView = [[[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, kWidth, 150))] autorelease];
    }
    return [[_photoView retain] autorelease];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
