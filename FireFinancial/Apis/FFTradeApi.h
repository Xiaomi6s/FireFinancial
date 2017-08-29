//
//  FFTradeApi.h
//  FireFinancial
//
//  Created by rxj on 2017/8/29.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicApi.h"

@interface FFTradeApi : FFBasicApi

/**
 获取今日撮合年化利率

 @param type 类型 1:综合 2:零活宝 3:定期宝
 @param finished 回调
 */
- (void)getTradeTodayRateInfoWithType:(NSString *)type
                          returnBlock:(FinishedBlock)finished;

/**
 查询定期投资项目列表

 @param pid 投资的项目id 用于分页查询，上一次返回的列表中最后一个的id
 @param finished 回调
 */
- (void)getRegularInvestListWithPid:(NSString *)pid
                           finished:(FinishedBlock)finished;

/**
 投资提交API

 @param pid 项目id
 @param money 投资金额
 @param couponId 火券id
 @param finished 回调
 */
- (void)investWithPid:(NSString *)pid
                money:(NSString *)money
             couponId:(NSString *)couponId
             finished:(FinishedBlock)finished;

/**
 投资详情API
 功能说明

 @param dealId 预约id
 @param finished finished description
 */
- (void)investInfoWithDealId:(NSString *)dealId
                    finished:(FinishedBlock)finished;

/**
 取消预约中的投资

 @param dealId 预约项目id
 @param finished finished description
 */
- (void)cancelInvestWithDealId:(NSString *)dealId
                      finished:(FinishedBlock)finished;

/**
 零火宝变现加载页API

 @param finished finished description
 */
- (void)liquidTransferLoadingWithFinished:(FinishedBlock)finished;


/**
 活期变现提交API

 @param money 变现金额
 @param finished finished description
 */
- (void)liquidTransferSubmitWithMoney:(NSString *)money
                             finished:(FinishedBlock)finished;

@end
