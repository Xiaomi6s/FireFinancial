//
//  UIColor+Extension.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FFExtension)

/**
 *  获取UIColor(已经除了255.0)
 *
 *  @param red   255  红
 *  @param green 255  绿
 *  @param blue  255  蓝
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithR:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

/**
 *  获取UIColor(已经除了255.0)
 *
 *  @param red   255  红
 *  @param green 255  绿
 *  @param blue  255  蓝
 *  @param alpha 1.0  透明度
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithR:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 *  通过16进制获取颜色
 *
 *  @param colorString (0x123443 ,#232322 ,232322)
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)colorString;

@end
