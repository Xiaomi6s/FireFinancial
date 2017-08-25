//
//  FFAssetApi.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/24.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicApi.h"
/*
 放资产相关的接口  充值 提现 变现 资产
 */

@interface FFAssetApi : FFBasicApi

/**
 获取提现页面信息

 @param finished 回调
 */
- (void)getWithdrawInfoWithReturnBlock:(FinishedBlock)finished;

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
                      returnBlock:(FinishedBlock)finished;

@end
