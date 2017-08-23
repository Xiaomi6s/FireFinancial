//
//  FFUserInfo.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/23.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFUserInfo : FFBasicInfo

/**
 账户(手机号或账户姓名)
 */
@property (nonatomic, copy) NSString *account;

/**
 是否为SVIP 0不是SVIP 1是SVIP
 */
@property (nonatomic, copy) NSString *isSuperVIP;

/**
 真是姓名(未实名,返空字符串)
 */
@property (nonatomic, copy) NSString *realName;

/**
 vip等级
 */
@property (nonatomic, copy) NSString *VIPLeval;

/**
 VIP失效时间
 */
@property (nonatomic, copy) NSString *VIPDeadLine;

/**
 提示信息(再赚多少钱升级)
 */
@property (nonatomic, copy) NSString *noticeContent;

/**
 用户手机号
 */
@property (nonatomic, copy) NSString *phone;

/**
 身份证号
 */
@property (nonatomic, copy) NSString *cardIdNumber;

/**
 银行卡号
 */
@property (nonatomic, copy) NSString *bankNumber;


/**
 token
 */
@property (nonatomic, copy) NSString *token;

/**
 用户id
 */
@property (nonatomic, copy) NSString *userId;

/**
 是否实名 0 未实名 1 已实名
 */
@property (nonatomic, copy) NSString *isCertificated;

/**
 昵称
 */
@property (nonatomic, copy) NSString *nickname;

/**
 注册时间戳
 */
@property (nonatomic, copy) NSString *registerTime;

@end
