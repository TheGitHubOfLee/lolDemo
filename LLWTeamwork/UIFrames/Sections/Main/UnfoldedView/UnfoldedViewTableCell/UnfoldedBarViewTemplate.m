//
//  UnfoldedBarViewTemplate.m
//  UnfoldedView
//
//  Created by lanouhn on 16/1/13.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "UnfoldedBarViewTemplate.h"

@interface UnfoldedBarViewTemplate ()

@property (nonatomic , retain) UILabel *sortName; // 排名

@property (nonatomic , retain) UILabel *summonerName; // 召唤师名称

@property (nonatomic , retain) UILabel *danName; // 段位



@end

@implementation UnfoldedBarViewTemplate

#pragma mark - 重写dealloc
- (void)dealloc
{
    self.sortName = nil;
    
    self.summonerName = nil;
    
    self.danName = nil;
    
    [super dealloc];
}

#pragma mark - 重写init
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_createInterface];
        
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)p_createInterface {
    
    self.sortName = [[UILabel alloc] initWithFrame:CGRectMake(5, 30, 30, 20)];
    
    _sortName.text = @"排名";
    
    _sortName.textColor = [UIColor blueColor];
    
    _sortName.font = [UIFont systemFontOfSize:14];
    
    _sortName.textAlignment = 1;
    
    [self addSubview:_sortName];
    
    [_sortName release];
    
    
    self.summonerName = [[UILabel alloc] initWithFrame:CGRectMake(50, 30, 50, 20)];
    
    _summonerName.text = @"召唤师";
    
    _summonerName.textColor = [UIColor blueColor];
    
    _summonerName.font = [UIFont systemFontOfSize:14];
    
    _summonerName.textAlignment = 1;
    
    [self addSubview:_summonerName];
    
    [_summonerName release];
    
    
    self.danName = [[UILabel alloc] initWithFrame:CGRectMake(240, 30, 70, 20)];
    
    _danName.text = @"段位/胜点";
    
    _danName.textColor = [UIColor blueColor];
    
    _danName.font = [UIFont systemFontOfSize:14];
    
    _danName.textAlignment = 1;
    
    [self addSubview:_danName];
    
    [_danName release];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
