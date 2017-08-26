//
//  FSBasicApi.m
//  YLBFireShadow
//
//  Created by 任晓健 on 2017/8/1.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicApi.h"
#import "FFRequestAgent.h"
#import "FFRequestCache.h"
#import "FFBasicApi+Animation.h"

@implementation FFBasicApi

- (void)asyncPostRequestWithUrl:(NSString *)url
                     parameters:(id)parameters
                      infoclass:(Class)infoclass
                       finished:(FinishedBlock)finished {
    if (self.isLoadingAnimtion) {
        [self loadingAnimationInView:[self viewOfcurrentVC]];
    }
    [[FFRequestAgent shareInstance] asyncPostRequestWithUrl:url
                                                 parameters:parameters
                                                  infoclass:infoclass finished:^(FFRequestStatus status, id response) {
                                                      FFResponseObject *responseObject = [FFResponseObject instanceWithReturnObject: response infoClass:infoclass];
                                                      finished(status, responseObject);
                                                  }];
    
}

- (void)asyncPostRequestWithUrl:(NSString *)url
                     parameters:(id)parameters
                      infoclass:(Class)infoclass
                     cacheBlock:(CacheBlock)cacheBlock
                       finished:(FinishedBlock)finished {
        if ([[FFRequestCache instance] isExistCacheWithKey:url]) {
            FFResponseObject *responseObject = [FFResponseObject instanceWithReturnObject: [[FFRequestCache instance] objectFromCacheWithKey:url]
                                                                                infoClass:infoclass];
            finished(FFRequestStatusSuccess,
                     responseObject);
        } else {
            [[FFRequestAgent shareInstance] asyncPostRequestWithUrl:url
                                                         parameters:parameters
                                                          infoclass:infoclass finished:^(FFRequestStatus status, id response) {
                                                              [[FFRequestCache instance] setObject:response toCacheWithKey:url];
                                                              FFResponseObject *responseObject = [FFResponseObject instanceWithReturnObject: response infoClass:infoclass];
                                                              finished(status, responseObject);
                                                          }];
        }
}

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
                  finished:(FinishedBlock)finished {
    if (self.isLoadingAnimtion) {
        [self loadingAnimationInView:[self viewOfcurrentVC]];
    }
    
    [[FFRequestAgent shareInstance] uploadImageWithUrl:url parameters:nil image:image infoclass:nil finished:^(FFRequestStatus status, id response) {
        FFResponseObject *responseObject = [FFResponseObject instanceWithReturnObject: response infoClass:infoclass];
        finished(status, responseObject);
    }];
}

- (void)removeAllTask {
    [[FFRequestAgent shareInstance] removeAllTask];
}

- (void)removeTaskWithTaskTag:(NSString *)taskTag {
    [[FFRequestAgent shareInstance] removeTaskWithTaskTag:taskTag];
}

@end
