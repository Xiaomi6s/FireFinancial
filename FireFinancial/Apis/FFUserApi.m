//
//  FFUserApi.m
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/23.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFUserApi.h"
#import "FFWithdrawInfo.h"
#import "FFUserAssetInfo.h"
#import "FFEarnings.h"
#import "FFRechargeLodingInfo.h"
#import "FFMessageListInfo.h"

static NSString * const findPasswordApi = @"/user/findPassword";
static NSString * const getUserInfoApi = @"/user/myInfo";
static NSString * const realNameApi = @"/user/realName";
static NSString * const registerApi = @"/user/register";
static NSString * const loginApi = @"/login/submit";
static NSString * const registerShowApi = @"/user/registerShow";
static NSString * const getValidateCodeApi = @"/Security/getValidateCode";
static NSString * const uploadAvatarApi = @"/user/uploadAvatar";
static NSString * const withdrawLoadingInfoApi = @"/user/withdrawLoadingInfo";
static NSString * const withdrawConfirmApi = @"/user/withdrawRequest";
static NSString * const earningsListApi = @"/user/earningsList";
static NSString * const queryPayResultApi = @"/user/queryPayResult";
static NSString * const userAssetApi = @"/user/asset";
static NSString * const userRechargeApi = @"/user/recharge";
static NSString * const captchaApi = @"/register/captcha";
static NSString * const messageListApi = @"/message/list";
static NSString * const updateMessageStatusApi = @"/message/upMessageStatus";

@implementation FFUserApi

/**
 注册顶部tips
 
 @param finished 回调
 */
- (void)registerShowWithReturnBlock:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:registerShowApi
                       parameters:nil
                        infoclass:[FFRegisterShowInfo class]
                         finished:^(FFRequestStatus status, id response) {
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

    
    [self asyncPostRequestWithUrl:registerApi
                       parameters:param
                        infoclass:[FFUserInfo class]
                         finished:^(FFRequestStatus status, id response) {
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
    
    [self asyncPostRequestWithUrl:loginApi
                       parameters:param
                        infoclass:[FFUserInfo class]
                         finished:^(FFRequestStatus status, id response) {
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
    
    [self asyncPostRequestWithUrl:getValidateCodeApi
                       parameters:param
                        infoclass:[FFMessageCodeInfo class]
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
    
}

/**
 获取用户信息
 
 @param finished 回调
 */
- (void)getUserInfoWithReturnBlock:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:getUserInfoApi
                       parameters:nil
                        infoclass:[FFUserInfo class]
                         finished:^(FFRequestStatus status, id response) {
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
    
    [self asyncPostRequestWithUrl:realNameApi
                       parameters:param
                        infoclass:[FFUserInfo class]
                         finished:^(FFRequestStatus status, id response) {
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
    
    [self asyncPostRequestWithUrl:findPasswordApi
                       parameters:param
                        infoclass:nil
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
    
}

/**
 上传头像
 
 @param image 图片
 @param finished 回调
 */
- (void)uploadAvatarWithImage:(UIImage *)image returnBlock:(FinishedBlock)finished {
    [self uploadImageWithUrl:uploadAvatarApi
                  parameters:nil
                       image:image
                   infoclass:nil
                    finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

/**
 获取提现页面信息
 
 @param finished 回调
 */
- (void)getWithdrawInfoWithReturnBlock:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:withdrawLoadingInfoApi
                       parameters:nil infoclass:[FFWithdrawInfo class]
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

/**
 确认提现
 
 @param bankId 银行id号
 @param withdrawMoney 提现金额
 @param finished 回调
 */
- (void)withdrawConfirmWithBankId:(NSString *)bankId
                    withdrawMoney:(NSString *)withdrawMoney
                      returnBlock:(FinishedBlock)finished{
    NSDictionary *param = @{@"bankId":bankId,@"withdrawMoney":withdrawMoney};
    
    [self asyncPostRequestWithUrl:withdrawConfirmApi
                       parameters:param infoclass:nil
                         finished:^(FFRequestStatus status, id response) {
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

/**
 获取用户资产
 
 @param finished 回调
 */
- (void)getUserAssetWithReturnBlock:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:userAssetApi
                       parameters:nil
                        infoclass:[FFUserAssetInfo class]
                         finished:^(FFRequestStatus status, id response) {
                             finished(status, response);
                         }];
}

/**
 加载用户充值页面的信息
 
 @param finished 回调
 */
- (void)getUserRechargeLoadingInfoWithReturnBlock:(FinishedBlock)finished{
    [self asyncPostRequestWithUrl:queryPayResultApi
                       parameters:nil
                        infoclass:[FFRechargeLodingInfo class]
                         finished:^(FFRequestStatus status, id response) {
                             finished(status, response);
                         }];
}

/**
 充值接口
 
 @param bindCardNo 充值卡号
 @param amount 充值金额
 @param bindCardCode 绑卡短信验证码
 @param sms 充值短信验证码
 @param businessNo 商户流水号
 @param finished 回调
 */
- (void)rechargeRequestWithbindCardNo:(NSString *)bindCardNo
                               amount:(NSString *)amount
                         bindCardCode:(NSString *)bindCardCode
                                  sms:(NSString *)sms
                           businessNo:(NSString *)businessNo
                          returnBlock:(FinishedBlock)finished {
     NSDictionary *param = @{@"bindCardNo": bindCardNo,@"amount":amount,@"sms":sms,@"businessNo":businessNo};
    [self asyncPostRequestWithUrl:userRechargeApi
                       parameters:param
                        infoclass:[FFRechargeBusinessNoInfo class]
                         finished:^(FFRequestStatus status, id response) {
                             finished(status, response);
                         }];
    
}

- (void)captchaApiWithFinished:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:captchaApi
                       parameters:nil
                        infoclass:nil
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
/**
 获取消息和公告列表
 
 @param messageId 消息id 分页用 第一次传空字符串
 @param type 1公告 2消息
 */
- (void)getMessageListWithMessageId:(NSString *)messageId
                               type:(NSString *)type
                        returnBlock:(FinishedBlock)finished {
    NSDictionary *param = @{@"messageId": messageId,@"type":type};
    [self asyncPostRequestWithUrl:messageListApi
                       parameters:param
                        infoclass:[FFMessageListInfo class]
                         finished:^(FFRequestStatus status, id response) {
                             finished(status, response);
                         }];

}

/**
 更新消息状态为已读
 
 @param ids “19,21,245”
 @param finished 回调
 */
- (void)updateMessageStatusWithMessageIds:(NSString *)ids
                              returnBlock:(FinishedBlock)finished{
    NSDictionary *param = @{@"ids": ids};
    [self asyncPostRequestWithUrl:updateMessageStatusApi
                       parameters:param
                        infoclass:nil
                         finished:^(FFRequestStatus status, id response) {
                             finished(status, response);
                         }];
}

@end
