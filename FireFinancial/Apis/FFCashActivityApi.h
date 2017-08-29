//
//  FFCashActivityApi.h
//  FireFinancial
//
//  Created by rxj on 2017/8/28.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicApi.h"

@interface FFCashActivityApi : FFBasicApi


/**
 红包签到奖励记录

 @param siginId 签到id 第一页传0，请求下一页传入当前页的最后一个siginid
 @param finished 回调
 */
- (void)myCashSignListWithSiginId:(int)siginId
                         finished:(FinishedBlock)finished;

/**
 发起红包签到接口

 @param finished 回调
 */
- (void)sendSignWithFinished:(FinishedBlock)finished;

/**
 获取签到页面数据

 @param finished 回调
 */
- (void)signLoadingWithFinished:(FinishedBlock)finished;

@end
