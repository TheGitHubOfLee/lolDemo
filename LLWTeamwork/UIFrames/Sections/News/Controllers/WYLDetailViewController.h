//
//  WYLDetailViewController.h
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WYLInformation;
@interface WYLDetailViewController : UIViewController

@property (nonatomic, copy) NSString *cID;
@property (nonatomic, retain) WYLInformation *information;

@end
