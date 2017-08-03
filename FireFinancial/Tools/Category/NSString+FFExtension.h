//
//  NSString+Extension.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FFExtension)

/**
 判断是否为纯数字
 
 @param string 字符串
 @return 布尔值
 */
+ (BOOL)isPureNumber:(NSString *)string;

/**
 判断字符串是否为空
 
 @param object 字符串
 @return 布尔
 */
+ (BOOL)stringIsEmpty:(NSString *)object;

@end
