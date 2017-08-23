//
//  FFUserApi.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/23.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicApi.h"

@interface FFUserApi : FFBasicApi

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
              returnBlock:(FinishedBlock)finished;

/**
 获取用户信息
 
 @param finished 回调
 */
- (void)getUserInfoWithReturnBlock:(FinishedBlock)finished;

/**
 实名认证

 @param name 真实名字
 @param cardNumber 身份证号
 */
- (void)realNameWithName:(NSString *)name
              cardNumber:(NSString *)cardNumber
             returnBlock:(FinishedBlock)finished;

/**
 找回密码(1.已登录,主动发起; 2.未登录忘记密码)

 @param phone 手机号
 @param newPassword 新密码
 @param oldPassword 旧密码
 @param validateCode 短信验证码
 @param type 类型 1.已登录,主动发起 2.未登录忘记密码
 @param finished 回调
 */
- (void)findPasswordWithPhone:(NSString *)phone
                  newPassword:(NSString *)newPassword
                  oldPassword:(NSString *)oldPassword
                 validateCode:(NSString *)validateCode
                         type:(NSString *)type
                  returnBlock:(FinishedBlock)finished;




@end
