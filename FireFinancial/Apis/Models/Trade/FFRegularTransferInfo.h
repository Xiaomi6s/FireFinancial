//
//  FFRegularTransferInfo.h
//  FireFinancial
//
//  Created by rxj on 2017/8/29.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFTransferInfo : FFBasicInfo


/**
 投资id
 */
@property(nonatomic, copy) NSString *investId;

/**
 标题
 */
@property(nonatomic, copy) NSString *title;

/**
 年化率
 */
@property(nonatomic, copy) NSString *investRate;

/**
 投资日期
 */
@property(nonatomic, copy) NSString *investDate;

/**
 投资金额
 */
@property(nonatomic, copy) NSString *investAmount;

/**
 返本日期
 */
@property(nonatomic, copy) NSString *paybackDate;

/**
 投资收益
 */
@property(nonatomic, copy) NSString *investEarnings;

/**
 是否募集中
 */
@property(nonatomic, assign) BOOL isRaising;

@end


@interface FFRegularTransferInfo : FFBasicInfo

/**
 变现费率
 */
@property(nonatomic, copy) NSString *rate;

/**
 可变现购买列表
 */
@property(nonatomic, copy) NSArray *mayCashlist;

@end
