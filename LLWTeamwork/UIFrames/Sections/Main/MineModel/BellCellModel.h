//
//  BellCellModel.h
//  SlideText9
//
//  Created by lanouhn on 16/1/11.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 {
 "data": [
 {
 "id": "1",
 "name": "一血",
 "path_url": "http://file.zhangyoubao.com/lol/ring/0/1.mp3"
 }
 }
 */
@interface BellCellModel : NSObject

@property (nonatomic , copy) NSString *name; // 铃声名称

@property (nonatomic , copy) NSString *path_url; // 铃声地址

@property (nonatomic , copy) NSString *idTitle; // id

@end
