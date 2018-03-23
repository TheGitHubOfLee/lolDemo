//
//  HeroListHeaderDrop2Template.h
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/15.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kUIScreenWidth [UIScreen mainScreen].bounds.size.width

@protocol HeroListHeaderDrop2TemplateDelegate <NSObject>

- (void)readDataFromNetWorkingByButton:(UIButton *)sender;

@end

@interface HeroListHeaderDrop2Template : UIView

@property (nonatomic , assign) id<HeroListHeaderDrop2TemplateDelegate>delegate;

@end
