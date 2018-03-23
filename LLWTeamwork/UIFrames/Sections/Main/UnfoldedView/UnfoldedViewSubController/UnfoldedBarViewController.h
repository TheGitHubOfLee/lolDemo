//
//  BarViewController.h
//  UnfoldedView
//
//  Created by lanouhn on 16/1/13.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UnfoldedBarViewTemplate;

//@protocol UnfoldedBarViewControllerDelegate <NSObject>
//
//- (void)
//
//@end

@interface UnfoldedBarViewController : UIViewController

@property (nonatomic , retain) UIButton *titleButton; // 控制子视图控制器

@property (nonatomic , copy) NSString *strTittl;

- (void)getButtonTittle:(NSString *)valueStr;

@end
