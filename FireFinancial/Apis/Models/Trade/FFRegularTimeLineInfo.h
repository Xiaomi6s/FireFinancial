//
//  FFRegularTimeLineInfo.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/29.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFRegularTimeLineInfo : FFBasicInfo

/**
 名称
 */
@property (nonatomic, copy) NSString *title;

/**
 金额
 */
@property (nonatomic, copy) NSString *amount;

/**
 日期
 */
@property (nonatomic, copy) NSString *date;

/**
 该步骤是否完成
 */
@property (nonatomic, copy) NSString *isComplete;

@end
