//
//  MBProgressHUD+FFXJ.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "MBProgressHUD+FFXJ.h"

@implementation MBProgressHUD (FFXJ)

+ (void)showMessage:(NSString *)message {
    [self showMessage:message inView:[UIApplication sharedApplication].windows.lastObject];
}
+ (void)showMessage:(NSString *)message inView:(UIView *)view {
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.mode = MBProgressHUDModeText;
    HUD.detailsLabel.text = message;
    HUD.detailsLabel.font = [UIFont systemFontOfSize:14];
    HUD.bezelView.color = [UIColor colorWithWhite:0 alpha:0.8];
    HUD.removeFromSuperViewOnHide = YES;
    [HUD hideAnimated:YES afterDelay:2.0];
}

@end
