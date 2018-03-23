//
//  HeroListCellTemplate.m
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "HeroListCellTemplate.h"
#import "HeroListModel.h"
#import "UIImageView+WebCache.h"

@interface HeroListCellTemplate ()

@property (nonatomic , retain) UILabel *sortLabel; // 排序

@property (nonatomic , retain) UIImageView *photoImage; // 头像

@property (nonatomic , retain) UILabel *nameLabel; // 英雄名

@property (nonatomic , retain) UILabel *appearanceRateLabel; // 登场率名称

@property (nonatomic , retain) UILabel *appearanceRateProgressLabel; // 登场率表视图

@property (nonatomic , retain) UILabel *appearanceRateNumberLabel; // 登场率数值

@property (nonatomic , retain) UILabel *victoryRateLabel; // 胜率名称

@property (nonatomic , retain) UILabel *victoryRateProgressLabel; // 胜率表视图

@property (nonatomic , retain) UILabel *victoryRateNumberLabel; // 胜率数值

@end

@implementation HeroListCellTemplate

#pragma mark - 重写dealloc
- (void)dealloc
{
    self.sortLabel = nil;
    
    self.photoImage = nil;
    
    self.nameLabel = nil;
    
    self.appearanceRateLabel = nil;
    
    self.appearanceRateProgressLabel = nil;
    
    self.appearanceRateNumberLabel = nil;
    
    self.victoryRateLabel = nil;
    
    self.victoryRateProgressLabel = nil;
    
    self.victoryRateNumberLabel = nil;
    
    [super dealloc];
}

#pragma mark - 懒加载
-(UILabel *)sortLabel {
    
    if (!_sortLabel) {
        
        self.sortLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 30, 30, 30)] autorelease];
        
        _sortLabel.font = [UIFont systemFontOfSize:14];
        
        _sortLabel.textAlignment = 1;
        
//        _sortLabel.backgroundColor = [UIColor redColor];
    }
    return [[_sortLabel retain] autorelease];
}

-(UIImageView *)photoImage {
    
    if (!_photoImage) {
        
        self.photoImage = [[[UIImageView alloc] initWithFrame:CGRectMake(30, 15, 60, 60)] autorelease];
        
//        _photoImage.backgroundColor = [UIColor redColor];
    }
    return [[_photoImage retain] autorelease];
}

-(UILabel *)nameLabel {
    
    if (!_nameLabel) {
        
        self.nameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(95, 15, 120, 30)] autorelease];
        
        _nameLabel.font = [UIFont systemFontOfSize:17];
        
//        _nameLabel.backgroundColor = [UIColor blueColor];
    }
    return [[_nameLabel retain] autorelease];
}

-(UILabel *)appearanceRateLabel {
    
    if (!_appearanceRateLabel) {
        
        self.appearanceRateLabel = [[[UILabel alloc] initWithFrame:CGRectMake(95, 45, 40, 12.5)] autorelease];
        
        _appearanceRateLabel.font = [UIFont systemFontOfSize:9];
        
//        _appearanceRateLabel.textAlignment = 0;
        
        _appearanceRateLabel.text = @"登场率:";
        
        _appearanceRateLabel.tintColor = [UIColor blackColor];
        
//        _appearanceRateLabel.backgroundColor = [UIColor redColor];
    }
    return [[_appearanceRateLabel retain] autorelease];
}


-(UILabel *)appearanceRateProgressLabel {
    
    if (!_appearanceRateProgressLabel) {
        
        self.appearanceRateProgressLabel = [[[UILabel alloc] initWithFrame:CGRectMake(140, 45, 100, 12.5)] autorelease];
        
        _appearanceRateProgressLabel.font = [UIFont systemFontOfSize:10];
        
        _appearanceRateProgressLabel.tintColor = [UIColor blackColor];
        
        _appearanceRateProgressLabel.backgroundColor = [UIColor orangeColor];
    }
    return [[_appearanceRateProgressLabel retain] autorelease];
}

-(UILabel *)appearanceRateNumberLabel {
    
    if (!_appearanceRateNumberLabel) {
        
        self.appearanceRateNumberLabel = [[[UILabel alloc] initWithFrame:CGRectMake(240, 45, 30, 12.5)] autorelease];
        
//        _appearanceRateNumberLabel.backgroundColor = [UIColor orangeColor];
    }
    return [[_appearanceRateNumberLabel retain] autorelease];
}

-(UILabel *)victoryRateLabel {
    
    if (!_victoryRateLabel) {
        
        self.victoryRateLabel = [[[UILabel alloc] initWithFrame:CGRectMake(95, 62.5, 40, 12.5)] autorelease];
        
        _victoryRateLabel.font = [UIFont systemFontOfSize:9.0];
        
        _victoryRateLabel.textAlignment = 0;
        
        _victoryRateLabel.tintColor = [UIColor blackColor];
        
//        _victoryRateLabel.backgroundColor = [UIColor grayColor];
    }
    return [[_victoryRateLabel retain] autorelease];
}

-(UILabel *)victoryRateProgressLabel {
    
    if (!_victoryRateProgressLabel) {
        
        self.victoryRateProgressLabel = [[[UILabel alloc] initWithFrame:CGRectMake(140, 62.5, 100, 12.5)] autorelease];
        
        _victoryRateProgressLabel.backgroundColor = [UIColor yellowColor];
    }
    return [[_victoryRateProgressLabel retain] autorelease];
}

