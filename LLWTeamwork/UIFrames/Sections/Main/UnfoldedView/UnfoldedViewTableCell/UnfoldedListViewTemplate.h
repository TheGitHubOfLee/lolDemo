//
//  UnfoldedListViewTemplate.h
//  UnfoldedView
//
//  Created by lanouhn on 16/1/13.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kUIScreenWidth [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight [UIScreen mainScreen].bounds.size.height

@protocol UnfoldedListViewTemplateDelegate <NSObject>

- (void) getBackUnfoldedListView:(UIButton *)sender;

@end

@interface UnfoldedListViewTemplate : UIView

@property (nonatomic , assign) id<UnfoldedListViewTemplateDelegate>delegate;

@end
