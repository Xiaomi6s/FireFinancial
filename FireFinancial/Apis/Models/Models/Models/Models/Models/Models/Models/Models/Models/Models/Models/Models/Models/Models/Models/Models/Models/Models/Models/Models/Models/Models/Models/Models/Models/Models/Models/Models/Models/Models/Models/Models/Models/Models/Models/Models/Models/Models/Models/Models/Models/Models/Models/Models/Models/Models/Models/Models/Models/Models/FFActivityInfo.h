//
//  FFActivityInfo.h
//  FireFinancial
//
//  Created by rxj on 2017/8/28.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFActivityInfo : FFBasicInfo


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

/**
 打开类型	0:直接跳转 ，1:打开活动；
 */
@property(nonatomic, assign) int goType;

/**
 活动id	1： 邀请好友送圣券, 2： 邀请好友送月券, 3： 邀请注册送现金
 */
@property(nonatomic, copy) NSString *activityId;


@end
