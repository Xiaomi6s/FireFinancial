//
//  FFBasicApi+Animation.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicApi+Animation.h"

@implementation FFBasicApi (Animation)

- (void)loadingAnimationInView:(UIView *)view {
    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor whiteColor];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"加载中...";
    hud.label.textColor = [UIColor whiteColor];
    hud.bezelView.color = [UIColor colorWithWhite:0 alpha:0.8];
    [hud showAnimated:YES];
    
}

@end
