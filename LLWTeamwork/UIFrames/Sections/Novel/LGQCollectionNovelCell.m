//
//  LGQCollectionNovelCell.m
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/23.
//  Copyright © 2016年 wangyulong. All rights reserved.
//
#import "Header.h"
#import "LGQCollectionNovelCell.h"
@interface LGQCollectionNovelCell ()

@property (nonatomic, retain)UIImageView *headImage;
@property (nonatomic, retain)UILabel *nameLabel;

@end

@implementation LGQCollectionNovelCell


- (void)dealloc
{
    self.headImage = nil;
    self.nameLabel = nil;
    [super dealloc];
    
}

- (void)setValueForSubViewsWithModel:(LGQAllModel *)model {
    
    self.nameLabel.text = model.name;
    NSURL *url = [NSURL URLWithString:model.pic_url];
    [self.headImage sd_setImageWithURL:url];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.headImage];
        [self.contentView addSubview:self.nameLabel];
    }
    return self;
}

- (UIImageView *)headImage {
    
    if (!_headImage) {
        
        self.headImage = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)]autorelease];
        _headImage.layer.cornerRadius = 20;
        _headImage.layer.masksToBounds = YES;
    }
    return [[_headImage retain]autorelease];
}

- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        self.nameLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, 80, 80, 20)]autorelease];
        //        _nameLabel.backgroundColor = [UIColor blueColor];
        //        _nameLabel.shadowColor = [UIColor grayColor];
        //        _nameLabel.shadowOffset = CGSizeMake(1.5, 1);
        _nameLabel.textAlignment = 1;
        _nameLabel.font = [UIFont boldSystemFontOfSize:13];
    }
    return [[_nameLabel retain]autorelease];
}


@end
