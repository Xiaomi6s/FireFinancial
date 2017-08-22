//
//  FFDefine.h
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/22.
//  Copyright © 2017年 rxj. All rights reserved.
//

#ifndef FFDefine_h
#define FFDefine_h

#pragma mark- 屏幕宽高以及比例
#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define FF_basicWidth 375.0
#define FF_Scale (ScreenWidth / FF_basicWidth)
#define Scale_Margin(margin) (FF_Scale > 1 ? ((margin) * FF_Scale): (margin))
#define SmallScale_Margin(margin) (FF_Scale < 1 ? ((margin) * FF_Scale): (margin))

#pragma mark- 判断屏幕
#define IsIphone4 ([UIScreen mainScreen].bounds.size.height == 480 ? YES : NO)
#define IsIphone6_ago ([UIScreen mainScreen].bounds.size.width < 375 ? YES : NO)
#define IsIphone6Plus ([UIScreen mainScreen].bounds.size.width == 414 ? YES : NO)

#pragma mark- 判断设备
#define IsIOS8_ago ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0 ? YES : NO)
#define IsIOS10_after ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ? YES : NO)
#define IsIOS11_after ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0 ? YES : NO)


#endif /* FFDefine_h */
