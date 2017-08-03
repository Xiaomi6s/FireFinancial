//
//  FSResponseObject.h
//  YLBFireShadow
//
//  Created by 任晓健 on 2017/8/1.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFResponseObject : NSObject


/**
 返回的状态码
 */
@property(nonatomic, assign) int status;

/**
 错误代码
 */
@property(nonatomic, copy) NSString *errorCode;

/**
 请求成功后返回的信息
 */
@property(nonatomic, copy) NSString *msg;

/**
 请求失败后error信息
 */
@property(nonatomic, strong) NSError *error;

/**
 请求成功后返回对应的model（object || array）
 */
@property(nonatomic, strong) id responseObjectInfo;


/**
 初始化解析类

 @param returnObject 返回的json数据
 @param infoClass 对应的model类
 @return 返回解析后的FSResponseObject
 */
+ (instancetype)instanceWithReturnObject:(id)returnObject
                               infoClass:(Class)infoClass;

@end
