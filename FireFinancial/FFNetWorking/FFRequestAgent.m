//
//  FSRequestAgent.m
//  YLBFireShadow
//
//  Created by 任晓健 on 2017/8/1.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFRequestAgent.h"
#import "FFServerConfig.h"
@implementation FFRequestAgent

+ (instancetype)shareInstance {
    static FFRequestAgent *instance;
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
    FFServerConfig *config = [FFServerConfig instance];
    NSString *postUrl = [[config.serverIP stringByAppendingString:config.apiVersion]
                         stringByAppendingString:url];
    NSLog(@"发起请求--%@",postUrl);
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    NSURLSessionDataTask *task = [self.manager POST:postUrl
                                         parameters:parameters
                                           progress:^(NSProgress * _Nonnull uploadProgress) {
   }
                                            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                [wself.tasks removeObject:dict];
                                                finished(FFRequestStatusSuccess, responseObject);
       
   }
                                            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                [wself.tasks removeObject:dict];
                                                 finished(FFRequestStatusFail, error);
       
   }];
    [dict setObject:task forKey:@(url.hash)];
    [self.tasks addObject:dict];
}

- (void)removeTask:(NSURLSessionDataTask*)task {
    [task cancel];
    if ([self.tasks containsObject:task]) {
        [self.tasks removeObject:task];
    }
}

- (void)removeAllTask {
    for (NSDictionary *dict in self.tasks) {
        NSURLSessionDataTask *task = dict.allValues.firstObject;
        [task cancel];
    }
    [self.tasks removeAllObjects];
}

- (void)removeTaskWithTaskTag:(NSString *)taskTag {
    NSURLSessionDataTask *removeTask;
    for (NSDictionary *dict in self.tasks) {
        removeTask = dict[@(taskTag.hash)];
        if (removeTask) {
            [removeTask cancel];
        }
    }
    if (removeTask) {
        [self.tasks removeObject:removeTask];
    }
}

@end
