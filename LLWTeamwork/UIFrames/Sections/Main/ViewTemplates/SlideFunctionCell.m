//
//  SlideFunctionCell.m
//  SlideText9
//
//  Created by lanouhn on 16/1/8.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "SlideFunctionCell.h"

@interface SlideFunctionCell ()



@end

@implementation SlideFunctionCell

#pragma mark - 重写dealloc
- (void)dealloc
{
    self.image = nil;
    
    self.titleLabel = nil;
    
    [super dealloc];
}

#pragma mark - 懒加载
-(UIImageView *)image {
    
    if (!_image) {
        
        self.image = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 40, 40)] autorelease];
        
//        _image.backgroundColor = [UIColor redColor];
    }
    return [[_image retain] autorelease];
}

-(UILabel *)titleLabel {
    
    if (!_titleLabel) {
        self.titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(65, 5, 205, 40)] autorelease];
        
//        _titleLabel.backgroundColor = [UIColor grayColor];
    }
    return [[_titleLabel retain] autorelease];
}

#pragma mark - 重写初始化方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_createCell];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


#pragma mark - 加载控件
- (void)p_createCell {
    
    [self.contentView addSubview:self.image];
    
    [self.contentView addSubview:self.titleLabel];
    
    self.contentView.backgroundColor = [UIColor clearColor];
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
