//
//  HeroListHeaderDropTemplate.h
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/15.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeroListHeaderDrop1TemplateDelegate <NSObject>

- (void)readDataFromNetWorkingByButton:(UIButton *)sender;

@end

@interface HeroListHeaderDrop1Template : UIView

@property (nonatomic , assign) id<HeroListHeaderDrop1TemplateDelegate>delegate;

@end
