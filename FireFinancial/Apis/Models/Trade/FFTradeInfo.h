//
//  FFTradeInfo.h
//  FireFinancial
//
//  Created by rxj on 2017/8/29.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFTradeInfo : FFBasicInfo


/**
 投资的项目id
 */
@property(nonatomic, copy) NSString *tid;

/**
 项目名称
 */
@property(nonatomic, copy) NSString *title;

/**
 年化率
 */
@property(nonatomic, copy) NSString *rate;

/**
 投资日期
 */
@property(nonatomic, copy) NSString *investDate;

/**
 投资收益
 */
@property(nonatomic, copy) NSString *investIncoming;

/**
 投资金额
 */
@property(nonatomic, copy) NSString *investAmount;

/**
 还本日期
 */
@property(nonatomic, copy) NSString *paybackDate;

/**
 投资状态 0未还本；1已还本；3已转让变现；4转让变现中
 */
@property(nonatomic, copy) NSString *investStatus;

@end
