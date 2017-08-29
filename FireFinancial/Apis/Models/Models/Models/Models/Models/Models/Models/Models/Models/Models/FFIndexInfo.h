//
//  FFIndexInfo.h
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/23.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFBannarInfo: FFBasicInfo

/**
 banner id
 */
@property(nonatomic, copy) NSString *bannerId;

/**
 banner名称
 */
@property(nonatomic, copy) NSString *bannerTitle;

/**
 跳转链接 没有就不跳转
 */
@property(nonatomic, copy) NSString *webUrl;

/**
 banner图片url
 */
@property(nonatomic, copy) NSString *bannerUrl;

/**
 分享内容
 */
@property(nonatomic, copy) NSString *shareDesc;

/**
 是否需要分享 类型0，不分享；1，分享
 */
@property(nonatomic, assign) BOOL needshare;
@end

@interface FFFunctionInfo: FFBasicInfo

/**
 名称
 */
@property(nonatomic, copy) NSString *title;

/**
 图片地址
 */
@property(nonatomic, copy) NSString *imgUrl;

/**
 1签到，2我的资产 3积分商城 4活动中心 5 我的火卷 6关于我们
 */
@property(nonatomic, assign) int type;
@end

@interface FFItemTraitInfo: FFBasicInfo


/**
 项目特性1
 */
@property(nonatomic, copy) NSString *tag1;

/**
 项目特性2
 */
@property(nonatomic, copy) NSString *tag2;

/**
 项目特性3
 */
@property(nonatomic, copy) NSString *tag3;
@end

@interface FFRegisterTipInfo: FFBasicInfo

/**
 主题
 */
@property(nonatomic, copy) NSString *theme;

/**
 主题提示
 */
@property(nonatomic, copy) NSString *themeTip;

/**
 礼包提示
 */
@property(nonatomic, copy) NSString *packageTip;

/**
 礼包内容
 */
@property(nonatomic, copy) NSString *package;
@end

@interface FFDealInvestInfo: FFBasicInfo
/**
 预约金额
 */
@property(nonatomic, copy) NSString *money;

/**
 预约id
 */
@property(nonatomic, copy) NSString *dealId;

@end

@interface FFItemInfo: FFBasicInfo

/**
 项目id
 */
@property(nonatomic, copy) NSString *pid;

/**
 项目类型
 */
@property(nonatomic, assign) int prodoctType;

/**
 项目名称
 */
@property(nonatomic, copy) NSString *prodoctTitle;

/**
 年化利率
 */
@property(nonatomic, copy) NSString *yearRate;

/**
 项目特性
 */
@property(nonatomic, strong) FFItemTraitInfo *itemTraitInfo;



@end



@interface FFIndexInfo : FFBasicInfo

/**
 昨日收益
 */
@property(nonatomic, copy) NSString *yesterIncome;

/**
 在投金额
 */
@property(nonatomic, copy) NSString *investAmount;

/**
 未读消息数
 */
@property(nonatomic, copy) NSString *unreadMessage;

/**
 是否是投资过的用户
 */
@property(nonatomic, assign) BOOL isNew;

/**
 活期在投金额
 */
@property(nonatomic, copy) NSString *currentAmount;

/**
 定期在投金额
 */
@property(nonatomic, copy) NSString *regularAmount;

/**
 账户余额
 */
@property(nonatomic, copy) NSString *userAmount;

/**
 首页注册引导信息
 */
@property(nonatomic, strong) FFRegisterTipInfo *registerTipInfo;

/**
 首页banner
 */
@property(nonatomic, copy) NSArray *bannerList;

/**
 首页操作按钮集合
 */
@property(nonatomic, copy) NSArray *functionList;

/**
 预约中项目信息
 */
@property(nonatomic, strong) FFDealInvestInfo *dealInvestInfo;

/**
 首页计划信息集合
 */
@property(nonatomic, copy) NSArray *itemList;

@end
