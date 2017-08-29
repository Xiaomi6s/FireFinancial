//
//  FFUserAssetinfo.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/29.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFUserAssetinfo : FFBasicInfo

/**
 昨日综合年化率
 */
@property (nonatomic, copy) NSString *yesterRate;

/**
 昨日收益
 */
@property (nonatomic, copy) NSString *yesterIncoming;

/**
 今日综合年化率
 */
@property (nonatomic, copy) NSString *todayRate;

/**
 总资产
 */
@property (nonatomic, copy) NSString *totalAsset;

/**
 账户余额
 */
@property (nonatomic, copy) NSString *userAmount;

/**
 累计收益
 */
@property (nonatomic, copy) NSString *totalIncoming;

/**
 活期资产
 */
@property (nonatomic, copy) NSString *huoAsset;

/**
 定期资产
 */
@property (nonatomic, copy) NSString *dingAsset;

/**
 体验金
 */
@property (nonatomic, copy) NSString *experience;

/**
 活期昨日收益
 */
@property (nonatomic, copy) NSString *huoYesterIncoming;

/**
 活期累计收益
 */
@property (nonatomic, copy) NSString *huoTotalIncoming;

/**
 定期已收收益
 */
@property (nonatomic, copy) NSString *receivedIncoming;

/**
 定期待收收益
 */
@property (nonatomic, copy) NSString *expectIncoming;

/**
 提示
 */
@property (nonatomic, copy) NSString *tips;



@end
