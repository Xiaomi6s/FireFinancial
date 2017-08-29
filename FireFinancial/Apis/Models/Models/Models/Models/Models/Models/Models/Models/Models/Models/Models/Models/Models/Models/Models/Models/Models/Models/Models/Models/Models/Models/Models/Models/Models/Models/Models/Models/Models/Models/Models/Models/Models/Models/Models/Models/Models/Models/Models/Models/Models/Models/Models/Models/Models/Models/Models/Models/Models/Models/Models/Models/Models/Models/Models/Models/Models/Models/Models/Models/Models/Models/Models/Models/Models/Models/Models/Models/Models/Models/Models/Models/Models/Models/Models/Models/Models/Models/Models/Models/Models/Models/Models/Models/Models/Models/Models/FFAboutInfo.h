//
//  FFAboutInfo.h
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/23.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFMaintainInfo: FFBasicInfo

/**
 维护状态0:不维护，1：在维护
 */
@property(nonatomic, assign) BOOL maintenanceState;

/**
 联系电话
 */
@property(nonatomic, copy) NSString *contactphone;
@end

@interface FFNoticeInfo: FFBasicInfo

/**
 是否展示公告0：不提示，1，提示
 */
@property(nonatomic, assign) BOOL isNotice;

/**
 图片地址
 */
@property(nonatomic, copy) NSString *imageUrl;

/**
 图片宽
 */
@property(nonatomic, copy) NSString *imageWidth;

/**
 图片高
 */
@property(nonatomic, copy) NSString *imageHeight;

/**
 链接地址
 */
@property(nonatomic, copy) NSString *linkUrl;
@end

@interface FFUpdateInfo: FFBasicInfo

/**
 更新状态0：不更新 ，1：更新， 2：强制更新
 */
@property(nonatomic, assign) int updateState;

/**
 下载地址仅安卓使用
 */
@property(nonatomic, copy) NSString *downloadUrl;

/**
 更新提示title
 */
@property(nonatomic, copy) NSString *updateTitle;

/**
 更新提示内容
 */
@property(nonatomic, copy) NSString *updateContent;
@end

@interface FFAboutInfo : FFBasicInfo

/**
 维护信息相关
 */
@property(nonatomic, strong) FFMaintainInfo *maintainInfo;

/**
 首页公告相关
 */
@property(nonatomic, strong) FFNoticeInfo *noticeInfo;

/**
 更新相关
 */
@property(nonatomic, strong) FFUpdateInfo *updateInfo;

/**
 灰度地址
 */
@property(nonatomic, copy) NSString *grayUrl;

@end

