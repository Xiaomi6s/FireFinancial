//
//  UIView+FFExtension.m
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "UIView+FFExtension.h"

@implementation UIView (FFExtension)

- (CGSize)ff_size {
    return self.frame.size;
}

- (CGFloat)ff_width {
    return self.ff_size.width;
}

- (CGFloat)ff_height {
    return self.ff_size.height;
}

- (void)setCornerRadius:(float)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}



@end
