//
//  ImageCellTemplate.h
//  SlideText9
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - 制订协议

@protocol ImageCellModelDelegate <NSObject>

- (void)deleteCellWithIndex:(NSIndexPath *)indexPath;

@end

@class ImageCellModel;
@interface ImageCellTemplate : UICollectionViewCell

- (void)setImageForCellByImageCellModel:(ImageCellModel *)model;
@property (nonatomic , retain) UIImageView *imagePhoto;

@property (nonatomic, assign) id <ImageCellModelDelegate>delegate;
@property (nonatomic ,retain) NSIndexPath *indexPath;
@end
