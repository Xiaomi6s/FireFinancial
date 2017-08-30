//
//  FFProjectDetailInfo.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/29.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFSafeTipInfo : FFBasicInfo
/**
 名称
 */
@property (nonatomic, copy) NSString *title;

/**
 图片地址
 */
@property (nonatomic, copy) NSString *imgUrl;


@end

@interface FFProjectDetailInfo : FFBasicInfo

/**
 项目id
 */
@property (nonatomic, copy) NSString *pid;

/**
 投资id
 */
@property (nonatomic, copy) NSString *dealId;

/**
 项目标题
 */
@property (nonatomic, copy) NSString *projectTitle;

/**
 年化率
 */
@property (nonatomic, copy) NSString *yearRate;

/**
 定期计划剩余金额
 */
@property (nonatomic, copy) NSString *surplusAmount;

/**
 用户余额
 */
@property (nonatomic, copy) NSString *userAmount;

/**
 活期排队购买总金额
 */
@property (nonatomic, copy) NSString *totalAmount;

/**
 活期剩余可投金额
 */
@property (nonatomic, copy) NSString *leftAmount;

/**
 投资人数(预约人数)
 */
@property (nonatomic, copy) NSString *investNumber;

/**
 计息情况
 */
@property (nonatomic, copy) NSString *computeDate;

/**
 起投金额
 */
@property (nonatomic, copy) NSString *minAmount;

/**
 定期是否有标
 */
@property (nonatomic, copy) NSString *regularMark;

/**
 项目期限
 */
@property (nonatomic, copy) NSString *term;

/**
 安全保障提示
 */
@property (nonatomic, strong) NSArray *safeTips;

/**
 项目特点
 */
@property (nonatomic, copy) NSString *projectTrait;

/**
 项目状态，是否售罄
 */
@property (nonatomic, copy) NSString *status;

@end
