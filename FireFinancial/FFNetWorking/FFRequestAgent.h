//
//  FSRequestAgent.h
//  YLBFireShadow
//
//  Created by 任晓健 on 2017/8/1.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "FFResponseObject.h"
#import "FFRequestTypedef.h"

@interface FFRequestAgent : NSObject

/**
 初始化一个单例

 @return instance
 */
+ (instancetype)shareInstance;

/**
 请求管理对象
 */
@property(nonatomic, weak) AFHTTPSessionManager *manager;

/**
 存放发起的请求
 */
@property(nonatomic, strong) NSMutableArray *tasks;


/**
 发起一个异步post请求

 @param url url
 @param parameters 参数
 @param infoclass 返回json对应的model类
 @param finished 回调
 */
- (void)asyncPostRequestWithUrl:(NSString *)url
                     parameters:(id)parameters
                      infoclass:(Class)infoclass
                       finished:(FinishedBlock)finished;

/**
 上传头像

 @param url URL
 @param parameters 参数
 @param image uiimage
 @param infoclass 返回json对应的model类
 @param finished 回调
 */
- (void)uploadImageWithUrl:(NSString *)url
                parameters:(id)parameters
                     image:(UIImage *)image
                 infoclass:(Class)infoclass
                  finished:(FinishedBlock)finished;

- (void)removeAllTask;
- (void)removeTaskWithTaskTag:(NSString *)taskTag;

@end
