//
//  NSLayoutConstraint+FFExtension.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/22.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "NSLayoutConstraint+FFExtension.h"

@implementation NSLayoutConstraint (FFExtension)

- (void)resetScale {
    self.constant = Scale_Margin(self.constant);
}
- (void)setAllScale {
    self.constant = self.constant * FF_Scale;
}

- (void)resetSmallScreenSacle {
    self.constant = SmallScale_Margin(self.constant);
}

@end
