//
//  FFEarnings.h
//  FireFinancial
//
//  Created by rxj on 2017/8/28.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFEarning : FFBasicInfo


/**
 日期
 */
@property(nonatomic, copy) NSString *date;

/**
 收益
 */
@property(nonatomic, copy) NSArray *earningAmount;

@end

@interface FFEarnings : FFBasicInfo


/**
 累计收益
 */
@property(nonatomic, copy) NSString *totalEarningAmount;

/**
 收益列表
 */
@property(nonatomic, copy) NSArray *earningsList;

@end

