//
//  FFAssetApi.m
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/24.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFAssetApi.h"
#import "FFWithdrawInfo.h"


static NSString * const withdrawLoadingInfoApi = @"/withdraw/loadingInfo";
static NSString * const withdrawConfirmApi = @"/withdraw/confirmSummit";
static NSString * const realNameApi = @"/user/realName";
static NSString * const registerApi = @"/user/register";
static NSString * const registerShowApi = @"/user/registerShow";
static NSString * const getValidateCodeApi = @"/user/getValidateCode";
static NSString * const uploadAvatarApi = @"/user/uploadAvatar";

@implementation FFAssetApi

/**
 获取提现页面信息
 
 @param finished 回调
 */
- (void)getWithdrawInfoWithReturnBlock:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:withdrawLoadingInfoApi parameters:nil infoclass:[FFWithdrawInfo class] finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

/**
 确认提现
 
 @param bankId 银行id号
 @param withdrawMoney 提现金额
 @param payPassword 支付密码
 @param finished 回调
 */
- (void)withdrawConfirmWithBankId:(NSString *)bankId
                    withdrawMoney:(NSString *)withdrawMoney
                      payPassword:(NSString *)payPassword
                      returnBlock:(FinishedBlock)finished{
    NSDictionary *param = @{@"bankId":bankId,@"withdrawMoney":withdrawMoney,@"payPassword":payPassword};
    
    [self asyncPostRequestWithUrl:withdrawConfirmApi parameters:param infoclass:nil finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];

}

@end
