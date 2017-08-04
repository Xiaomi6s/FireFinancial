//
//  HomeApi.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/4.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "HomeApi.h"
#import "FFRequestTypedef.h"
#import "FFBasicApi+Animation.h"

static NSString * const homeApi = @"/Home/finance";

@implementation HomeApi

- (void)getHomefinished:(FinishedBlock)finished {
    [self loadingAnimationInView:[self viewOfcurrentVC]];
    [self asyncPostRequestWithUrl:homeApi parameters:nil infoclass:nil finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (!window) {
        if ( [UIApplication sharedApplication].windows.count > 0) {
            window = [UIApplication sharedApplication].windows.firstObject;
        }
    }
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        UIView *frontView;
        NSArray *winSubviews = [window subviews];
        if (winSubviews && winSubviews.count > 0) {
            frontView = [[window subviews] objectAtIndex:0];
            nextResponder = [frontView nextResponder];
        } else {
            nextResponder = window.rootViewController;
        }
    }
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    return result;
}

- (UIView *)viewOfcurrentVC {
   return [self getCurrentVC].view;
}

@end
