//
//  FFInvestInfo.h
//  FireFinancial
//
//  Created by rxj on 2017/8/29.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFInvestInfo : FFBasicInfo

/**
 预约金额
 */
@property(nonatomic, copy) NSString *money;

/**
 排名名次
 */
@property(nonatomic, copy) NSString *ranking;

/**
 是否能取消预约	
 */
@property(nonatomic, copy) NSString *cancel;

@end
