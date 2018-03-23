//
//  BellTableViewCell.m
//  SlideText9
//
//  Created by lanouhn on 16/1/11.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "BellTableViewCell.h"
#import "BellCellModel.h"
#import "UIImageView+WebCache.h"
#import "Header.h"
@interface BellTableViewCell ()
@property (nonatomic , retain) UILabel *titleLabel; // 显示铃声名称



@end

@implementation BellTableViewCell

#pragma mark - 重写dealloc
-(void)dealloc {
    
//    self.delegate = nil;
    
    self.titleLabel = nil;
    self.playImageView = nil;
    [super dealloc];
}

#pragma mark - 懒加载
-(UILabel *)titleLabel {
    
    if (!_titleLabel) {
        self.titleLabel = [[[UILabel alloc] init] autorelease];
        
//        _titleLabel.backgroundColor = [UIColor redColor];
    }
    return [[_titleLabel retain] autorelease];
}

-(UIImageView *)playImageView {
    
    if (!_playImageView) {
        self.playImageView = [[[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 40, 17.5, 25, 25)]autorelease];
        self.playImageView.image = [UIImage imageNamed:@"PlayPressed_48px_560454_easyicon.net"];
    }
    return [[_playImageView retain]autorelease];
}

#pragma mark - 初始化cell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self p_createBellCell];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)p_createBellCell {
    
    self.titleLabel.frame = CGRectMake(20, 10, 200, 40);
    
    self.titleLabel.font = [UIFont systemFontOfSize:14];
   
//    NSInteger tagInteger = self.
    [self.contentView addSubview:self.playImageView];

    [self.contentView addSubview:_titleLabel];

//    UITapGestureRecognizer *tapGR = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGR:)]autorelease];
//    
//    [self.playImageView addGestureRecognizer:tapGR];
//    
//    self.playImageView.userInteractionEnabled = YES;
    
}

#pragma mark - kvc赋值方法
- (void)passValueByBellCellModel:(BellCellModel *)bellCellModel {
    
    self.titleLabel.text = bellCellModel.name;
    
//    self.playImageView.image = [UIImage imageNamed:@"PlayPressed_48px_560454_easyicon.net"];
}

#pragma mark - 实现手势方法
//- (void)handleTapGR:(UITapGestureRecognizer *)sender {
//
//    [self.delegate clickPlayIconByTapGestureRecognizer:sender];
//
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
