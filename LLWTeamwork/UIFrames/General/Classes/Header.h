//
//  Header.h
//  LLWTeamwork
//
//  Created by lanouhn on 16/1/9.
//  Copyright © 2016年 wangyulong. All rights reserved.
//

#ifndef Header_h
#define Header_h

/*************视频***********************/
#define kNewestHTTP @"http://lol.zhangyoubao.com/apis/rest/ItemsService/videos?catwordid=115&page=%ld&i_=5cd8ea630e2959e432fc4276e6077acff6480779&t_=1452429483&p_=30794&v_=40070101&d_=ios&osv_=9.2&version=0&a_=lol"
#define kNewestHTTP1 @"http://lol.zhangyoubao.com/apis/rest/ItemsService/videos?catwordid=115&page=1&i_=5cd8ea630e2959e432fc4276e6077acff6480779&t_=1452429483&p_=30794&v_=40070101&d_=ios&osv_=9.2&version=0&a_=lol"

#define kALLHTTP @"http://lol.zhangyoubao.com/apis/rest/CatalogsService/all?cattype=video&i_=5cd8ea630e2959e432fc4276e6077acff6480779&t_=1452475588&p_=19109&v_=40070101&d_=ios&osv_=9.2&version=0&a_=lol"
#define kAllDetailHttp1 @"http://lol.zhangyoubao.com/apis/rest/ItemsService/videos?catwordid=%@"
#define kAllDetailHTTP3 @"&page=%ld&i_=5cd8ea630e2959e432fc4276e6077acff6480779&t_=1452429710&p_=31475&v_=40070101&d_=ios&osv_=9.2&version=0&a_=lol"
#define KVideoCell @"cell"
#define kDetailCell @"videoCell"
#define kAllCell @"allCell"
#import "VideoController.h"
#import "LGQNewestController.h"
#import "LGQCommentaryController.h"
#import "LGQMatchController.h"
#import "LGQMoreController.h"
#import "LGQNewest.h"
#import "LGQNewestCell.h"
#import "LGQNewestDetailController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "SCNavTabBarController.h"
#import "AppDelegate.h"
#import "SVPullToRefresh.h"
#import "LGQAllCell.h"
#import "LGQAllModel.h"
#import "LGQCommentaryDetailController.h"
#import "LGQAVPlayerViewController.h"
#import "ZWIntroductionViewController.h"
#import "UMSocial.h"
#import "MBProgressHUD.h"



#define SDKAppKey @"56a7577de0f55a074f0017fa"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
/****************小说********************/
#import "LGQNovelController.h"
#import "LGQNovelDetailController.h"
#import "LGQNovelWebController.h"
#import "LGQNovelCell.h"
#import "LGQCollectionNovelCell.h"

#define kNovelHttp1 @"http://lol.zhangyoubao.com/apis/rest/CatalogsService/all?cattype=novel&i_=5cd8ea630e2959e432fc4276e6077acff6480779&t_=1452692758&p_=10619&v_=40070101&d_=ios&osv_=9.2&version=0&a_=lol"
#define kNovelHTTP2 @"http://lol.zhangyoubao.com/apis/rest/ItemsService/novels?catwordid=%@"
#define kNovelHTTP3 @"&catid=10195&page=%ld&i_=5cd8ea630e2959e432fc4276e6077acff6480779&t_=1452692854&p_=10907&v_=40070101&d_=ios&osv_=9.2&version=0&a_=lol"
#define kNovelHttp4 @"http://lol.zhangyoubao.com/mobiles/item/%@?user_id=&token=&i_=5cd8ea630e2959e432fc4276e6077acff6480779&t_=1452692929&p_=11132&v_=40070101&d_=ios&osv_=9.2&version=0&a_=lol&size=middle"
/****************资讯*******************/
// 新闻
#define kWYLNewsString @"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10000&cattype=news&page=%ld&i_=866654029856488&t_=1452220901198&p_=5939&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=meizuMartket&u_=&modle_=MX4&"
// 最新
#define kWYLLatestSring @"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10178&cattype=news&page=%ld&i_=866654029856488&t_=1452220577296&p_=24233&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=meizuMartket&u_=&modle_=MX4&"
// 赛事
#define kWYLCompetitionString @"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10006&cattype=news&page=%ld&i_=866654029856488&t_=1452220968570&p_=28055&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=meizuMartket&u_=&modle_=MX4&"
// 娱乐
#define kWYLRecreationString @"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10179&cattype=news&page=%ld&i_=866654029856488&t_=1452221068708&p_=28469&v_=400704&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=meizuMartket&u_=&modle_=MX4&"
#define kWYLUrl @"http://lol.zhangyoubao.com/mobiles/item/%@%@"
#define kWYLDetailUrl @"?v_=400704&size=middle"

#endif /* Header_h */
