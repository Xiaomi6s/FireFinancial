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
 注册顶部tips

 @param finished 回调
 */
- (void)registerShowWithReturnBlock:(FinishedBlock)finished;

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
 登录接口
 
 @param phone 手机号
 @param password 密码
 @param finished 回调
 */
- (void)loginWithPhone:(NSString *)phone
              password:(NSString *)password
           returnBlock:(FinishedBlock)finished;

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

/**
 上传头像

 @param image 图片
 @param finished 回调
 */
- (void)uploadAvatarWithImage:(UIImage *)image
                  returnBlock:(FinishedBlock)finished;

/**
 获取提现页面信息
 
 @param finished 回调
 */
- (void)getWithdrawInfoWithReturnBlock:(FinishedBlock)finished;

/**
 确认提现
 
 @param bankId 银行id号
 @param withdrawMoney 提现金额
 @param finished 回调
 */
- (void)withdrawConfirmWithBankId:(NSString *)bankId
                    withdrawMoney:(NSString *)withdrawMoney
                      returnBlock:(FinishedBlock)finished;


@end
