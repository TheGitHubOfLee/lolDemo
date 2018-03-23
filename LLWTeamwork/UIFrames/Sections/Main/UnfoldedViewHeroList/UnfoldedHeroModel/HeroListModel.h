//
//  HeroListModel.h
//  UnfoldedViewHoreList
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 {
 "data": [
 {
 "role_id": "50",
 "name": "盲僧",
 "url": "http://pic.woqugame.com/lol/roles/Leesin.jpg",
 "debut": "7.79",
 "win": "48.48"
 }
 }
 */

@interface HeroListModel : NSObject

@property (nonatomic , copy) NSString *progressTittle1; // 进度条1

@property (nonatomic , copy) NSString *progressTittle2; // 进度条2

@property (nonatomic , copy) NSString *sortInteger; // 排序

@property (nonatomic , copy) NSString *name; // 姓名

@property (nonatomic , copy) NSString *url; // 图片地址

@property (nonatomic , copy) NSString *debut; // 出场率

@property (nonatomic , copy) NSString *win; // 胜率

@property (nonatomic , copy) NSString *ban; // 被绊率

@property (nonatomic , copy) NSString *kda; // kda

@property (nonatomic , copy) NSString *five_kill; // 五杀

@end
