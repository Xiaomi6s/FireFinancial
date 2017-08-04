//
//  FSServerConfig.m
//  YLBFireShadow
//
//  Created by 任晓健 on 2017/8/1.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFServerConfig.h"

static NSString *const releaseServerIP = @"https://newhuo.yonglibao.com";//线上环境
static NSString *const debugServerIP = @"http://hlctest.yonglibao.com"; //测试环境

@implementation FFServerConfig

+ (instancetype)instance {
    static FFServerConfig *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.apiVersion = @"/v2";
        [instance setupServerIP];
    });
    return instance;
}

- (void)setupServerIP {
#ifdef DEBUG
    self.serverIP = releaseServerIP;
#else
    self.serverIP = debugServerIP;
#endif
}

@end
