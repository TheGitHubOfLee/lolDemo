//
//  WYLDetailOfLatestViewController.h
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/11.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYLInformation;
@interface WYLDetailOfLatestViewController : UIViewController

@property (nonatomic, retain) WYLInformation *information;

- (void)setValueForSubViewsByLatestInformation:(WYLInformation *)information;
@end
