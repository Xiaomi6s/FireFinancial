//
//  UIImage+FFExtension.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FFExtension)

/**
 coreimage高斯模糊

 @param image 需要模糊的图片
 @param blur 模糊程度
 @return 高斯模糊后的图片
 */
+(UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

/**
 vimage高斯模糊(需导入<Accelerate/Accelerate.h>)

 @param image 需要模糊的图片
 @param blur 模糊程度
 @return 高斯模糊后的图片
 */
+(UIImage *)boxBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

/**
 颜色转换image

 @param color 颜色
 @return 颜色转成image
 */
+ (UIImage *)imgWithColor:(UIColor *)color;

/**
 颜色转换image

 @param color 颜色
 @param size 新创建的位图上下文的大小
 @return 颜色转成image
 */
+ (UIImage *)imgWithColor:(UIColor *)color size:(CGSize)size;

/**
 给图片设置圆角

 @param radius 圆角
 @return 带圆角的图片
 */
-(UIImage*)imageWithCornerRadius:(CGFloat)radius;
@end
