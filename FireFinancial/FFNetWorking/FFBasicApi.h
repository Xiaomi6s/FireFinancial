//
//  FSBasicApi.h
//  YLBFireShadow
//
//  Created by 任晓健 on 2017/8/1.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FFResponseObject.h"
#import "FFRequestTypedef.h"

typedef void(^CacheBlock)(id responseObject);

@interface FFBasicApi : NSObject

@property(nonatomic, assign)BOOL isCache;
@property(nonatomic, assign) BOOL isLoadingAnimtion;


/**
 发起一个post请求

 @param url url
 @param parameters 参数
 @param infoclass 返回json数据关联的model类
 @param finished 回调
 */
- (void)asyncPostRequestWithUrl:(NSString *)url
                     parameters:(id)parameters
                      infoclass:(Class)infoclass
                       finished:(FinishedBlock)finished;

/**
 发起一个带缓存的post请求

 @param url url
 @param parameters 参数
 @param infoclass  返回json数据关联的model类
 @param cacheBlock 读取cache的回调
 @param finished 请求成功后的回调
 */
- (void)asyncPostRequestWithUrl:(NSString *)url
                     parameters:(id)parameters
                      infoclass:(Class)infoclass
                     cacheBlock:(CacheBlock)cacheBlock
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

/**
 删除所有的请求任务
 */
- (void)removeAllTask;

/**
 根据表示tag删除某个对应的请求任务

 @param taskTag 请求任务的标识
 */
- (void)removeTaskWithTaskTag:(NSString *)taskTag;

@end
