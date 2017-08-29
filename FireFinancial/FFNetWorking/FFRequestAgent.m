//
//  FSRequestAgent.m
//  YLBFireShadow
//
//  Created by 任晓健 on 2017/8/1.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFRequestAgent.h"
#import "FFServerConfig.h"
#import "RSAEncryptor.h"
#import <OpenUDID/OpenUDID.h>

static NSString *const publicKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDPrKMIntSVHnZJBudwhpNj/X6jo9VyeK4GK3db61VN1hsAbgiJvCEwLSSLXeJldvM5Ru6c1tVtWkkGATU2QXVpWHtvajqDFvZTPKI+Hb9P6RMZk2QWic49D1+heCeAuT96ZCEkjKNNAgd4ysVh6Aav9wpi5WSi45a99ljuKQuZpQIDAQAB";

@implementation FFRequestAgent

+ (instancetype)shareInstance {
    static FFRequestAgent *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.tasks = [NSMutableArray arrayWithCapacity:0];
        instance.manager = [self manager];
        [instance setHTTPHeader];
    });
    return instance;
}

+ (AFHTTPSessionManager *)manager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    return manager;
}

- (void)setHTTPHeader {
    [self.manager.requestSerializer setValue:@"" forHTTPHeaderField:@"appVersion"];
    [self.manager.requestSerializer setValue:@"" forHTTPHeaderField:@"deviceToken"];
    [self.manager.requestSerializer setValue:@"" forHTTPHeaderField:@"system"];
    [self.manager.requestSerializer setValue:@"" forHTTPHeaderField:@"deviceType"];
}

- (void)asyncPostRequestWithUrl:(NSString *)url
                 parameters:(id)parameters
                  infoclass:(Class)infoclass
                   finished:(FinishedBlock)finished  {
    __weak typeof(self) wself = self;
    FFServerConfig *config = [FFServerConfig instance];
    NSString *postUrl = [[config.serverIP stringByAppendingString:config.apiVersion]
                         stringByAppendingString:url];
    NSLog(@"发起请求--%@,参数--%@",postUrl, parameters);
    NSMutableDictionary *taskDict = [NSMutableDictionary dictionaryWithCapacity:0];
    NSURLSessionDataTask *task = [self.manager POST:postUrl
                                         parameters: [self commonParam:parameters]
                                           progress:^(NSProgress * _Nonnull uploadProgress) {
   }
                                            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                [wself.tasks removeObject:taskDict];
                                                
                                                finished(FFRequestStatusSuccess, responseObject);
       
   }
                                            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                [wself.tasks removeObject:taskDict];
                                                 finished(FFRequestStatusFail, error);
       
   }];
    [taskDict setObject:task forKey:@(url.hash)];
    [self.tasks addObject:taskDict];
}

- (void)uploadImageWithUrl:(NSString *)url
                parameters:(id)parameters
                     image:(UIImage *)image
                 infoclass:(Class)infoclass
                  finished:(FinishedBlock)finished {
    
    __weak typeof(self) wself = self;
    FFServerConfig *config = [FFServerConfig instance];
    NSString *postUrl = [[config.serverIP stringByAppendingString:config.apiVersion]
                         stringByAppendingString:url];
    NSLog(@"发起请求--%@",postUrl);

    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    
    NSURLSessionDataTask *task= [self.manager POST:postUrl parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
        //二进制文件，接口key值，文件路径，图片格式
        [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpg/png/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [wself.tasks removeObject:dict];
        finished(FFRequestStatusSuccess, responseObject);
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
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

- (NSDictionary *)commonParam:(id)param {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:param];
    [dic setValue:[OpenUDID value] forKey:@"uuid"];
    return dic;
}

- (NSDictionary *)rsaEncryptorWithParam:(id)param {
    NSData *data = [NSJSONSerialization dataWithJSONObject:param options:NSJSONWritingPrettyPrinted error:nil];
    NSString *dicStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSString *rsaValue = [RSAEncryptor encryptString:dicStr publicKey:publicKey];
    return @{@"i": rsaValue};
    
}



@end
