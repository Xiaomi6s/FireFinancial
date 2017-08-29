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

@end
