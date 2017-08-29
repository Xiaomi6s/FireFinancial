//
//  FFUserApi.m
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/23.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFUserApi.h"

#import "FFEarnings.h"

static NSString * const findPasswordApi = @"/user/findPassword";
static NSString * const getUserInfoApi = @"/user/myInfo";
static NSString * const realNameApi = @"/user/realName";
static NSString * const registerApi = @"/user/register";
static NSString * const loginApi = @"/user/login";
static NSString * const registerShowApi = @"/user/registerShow";
static NSString * const getValidateCodeApi = @"/user/getValidateCode";
static NSString * const uploadAvatarApi = @"/user/uploadAvatar";
static NSString * const earningsListApi = @"/user/earningsList";


@implementation FFUserApi

/**
 注册顶部tips
 
 @param finished 回调
 */
- (void)registerShowWithReturnBlock:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:registerShowApi parameters:nil infoclass:[FFRegisterShowInfo class] finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

/**
 注册接口
 
 @param phone 电话
 @param password 密码
 @param vcode 验证码
 @param nickName 昵称
 @param recommendCode 推荐码
 @param finished 回调
 */
- (void)registerWithPhone:(NSString *)phone
                 password:(NSString *)password
                    vcode:(NSString *)vcode
                 nickName:(NSString *)nickName
            recommendCode:(NSString *)recommendCode
              returnBlock:(FinishedBlock)finished {
    
    NSDictionary *param = @{@"phone":([NSString stringIsEmpty:phone] ? @"" : phone),
                            @"password":([NSString stringIsEmpty:password] ? @"" : password),
                            @"vcode":([NSString stringIsEmpty:vcode] ? @"" : vcode),
                            @"nickName":([NSString stringIsEmpty:nickName] ? @"" : nickName),
                            @"recommendCode":([NSString stringIsEmpty:recommendCode] ? @"" : recommendCode)};

    
    [self asyncPostRequestWithUrl:registerApi parameters:param infoclass:[FFUserInfo class] finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

/**
 登录接口
 
 @param phone 手机号
 @param password 密码
 @param finished 回调
 */
- (void)loginWithPhone:(NSString *)phone
              password:(NSString *)password
           returnBlock:(FinishedBlock)finished {
    
    NSDictionary *param = @{@"phone":phone,@"password":password};
    
    [self asyncPostRequestWithUrl:loginApi parameters:param infoclass:[FFUserInfo class] finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
    
}

/**
 获取短信验证码
 
 @param phone 手机号
 @param imageCode 图形验证码
 @param type 类型
 1.注册时候点击获取验证码 获取图形验证码
 2.图形验证码确定之后,获取注册验证码
 3.已登录主动修改登录密码时获取验证码
 4.未登录忘记密码,获取验证码
 
 @param finished 回调
 */
- (void)getValidateCodeWithPhone:(NSString *)phone
                       imageCode:(NSString *)imageCode
                            type:(NSString *)type
                     returnBlock:(FinishedBlock)finished {
    
    NSDictionary *param = @{@"phone":phone,@"imageCode":imageCode,@"type":type};
    
    [self asyncPostRequestWithUrl:getValidateCodeApi parameters:param infoclass:[FFMessageCodeInfo class] finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
    
}

/**
 获取用户信息
 
 @param finished 回调
 */
- (void)getUserInfoWithReturnBlock:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:getUserInfoApi parameters:nil infoclass:[FFUserInfo class] finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

/**
 实名认证
 
 @param name 真实名字
 @param cardNumber 身份证号
 */
- (void)realNameWithName:(NSString *)name
              cardNumber:(NSString *)cardNumber
             returnBlock:(FinishedBlock)finished {
    
    NSDictionary *param = @{@"name":name,@"cardNumber":cardNumber};
    
    [self asyncPostRequestWithUrl:realNameApi parameters:param infoclass:[FFUserInfo class] finished:^(FFRequestStatus status, id response) {
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

/**
 上传头像
 
 @param image 图片
 @param finished 回调
 */
- (void)uploadAvatarWithImage:(UIImage *)image returnBlock:(FinishedBlock)finished {
    [self uploadImageWithUrl:uploadAvatarApi parameters:nil image:image infoclass:nil finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

- (void)earningsListWithlastDate:(NSString *)lastDate
                        finished:(FinishedBlock)finished {
    NSDictionary *param = @{@"lastDate": lastDate};
    [self asyncPostRequestWithUrl:earningsListApi
                       parameters:param
                        infoclass:[FFEarnings class]
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

@end
