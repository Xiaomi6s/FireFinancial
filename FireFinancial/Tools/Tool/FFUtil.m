//
//  FSUtil.m
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFUtil.h"
#import "NSString+FFExtension.h"

@implementation FFUtil

#pragma mark - 金钱的处理
+ (NSString *)minSymbolOfmoneyStr:(NSString *)moneyStr {
    moneyStr = [NSString stringWithFormat:@"%@", moneyStr];
    return [moneyStr stringByReplacingOccurrencesOfString:@"," withString:@""];
}

+ (NSString *)handleOfMoneyStr:(NSString *)moneyStr isLost:(BOOL)isLost precision:(int)precision  {
    moneyStr = [self minSymbolOfmoneyStr:moneyStr];
    NSString *handleStr = nil;
    if (moneyStr == nil || moneyStr.length <= 0) {
        return moneyStr;
    }
    if (![NSString isPureNumber:moneyStr]) {
        return moneyStr;
    }
    if ([moneyStr componentsSeparatedByString:@"."].count >= 2) {
        NSArray *strArray = [moneyStr componentsSeparatedByString:@"."];
        NSString *intStr = strArray.firstObject;
        NSString *floatStr = strArray.lastObject;
        NSInteger floatLenth = floatStr.length;
        if (floatLenth <= precision) {
            NSInteger offset = precision - floatLenth;
            NSMutableString *mFloat = [[NSMutableString alloc] initWithString:floatStr];
            for (int i=0; i<offset; i++) {
                [mFloat appendString:@"0"];
            }
            floatStr = mFloat;
            
        } else {
            if (isLost) {
                floatStr = [floatStr substringToIndex:precision];
            } else {
                floatStr = [NSString stringWithFormat:@"0.%@", floatStr];
                NSNumberFormatter *nFormat = [[NSNumberFormatter alloc] init];
                [nFormat setMaximumFractionDigits:precision];
                floatStr = [nFormat stringFromNumber:@([floatStr doubleValue])];
                if ([floatStr isEqualToString:@"1"]) {
                    intStr = [NSString stringWithFormat:@"%ld", (long)[intStr integerValue] + 1];
                    NSMutableString *mFloat = [[NSMutableString alloc] initWithString:@""];
                    for (int i=0; i<precision; i++) {
                        [mFloat appendString:@"0"];
                    }
                    floatStr = mFloat;
                } else {
                    floatStr = [[floatStr componentsSeparatedByString:@"."] lastObject];
                }
                
            }
        }
        if (precision > 0) {
            handleStr = [NSString stringWithFormat:@"%@.%@", intStr, floatStr];
        } else {
            handleStr = intStr;
        }
        
        
    } else {
        NSMutableString *mStr = [[NSMutableString alloc] initWithString:moneyStr];
        if (precision > 0) {
            [mStr appendString:@"."];
            for (int i=0; i<precision; i++) {
                [mStr appendString:@"0"];
            }
        }
        handleStr = mStr;
        
        
    }
    return [self separtedMoneyStringWithStr:handleStr];
}

+ (NSString *)separtedMoneyStringWithStr:(NSString *)moneyStr {
    NSString *finishStr = nil;
    if (moneyStr == nil || moneyStr.length <= 0) {
        return moneyStr;
    }
    if ([moneyStr componentsSeparatedByString:@"."].count >= 2) {
        NSArray *strs = [moneyStr componentsSeparatedByString:@"."];
        NSString *intStr = strs.firstObject;
        NSString *floatStr = strs.lastObject;
        NSString *intSepStr = [self separatedStringWithStr:intStr];
        finishStr = [NSString stringWithFormat:@"%@.%@", intSepStr, floatStr];
        
    } else {
        finishStr = [self separatedStringWithStr:moneyStr];
    }
    return finishStr;
}

+ (NSString *)separatedStringWithStr:(NSString *)bankStr {
    if (bankStr.length <= 3) {
        return bankStr;
    } else {
        NSMutableString *mStr = [[NSMutableString alloc] initWithString:bankStr];
        int sCount = (int)mStr.length / 3;
        if (mStr.length % 3 == 0) {
            sCount -= 1;
        }
        if (sCount > 0) {
            for (int i=0; i<sCount; i++) {
                [mStr insertString:@"," atIndex:(mStr.length - 3 * (i + 1) - i)];
            }
        }
        return mStr;
    }
}

#pragma mark - 传入占位宽度，创建占位UIBarButtonItem
+ (UIBarButtonItem *)evGetPlaceItemBySettingSpaceWidth:(float)spaceWidth {
    //UIBarButtonSystemItemFlexibleSpace调整间距，占位用
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = spaceWidth;
    return negativeSpacer;
    
}

#pragma mark - 判断手机号是否合法
+ (BOOL)isMobileNumber:(NSString *)mobileNum {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,147,183
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189,181
     */
    NSString * MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0-9]|8[0-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188，183
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[156])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)) {
        return YES;
    } else {
        return NO;
    }
}


#pragma mark - 改变指定位置的颜色
+ (NSMutableAttributedString *)NSMutableAttributedStringWithString:(NSString *)str
                                                           atRange:(NSRange)range
                                                         withColor:(UIColor *)color{
    NSMutableAttributedString * result = [[NSMutableAttributedString alloc]initWithString:str];
    
    [result addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    
    return result;
}

+ (UIViewController *)getCurrentVC {
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    
    return result;
}


@end
