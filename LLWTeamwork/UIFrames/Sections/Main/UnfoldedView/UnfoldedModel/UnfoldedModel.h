//
//  UnfoldedModel.h
//  UnfoldedView
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 {
 "data": [
 {
 "name": "Dop4",
 "url": "http://img.lolbox.duowan.com/profileIcon/profileIcon502.jpg",
 "position": "最强王者",
 "point": "1384"
 }
 }
 */
@interface UnfoldedModel : NSObject

@property (nonatomic , copy) NSString *sortInteger;

@property (nonatomic , copy) NSString *name;

@property (nonatomic , copy) NSString *url;

@property (nonatomic , copy) NSString *position;

@property (nonatomic , copy) NSString *point;

@end
