//
//  MBProgressHUD+FFXJ.h
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (FFXJ)

+ (void)showMessage:(NSString *)message;
+ (void)showMessage:(NSString *)message inView:(UIView *)view;

@end
