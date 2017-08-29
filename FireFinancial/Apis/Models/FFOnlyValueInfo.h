//
//  FFOnlyValueInfo.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/23.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFOnlyValueInfo : FFBasicInfo

@end

@interface FFMessageCodeInfo : FFBasicInfo

/**
 短信验证码
 */
@property (nonatomic, copy) NSString *vcode;

@end

@interface FFRegisterShowInfo : FFBasicInfo

/**
 注册顶部显示信息
 */
@property (nonatomic, copy) NSString *showContent;

@end

@interface FFDealInfo : FFBasicInfo

/**
 活期预约中项目id
 */
@property (nonatomic, copy) NSString *dealId;

@end


