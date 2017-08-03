//
//  FSUtil.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FFUtil : NSObject

/**
 金钱处理
 
 @param moneyStr moneyStr description
 @param isLost 是否舍去
 @param precision 保留位数
 */
+ (NSString *)handleOfMoneyStr:(NSString *)moneyStr isLost:(BOOL)isLost precision:(int)precision;

/**
 去掉逗号
 
 @param moneyStr 带逗号的钱
 @return 不带逗号
 */
+ (NSString *)minSymbolOfmoneyStr:(NSString *)moneyStr;

#pragma mark - Convert tools

/**
 添加一个固定宽度的占位item (导航item和toolbar item中可用)
 
 @param spaceWidth 宽度
 @return UIBarButtonItem
 */
+ (UIBarButtonItem *)evGetPlaceItemBySettingSpaceWidth:(float)spaceWidth;

/**
 判断手机号是否有效
 
 @param mobileNum 手机号码
 @return 布尔
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/**
 改变指定范围内的字体颜色
 
 @param str 字符串
 @param range 范围
 @param color 需要变得颜色
 @return 改变颜色后的完整串
 */
+ (NSMutableAttributedString *)NSMutableAttributedStringWithString:(NSString *)str
                                                           atRange:(NSRange)range
                                                         withColor:(UIColor *)color;

/**
 获取当前页面控制器
 
 @return 当前视图控制器
 */
+ (UIViewController *)getCurrentVC;

@end
