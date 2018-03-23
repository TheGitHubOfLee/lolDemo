
//
//  UnfoldedTableViewCell.m
//  UnfoldedView
//
//  Created by lanouhn on 16/1/13.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "UnfoldedTableViewCellTemplate.h"
#import "UnfoldedModel.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

@interface UnfoldedTableViewCellTemplate ()

@property (nonatomic , retain) UILabel *sortLabel; // cell排序

@property (nonatomic , retain) UIImageView *photoImage; // 头标

@property (nonatomic , retain) UILabel *nameLabel; // 名称

@property (nonatomic , retain) UILabel *danLabel; // 段位

@property (nonatomic , retain) UILabel *danSortLabel; // 段位排名

@end

@implementation UnfoldedTableViewCellTemplate

#pragma mark - 重写dealloc
- (void)dealloc
{
    self.sortLabel = nil;
    
    self.photoImage = nil;
    
    self.nameLabel = nil;
    
    self.danLabel = nil;
    
    self.danSortLabel = nil;
    
    [super dealloc];
}
#pragma mark - 懒加载
-(UILabel *)sortLabel {
    
    if (!_sortLabel) {
        
        self.sortLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 30, 30, 30)] autorelease];
        
        _sortLabel.textAlignment = 1;
        
        _sortLabel.font = [UIFont systemFontOfSize:15];
        
//        _sortLabel.backgroundColor = [UIColor redColor];
    }
    return [[_sortLabel retain] autorelease];
}

-(UIImageView *)photoImage {
    
    if (!_photoImage) {
        
        self.photoImage = [[[UIImageView alloc] initWithFrame:CGRectMake(30, 15, 60, 60)] autorelease];
        
//        _photoImage.backgroundColor = [UIColor blueColor];
    }
    return [[_photoImage retain] autorelease];
}

-(UILabel *)nameLabel {
    
    if (!_nameLabel) {
        
        self.nameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(95, 30, 85, 30)] autorelease];
        
        _nameLabel.font = [UIFont systemFontOfSize:15];
        
//        _nameLabel.backgroundColor = [UIColor redColor];
    }
    return [[_nameLabel retain] autorelease];
}

-(UILabel *)danLabel {
    
    if (!_danLabel) {
        
        self.danLabel = [[[UILabel alloc] initWithFrame:CGRectMake(210, 30 , 60, 30)] autorelease];
        
        _danLabel.textAlignment = 2;
        
        _danLabel.font = [UIFont systemFontOfSize:15];
        
//        _danLabel.backgroundColor = [UIColor blueColor];
    }
    return [[_danLabel retain] autorelease];
}

-(UILabel *)danSortLabel {
    
    if (!_danSortLabel) {
        
        self.danSortLabel = [[[UILabel alloc] initWithFrame:CGRectMake(270, 30, 50, 30)] autorelease];
        
        _danSortLabel.textAlignment = 1;
        
        _danSortLabel.font = [UIFont systemFontOfSize:15];
        
//        _danSortLabel.backgroundColor = [UIColor redColor];
    }
    return [[_danSortLabel retain] autorelease];
}



#pragma mark - 初始化
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self p_createCell];
        
    }
    return self;
}

- (void)p_createCell {
    
    [self.contentView addSubview:self.sortLabel];
    
    [self.contentView addSubview:self.photoImage];
    
    [self.contentView addSubview:self.nameLabel];
    
    [self.contentView addSubview:self.danLabel];
    
    [self.contentView addSubview:self.danSortLabel];
}

#pragma mark - cell赋值
- (void)setValuesForCellByUnfoldedModel:(UnfoldedModel *)unfoldedModel {
    
    self.sortLabel.text = unfoldedModel.sortInteger;
    
    [self.photoImage sd_setImageWithURL:[NSURL URLWithString:unfoldedModel.url]];
    
    self.nameLabel.text = unfoldedModel.name;
    
    self.danLabel.text = unfoldedModel.position;
    
    self.danSortLabel.text = unfoldedModel.point;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
