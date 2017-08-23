//
//  UIView+FFExtension.h
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FFExtension)

@property(nonatomic, readonly) CGSize ff_size;
@property(nonatomic, readonly) CGFloat ff_height;
@property(nonatomic, readonly) CGFloat ff_width;

/**
 设置圆角

 @param radius 圆角
 */
- (void)setCornerRadius:(float)radius;


@end
