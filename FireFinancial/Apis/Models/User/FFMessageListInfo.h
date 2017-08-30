//
//  FFMessageListInfo.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/29.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicInfo.h"

@interface FFMessageListInfo : FFBasicInfo

/**
 id
 */
@property (nonatomic, copy) NSString *id;

/**
 消息标题
 */
@property (nonatomic, copy) NSString *title;

/**
 消息内容(副标题)
 */
@property (nonatomic, copy) NSString *content;

/**
 消息是否读过 1已读  0未读
 */
@property (nonatomic, copy) NSString *status;

/**
 发布时间
 */
@property (nonatomic, copy) NSString *date;

/**
 图片地址
 */
@property (nonatomic, copy) NSString *imgUrl;

/**
 跳转链接
 */
@property (nonatomic, copy) NSString *webUrl;

@end
