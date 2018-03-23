//
//  LGQNewestDetailController.h
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGQNewest;
@interface LGQNewestDetailController : UIViewController
@property (nonatomic, copy) NSString *timeString;
- (void)setValueForDetailUrl:(LGQNewest *)newst;

@property (nonatomic, retain) LGQNewest *video;



@end
