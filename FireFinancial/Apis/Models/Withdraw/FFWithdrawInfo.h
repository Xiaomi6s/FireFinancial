//
//  FFWithdrawInfo.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/24.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFBankInfo : FFBasicInfo

/**
 银行卡id
 */
@property (nonatomic, copy) NSString *bankID;

/**
 银行名字
 */
@property (nonatomic, copy) NSString *bankName;

/**
 银行卡号
 */
@property (nonatomic, copy) NSString *bankCardNum;

/**
 开户城市
 */
@property (nonatomic, copy) NSString *bankCity;


@end

@interface FFWithdrawInfo : FFBasicInfo


/**
 账户余额
 */
@property (nonatomic, copy) NSString *accountBalance;

/**
 在投金额（活期再投+收益-锁定金额）
 */
@property (nonatomic, copy) NSString *investingMoney;

/**
 锁定金额
 */
@property (nonatomic, copy) NSString *lockMoney;

/**
 体验金
 */
@property (nonatomic, copy) NSString *experienceMoney;

/**
 手续费
 */
@property (nonatomic, copy) NSString *serviceFee;

/**
 银行卡信息
 */
@property (nonatomic, strong) FFBankInfo *bankInfo;

/**
 定期天数列表
 */
@property (nonatomic, strong) NSArray *tips;

@end


