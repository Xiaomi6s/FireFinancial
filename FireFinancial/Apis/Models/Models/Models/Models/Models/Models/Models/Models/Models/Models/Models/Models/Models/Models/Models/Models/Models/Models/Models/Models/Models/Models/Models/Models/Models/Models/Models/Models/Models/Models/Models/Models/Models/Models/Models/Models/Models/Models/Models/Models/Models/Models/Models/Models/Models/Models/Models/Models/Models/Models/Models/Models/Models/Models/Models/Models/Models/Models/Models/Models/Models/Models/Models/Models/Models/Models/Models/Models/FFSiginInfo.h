//
//  FFSiginInfo.h
//  FireFinancial
//
//  Created by rxj on 2017/8/28.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFSignDetailInfo : FFBasicInfo


/**
 签到id
 */
@property(nonatomic, copy) NSString *signId;

/**
 签到日期
 */
@property(nonatomic, copy) NSString *signDate;

/**
 签到时间
 */
@property(nonatomic, copy) NSString *signTime;

/**
 签到的红包金额
 */
@property(nonatomic, copy) NSString *signAmount;

/**
 是否显示？0：不显示，1：显示
 */
@property(nonatomic, assign) BOOL isUnknown;

@end

@interface FFSiginInfo : FFBasicInfo


/**
 签到红包总金额
 */
@property(nonatomic, copy) NSString *signToltalAmount;

/**
 签到次数
 */
@property(nonatomic, copy) NSString *signCount;

/**
 相当于平均多投资的金额
 */
@property(nonatomic, copy) NSString *overflowAmount;

/**
 弹窗标题
 */
@property(nonatomic, copy) NSString *title;

/**
 弹窗内容
 */
@property(nonatomic, copy) NSString *content;

/**
 签到列表
 */
@property(nonatomic, copy) NSArray *signList;



@end
