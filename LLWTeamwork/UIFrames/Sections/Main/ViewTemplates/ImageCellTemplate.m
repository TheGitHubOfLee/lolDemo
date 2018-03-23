



//
//  ImageCellTemplate.m
//  SlideText9
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "ImageCellTemplate.h"
#import "UIImageView+WebCache.h"
#import "ImageCellModel.h"

@interface ImageCellTemplate ()



@end

@implementation ImageCellTemplate

- (void)dealloc
{
    self.imagePhoto = nil;
    self.indexPath = nil;
    
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imagePhoto];
        [self addLongGestureRecognizer];
    }
    return self;
}

#pragma mark - 懒加载
-(UIImageView *)imagePhoto {
    
    if (!_imagePhoto) {
        
        self.imagePhoto = [[[UIImageView alloc] init] autorelease];
        
    }
    
    return [[_imagePhoto retain] autorelease];
}

#pragma mark - kvc赋值
- (void)setImageForCellByImageCellModel:(ImageCellModel *)model {
    
    [self.imagePhoto sd_setImageWithURL:[NSURL URLWithString:model.pic_thumb_url] placeholderImage:[UIImage imageNamed:@"Picture_1300px_1180712_easyicon.net"]];

}

#pragma mark - 自定义Layout
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    
    self.imagePhoto.frame = CGRectMake(0, 0, layoutAttributes.frame.size.width, layoutAttributes.frame.size.height);
}

#pragma mark - 添加长按手势 调用代理方法

- (void)addLongGestureRecognizer {
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longPress.minimumPressDuration = 1.0;
    [self addGestureRecognizer:longPress];
    [longPress release];
}

- (void)longPressAction:(UILongPressGestureRecognizer *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(deleteCellWithIndex:)]) {
        [self.delegate deleteCellWithIndex:self.indexPath];
    }
}


@end
