//
//  FFRechargeLodingInfo.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/29.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFRechargeLodingInfo : FFBasicInfo

/**
 加密银行卡号
 */
@property (nonatomic, copy) NSString *cardEncryptStr;

/**
 银行卡号
 */
@property (nonatomic, copy) NSString *cardNumber;

/**
 账户余额
 */
@property (nonatomic, copy) NSString *userAmount;

/**
 加密手机号
 */
@property (nonatomic, copy) NSString *phoneEncryptStr;


@end
