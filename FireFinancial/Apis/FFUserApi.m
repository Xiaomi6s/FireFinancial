//
//  FFUserApi.m
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/23.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFUserApi.h"

static NSString * const findPasswordApi = @"/user/findPassword";
static NSString * const getUserInfoApi = @"/user/myInfo";

@implementation FFUserApi

/**
 获取用户信息
 
 @param finished 回调
 */
- (void)getUserInfoWithReturnBlock:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:getUserInfoApi parameters:nil infoclass:nil finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

/**
 找回密码(1.已登录,主动发起; 2.未登录忘记密码)
 
 @param phone 手机号
 @param newPassword 新密码
 @param oldPassword 旧密码
 @param validateCode 短信验证码
 @param type 类型 1.已登录,主动发起 2.未登录忘记密码
 */
- (void)findPasswordWithPhone:(NSString *)phone
                  newPassword:(NSString *)newPassword
                  oldPassword:(NSString *)oldPassword
                 validateCode:(NSString *)validateCode
                         type:(NSString *)type
                  returnBlock:(FinishedBlock)finished {
    
    NSDictionary *param = @{@"phone":phone,@"newPassword":newPassword,@"oldPassword":oldPassword,@"validateCode":validateCode,@"type":type};
    
    [self asyncPostRequestWithUrl:findPasswordApi parameters:param infoclass:nil finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
    
}

@end
