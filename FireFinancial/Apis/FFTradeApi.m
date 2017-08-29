//
//  FFTradeApi.m
//  FireFinancial
//
//  Created by rxj on 2017/8/29.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFTradeApi.h"
#import "FFTradeInfo.h"
#import "FFOnlyValueInfo.h"
#import "FFInvestInfo.h"
#import "FFLiquidTransferInfo.h"
static NSString *const getRegularInvestListApi = @"/trade/getRegularInvestList";
static NSString *const investApi = @"/trade/invest";
static NSString *const investInfoApi = @"/trade/investInfo";
static NSString *const cancelInvestApi = @"/trade/cancelInvest";
static NSString *const liquidTransferLoadingApi = @"/trade/liquidTransferLoading";
static NSString *const liquidTransferSubmitApi = @"/trade/liquidTransferSubmit";
static NSString *const regularTransferSendCaptchaApi = @"/trade/regularTransferSendCaptcha";
static NSString *const regularTransferLoadingApi = @"/trade/regularTransferLoading";
static NSString *const regularTransferSubmitApi = @"/trade/regularTransferSubmit";
static NSString *const getTransferListApi = @"/trade/getTransferList";

static NSString * const projectTodayRateApi = @"/project/todayRate";

@implementation FFTradeApi

/**
 获取今日撮合年化利率
 
 @param type 类型 1:综合 2:零活宝 3:定期宝
 @param finished 回调
 */
- (void)getTradeTodayRateInfoWithType:(NSString *)type
                          returnBlock:(FinishedBlock)finished {
    NSDictionary *param = @{@"type":type};

    [self asyncPostRequestWithUrl:projectTodayRateApi parameters:param infoclass:[FFRegisterShowInfo class] finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
    
}

- (void)getRegularInvestListWithPid:(NSString *)pid
                           finished:(FinishedBlock)finished {
    NSDictionary *param = @{@"id": pid};
    [self asyncPostRequestWithUrl:getRegularInvestListApi
                       parameters:param
                        infoclass:[FFTradeInfo class]
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
                         }];
}

- (void)investWithPid:(NSString *)pid
                money:(NSString *)money
             couponId:(NSString *)couponId
             finished:(FinishedBlock)finished {
    NSDictionary *param = @{@"pid": pid,
                            @"money": money,
                            @"couponId": couponId};
    [self asyncPostRequestWithUrl:investApi
                       parameters:param
                        infoclass:[FFDealInfo class]
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

- (void)investInfoWithDealId:(NSString *)dealId
                    finished:(FinishedBlock)finished {
    NSDictionary *param = @{@"dealId": dealId};
    [self asyncPostRequestWithUrl:investInfoApi
                       parameters:param
                        infoclass:[FFInvestInfo class]
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

- (void)cancelInvestWithDealId:(NSString *)dealId
                      finished:(FinishedBlock)finished {
    NSDictionary *param = @{@"dealId": dealId};
    [self asyncPostRequestWithUrl:cancelInvestApi parameters:param infoclass:nil finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

- (void)liquidTransferLoadingWithFinished:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:liquidTransferLoadingApi
                       parameters:nil
                        infoclass:[FFLiquidTransferInfo class]
                         finished:^(FFRequestStatus status, id response) {
        finished(status ,response);
    }];
}

- (void)liquidTransferSubmitWithMoney:(NSString *)money
                             finished:(FinishedBlock)finished {
    NSDictionary *param = @{@"money": money};
    [self asyncPostRequestWithUrl:liquidTransferSubmitApi
                       parameters:param
                        infoclass:nil
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

@end