-(UILabel *)victoryRateNumberLabel {
    
    if (!_victoryRateNumberLabel) {
        
        self.victoryRateNumberLabel = [[[UILabel alloc] initWithFrame:CGRectMake(240, 62.5, 50, 12.5)] autorelease];
        
//        _victoryRateNumberLabel.backgroundColor = [UIColor redColor];
        
        _victoryRateNumberLabel.font = [UIFont systemFontOfSize:9.0];
    }
    return [[_victoryRateNumberLabel retain] autorelease];
}

#pragma mark - 重写init
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self p_createCell];
    }
    return self;
}

- (void) p_createCell {
    
    [self.contentView addSubview:self.sortLabel];
    
    [self.contentView addSubview:self.photoImage];
    
    [self.contentView addSubview:self.nameLabel];
    
    [self.contentView addSubview:self.appearanceRateLabel];
    
    [self.contentView addSubview:self.appearanceRateProgressLabel];
    
    [self.contentView addSubview:self.appearanceRateNumberLabel];
    
    [self.contentView addSubview:self.victoryRateLabel];
    
    [self.contentView addSubview:self.victoryRateProgressLabel];
    
    [self.contentView addSubview:self.victoryRateNumberLabel];
}

#pragma mark - 重新布置cell控件,并赋值
- (void)setValueByHeroListModel:(HeroListModel *)heroListModel {
    
    self.sortLabel.text = heroListModel.sortInteger;
    
    [self.photoImage sd_setImageWithURL:[NSURL URLWithString:heroListModel.url]]; // 添加图片
    
    self.nameLabel.text = heroListModel.name;
    
}

- (void)setValueByHeroList012Model:(HeroListModel *)heroListModel {
    
    self.appearanceRateLabel.text = @"登场率:";
    
    _appearanceRateNumberLabel.text = [NSString stringWithFormat:@"%@%@" , heroListModel.debut , @"%"];
    
    NSInteger debut = [self.appearanceRateNumberLabel.text floatValue];
    
    CGFloat m = debut * 10;
    
    self.appearanceRateProgressLabel.frame = CGRectMake(125, 45, m, 12.5);
    
    self.appearanceRateNumberLabel.frame = CGRectMake(125 + m, 45, 40, 12.5);
    
    _appearanceRateNumberLabel.font = [UIFont systemFontOfSize:9.0];
    
    self.victoryRateLabel.text = @"胜  率:";
    
    self.victoryRateNumberLabel.text = [NSString stringWithFormat:@"%@%@" , heroListModel.win , @"%"];
    
    _victoryRateNumberLabel.font = [UIFont systemFontOfSize:9.0];
    
    NSInteger win = [self.victoryRateNumberLabel.text floatValue];
    
    CGFloat n = win;
    
    self.victoryRateProgressLabel.frame = CGRectMake(125, 62.5, n, 12.5);
    
    self.victoryRateNumberLabel.frame = CGRectMake(125 + n, 62.5, 40, 12.5);
    
    _victoryRateLabel.font = [UIFont systemFontOfSize:9.0];
    
    self.victoryRateLabel.hidden = NO;
    
    self.victoryRateProgressLabel.hidden = NO;
    
    self.victoryRateNumberLabel.hidden = NO;
}

- (void)setValueByHeroList34Model:(HeroListModel *)heroListModel {
    
    self.appearanceRateLabel.text = @"KDA:";
    
    _appearanceRateNumberLabel.text = [NSString stringWithFormat:@"%@%@" , heroListModel.kda , @"%"];
    
    NSInteger debut = [self.appearanceRateNumberLabel.text floatValue];
    
    CGFloat m = debut * 10;
    
    self.appearanceRateProgressLabel.frame = CGRectMake(125, 45, m, 12.5);
    
    self.appearanceRateNumberLabel.frame = CGRectMake(125 + m, 45, 40, 12.5);
    
    _appearanceRateNumberLabel.font = [UIFont systemFontOfSize:9.0];
    
    self.victoryRateLabel.text = @"五  杀:";
    
    self.victoryRateNumberLabel.text = [NSString stringWithFormat:@"%.2f" , heroListModel.five_kill.floatValue];
    
    _victoryRateNumberLabel.font = [UIFont systemFontOfSize:9.0];
    
    NSInteger win = [self.victoryRateNumberLabel.text floatValue];
    
    CGFloat n = win;
    
    self.victoryRateProgressLabel.frame = CGRectMake(125, 62.5, n, 12.5);
    
    self.victoryRateNumberLabel.frame = CGRectMake(125 + n, 62.5, 40, 12.5);
    
    _victoryRateLabel.font = [UIFont systemFontOfSize:9.0];
    
    self.victoryRateLabel.hidden = NO;
    
    self.victoryRateProgressLabel.hidden = NO;
    
    self.victoryRateNumberLabel.hidden = NO;
}

- (void)setValueByHeroList567891011Model:(HeroListModel *)heroListModel {
    
    self.appearanceRateLabel.text = @"被禁率:";
    
    _appearanceRateNumberLabel.text = [NSString stringWithFormat:@"%.2f%@" , heroListModel.ban.floatValue , @"%"];
    
    float ban = heroListModel.ban.floatValue;
    
    CGFloat m = ban * 10.00;
    
    self.appearanceRateProgressLabel.frame = CGRectMake(125, 45, m, 12.5);
    
    self.appearanceRateNumberLabel.frame = CGRectMake(125 + m, 45, 40, 12.5);
    
    _appearanceRateNumberLabel.font = [UIFont systemFontOfSize:9.0];
    
    self.victoryRateLabel.hidden = YES;
    
    self.victoryRateProgressLabel.hidden = YES;
    
    self.victoryRateNumberLabel.hidden = YES;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
