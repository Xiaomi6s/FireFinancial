//
//  FSRequestAgent.m
//  YLBFireShadow
//
//  Created by 任晓健 on 2017/8/1.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFRequestAgent.h"
#import "FFServerConfig.h"

@implementation FSRequestAgent

+ (instancetype)shareInstance {
    static FSRequestAgent *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.tasks = [NSMutableArray arrayWithCapacity:0];
        instance.manager = [self manager];
    });
    return instance;
}

+ (AFHTTPSessionManager *)manager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    return manager;
}

- (void)asyncPostRequestWithUrl:(NSString *)url
                 parameters:(id)parameters
                  infoclass:(Class)infoclass
                   finished:(FinishedBlock)finished  {
    __weak typeof(self) wself = self;
    FSServerConfig *config = [FSServerConfig instance];
    NSString *postUrl = [[config.serverIP stringByAppendingString:config.apiVersion]
                         stringByAppendingString:url];
    NSURLSessionDataTask *task = [self.manager POST:postUrl
                                         parameters:parameters
                                           progress:^(NSProgress * _Nonnull uploadProgress) {
   }
                                            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                [wself.tasks removeObject:task];
                                                FSResponseObject *resopnseOb = [FSResponseObject instanceWithReturnObject:responseObject
                                                                                                                infoClass:infoclass];
                                                finished(FSRequestStatusSuccess, resopnseOb);
       
   }
                                            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                [wself.tasks removeObject:task];
                                                FSResponseObject *resopnseOb = [FSResponseObject instanceWithReturnObject:error
                                                                                                                infoClass:infoclass];
                                                 finished(FSRequestStatusFail, resopnseOb);
       
   }];
    [self.tasks addObject:task];
}

- (void)asyncGetRequestWithWithUrl:(NSString *)url
                        parameters:(id)parameters
                         infoclass:(Class)infoclass
                          finished:(FinishedBlock)finished{
    __weak typeof(self) wself = self;
    FSServerConfig *config = [FSServerConfig instance];
    NSString *getUrl = [[config.serverIP stringByAppendingString:config.apiVersion]
                         stringByAppendingString:url];
    NSURLSessionDataTask *task = [self.manager GET:getUrl parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [wself.tasks removeObject:task];
        FSResponseObject *resopnseOb = [FSResponseObject instanceWithReturnObject:responseObject
                                                                        infoClass:infoclass];
        finished(FSRequestStatusSuccess, resopnseOb);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [wself.tasks removeObject:task];
        FSResponseObject *resopnseOb = [FSResponseObject instanceWithReturnObject:error
                                                                        infoClass:infoclass];
        finished(FSRequestStatusFail, resopnseOb);
    }];
    [self.tasks addObject:task];
    
}

- (void)removeTask:(NSURLSessionDataTask*)task {
    [task cancel];
    if ([self.tasks containsObject:task]) {
        [self.tasks removeObject:task];
    }
}

- (void)removeAllTask {
    for (NSURLSessionDataTask *task in self.tasks) {
        [task cancel];
    }
    [self.tasks removeAllObjects];
}


@end
