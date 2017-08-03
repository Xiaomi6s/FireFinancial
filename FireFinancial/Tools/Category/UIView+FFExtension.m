//
//  UIView+FFExtension.m
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "UIView+FFExtension.h"

@implementation UIView (FFExtension)

- (void)setCornerRadius:(float)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

@end
