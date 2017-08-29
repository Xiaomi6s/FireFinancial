//
//  FFLiquidTransferInfo.h
//  FireFinancial
//
//  Created by rxj on 2017/8/29.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFLiquidTransferInfo : FFBasicInfo


/**
 可变现金额
 */
@property(nonatomic, copy) NSString *mayCashAmount;

/**
 变现费率
 */
@property(nonatomic, copy) NSString *rate;

/**
 底部温馨提示	
 */
@property(nonatomic, copy) NSArray *tips;

@end
