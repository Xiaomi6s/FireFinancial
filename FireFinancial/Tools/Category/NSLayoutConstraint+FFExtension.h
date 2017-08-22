//
//  NSLayoutConstraint+FFExtension.h
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/22.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (FFExtension)

//针对6p进行距离扩大 *FS_Scale（屏幕宽的比）
- (void)resetScale;
//针对所有屏幕进行距离缩放 *FS_Scale（屏幕宽的比）
- (void)setAllScale;
- (void)resetSmallScreenSacle;

@end
