//
//  FFSilderButton.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/22.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFSilderButton.h"

@implementation FFSilderButton

- (instancetype)init {
    if (self = [super initWithFrame:CGRectZero]) {
        self.currentTransformSx = 1.0;
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.currentTransformSx = 1.0;
        
    }
    
    return self;
}

- (void)setCurrentTransformSx:(CGFloat)currentTransformSx {
    _currentTransformSx = currentTransformSx;
    self.transform = CGAffineTransformMakeScale(currentTransformSx, currentTransformSx);
}

@end
