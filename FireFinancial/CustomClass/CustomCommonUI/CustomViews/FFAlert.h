//
//  FFAlert.h
//  FireFinancial
//
//  Created by 任晓健 on 2017/3/6.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^BtnClickBlock)(NSInteger index);
typedef enum : NSUInteger {
    AlertTypeNormal,
    AlertTypeMoney,
    AlertTypeTransfer
} AlertType;

@interface FFAlert : UIView

typedef void(^SetupBlock)(FFAlert *alert);

/**
 标题
 */
@property(nonatomic, copy) NSString *title;

/**
 内容
 */
@property(nonatomic, copy) NSString *message;

@property(nonatomic, assign) NSTextAlignment messageTextAlignment;

/**
 左边按钮title
 */
@property(nonatomic, copy) NSString *leftTitle;

/**
 右边title
 */
@property(nonatomic, copy) NSString *rightTitle;

/**
 topimg
 */
@property(nonatomic, strong) UIImage *topImg;

/**
 左边按钮
 */
@property(nonatomic, strong) FFButton *leftBtn;

/**
 右边按钮
 */
@property(nonatomic, strong) FFButton *rightBtn;


/**
 投资金额title
 */
@property(nonatomic, copy) NSString *upTitle;

/**
 投资金额
 */
@property(nonatomic, copy) NSString *upTitleDes;

/**
 收益title
 */
@property(nonatomic, copy) NSString *downTitle;

/**
 收益金额
 */
@property(nonatomic, copy) NSString *downTitleDes;

/**
 第三行的title
 */
@property(nonatomic, copy) NSString *thirdTitle;

/**
 第三行的内容
 */
@property(nonatomic, copy) NSString *thirdTitleDes;

/**
 投资金额颜色
 */
@property(nonatomic, strong) UIColor *upDesColor;

/**
 收益金额颜色
 */
@property(nonatomic, strong) UIColor *downDesColor;

/**
 第三行的title颜色
 */
@property(nonatomic, strong) UIColor *thirdTitleColor;

/**
 第三行的title内容颜色
 */
@property(nonatomic, strong) UIColor *thirdTitleDesColor;
/*****创建实例
YLBAlert *alert = [YLBAlert alertWithAlertType:AlertTypeMoney setupBlock:^(YLBAlertView *alert) {
    //        alert.topImg = [UIImage imageNamed:@"logo"];
    //                alert.title = @"标题内容，不得超过11字";
    alert.upTitle = @"投资金额：";
    alert.upTitleDes = @"50,000";
    alert.downTitle = @"持有30天预估收益：";
    alert.downTitleDes = @"3.25";
    alert.upDesColor = [UIColor colorWithRed:20 / 255.0 green:113 / 255.0 blue:213 / 255.0 alpha:1];
    alert.dwonDesColor = [UIColor colorWithRed:20 / 255.0 green:113 / 255.0 blue:213 / 255.0 alpha:1];
    alert.title = @"标题内容";
    alert.message = @"啊哦，余额不足，充值后才可以投资哦～";
    alert.leftTitle = @"按钮文字";
    alert.rightTitle = @"按钮文字";
    alert.leftBgColor = [UIColor whiteColor];
    alert.leftBtn.layer.borderColor = [UIColor colorWithRed:17 / 255.0 green:114 / 255.0 blue:215 / 255.0 alpha:1].CGColor;
    alert.leftBtn.layer.borderWidth = 1;
    [alert.leftBtn setTitleColor:[UIColor colorWithRed:17 / 255.0 green:114 / 255.0 blue:215 / 255.0 alpha:1] forState:UIControlStateNormal];
    alert.rightBgColor = [UIColor colorWithRed:17 / 255.0 green:114 / 255.0 blue:215 / 255.0 alpha:1];
} buttonClick:^(NSInteger index) {
    DLog(@"%ld", index);
}];
[alert show];
 */

/**
 创建alert
 
 @param alertType alert类型目前为两种是否带有money的弹窗
 @param setupBlock 配置alert的各种参数
 @param buttonClick button的点击回调
 @return 返回alert
 */
+ (instancetype)alertWithAlertType:(AlertType)alertType
                        setupBlock:(SetupBlock)setupBlock
                       buttonClick:(BtnClickBlock)buttonClick;
+ (instancetype)new NS_UNAVAILABLE; //禁止通过new创建
- (instancetype)init NS_UNAVAILABLE; //禁止通过init创建
- (id)initWithFrame:(CGRect)frame NS_UNAVAILABLE; //禁止通过init创建
- (void)show;

@end
