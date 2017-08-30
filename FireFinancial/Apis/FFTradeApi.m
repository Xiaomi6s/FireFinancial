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
#import "FFRegularTransferInfo.h"
#import "FFTodayRateInfo.h"
#import "FFRegularTimeLineInfo.h"
#import "FFProjectDetailInfo.h"

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
static NSString * const projectDetailApi = @"/project/detail";

@implementation FFTradeApi

/**
 获取今日撮合年化利率
 
 @param type 类型 1:综合 2:零活宝 3:定期宝
 @param finished 回调
 */
- (void)getTradeTodayRateInfoWithType:(NSString *)type
                          returnBlock:(FinishedBlock)finished {
    NSDictionary *param = @{@"type":type};

    [self asyncPostRequestWithUrl:projectTodayRateApi parameters:param infoclass:[FFTodayRateInfo class] finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
    
}

/**
 获取定期投资项目的回款时间轴信息
 
 @param investId 定期项目id
 @param finished 回调
 */
- (void)getRegularBackMoneyTimeLineWithInvestId:(NSString *)investId
                                    returnBlock:(FinishedBlock)finished {
    NSDictionary *param = @{@"investId":investId};
    
    [self asyncPostRequestWithUrl:projectTodayRateApi parameters:param infoclass:[FFRegularTimeLineInfo class] finished:^(FFRequestStatus status, id response) {
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

- (void)regularTransferSendCaptchaWithFinisd:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:regularTransferSendCaptchaApi
                       parameters:nil
                        infoclass:nil
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

- (void)regularTransferLoadingWithlastId:(NSString *)lastId
                                finished:(FinishedBlock)finished {
    NSDictionary *param = @{@"lastId": lastId};
    [self asyncPostRequestWithUrl:regularTransferLoadingApi
                       parameters:param
                        infoclass:[FFRegularTransferInfo class]
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

/**
 项目详情接口API
 
 @param productId 项目id
 @param finished 回调
 */
- (void)getProjectDetailWithProductId:(NSString *)productId
                             finished:(FinishedBlock)finished {
    
    NSDictionary *param = @{@"productId": productId};
    [self asyncPostRequestWithUrl:projectDetailApi
                       parameters:param
                        infoclass:[FFProjectDetailInfo class]
                         finished:^(FFRequestStatus status, id response) {
                             finished(status, response);
                         }];

}
@end
