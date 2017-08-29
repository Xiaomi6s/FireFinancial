//
//  FFTodayRateInfo.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/29.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFTodayRateInfo : FFBasicInfo
/**
 利率
 */
@property (nonatomic, copy) NSString *rate;

/**
 日期
 */
@property (nonatomic, copy) NSString *date;


@end
