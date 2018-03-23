//
//  UnfoldedListViewTemplate.m
//  UnfoldedView
//
//  Created by lanouhn on 16/1/13.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "UnfoldedListViewTemplate.h"
#import "UnfoldedBarViewTemplate.h"

@interface UnfoldedListViewTemplate ()

@property (nonatomic , retain) NSMutableArray *dataSource; // 存储名称

@end

@implementation UnfoldedListViewTemplate

#pragma mark - 重写dealloc
- (void)dealloc
{
    self.dataSource = nil;
    
    [super dealloc];
}

#pragma mark - 重写init方法
-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self p_createButton];
    }
    return self;
}

- (void)p_createButton {
    
    self.dataSource = @[@"艾欧尼亚" , @"祖安" , @"诺克萨斯" , @"班德尔城" , @"皮尔沃特沃夫" , @"战争学院" , @"巨神峰" , @"雷瑟守备" , @"裁决之地" , @"黑色玫瑰" , @"暗影岛" , @"钢铁烈阳" , @"均衡教派" , @"水晶之痕" , @"影流" , @"守望之海" , @"征服之海" , @"卡拉曼达" , @"皮城警备" , @"比吉尔沃特" , @"德玛西亚" , @"弗雷尔卓德" , @"无畏先锋" , @"恕瑞玛" , @"扭曲丛林" , @"巨龙之巢" , @"教育网专区"].mutableCopy;
    
    NSInteger n = 0;
    
    for (int i = 0; i < 9; i ++) {
        
        for (int x = 0; x < 3; x ++) {
            
            UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
            
            button.frame = CGRectMake(kUIScreenWidth / 3 * x, 30 * i, kUIScreenWidth / 3, 30);
            
            [button setTitle:self.dataSource[n] forState:(UIControlStateNormal)];
            
            [button setTintColor:[UIColor whiteColor]];
            
            n += 1;
            
            button.tag = 200 + n;
            
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:button];
            
            
        }
    }
}

- (void)buttonAction:(UIButton *)sender
{
    
    [self.delegate getBackUnfoldedListView:sender];

}


@end
