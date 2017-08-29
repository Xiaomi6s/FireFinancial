//
//  FFEarningsInfo.h
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/23.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFEarningInfo: FFBasicInfo

/**
 日期
 */
@property(nonatomic, copy) NSString *date;

/**
 收益
 */
@property(nonatomic, copy) NSString *earningAmount;
@end

@interface FFEarningsInfo : FFBasicInfo

/**
 收益列表
 */
@property(nonatomic, copy) NSArray *earningsList;

/**
 累计收益
 */
@property(nonatomic, copy) NSString *earningAmount;

@end
