//
//  NSString+Extension.m
//  FireFinancial
//
//  Created by 刘红梅 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "NSString+FFExtension.h"

@implementation NSString (FFExtension)

#pragma mark - 判断字符串是否为纯数字
+ (BOOL)isPureNumber:(NSString *)string {
    return [self isPureInt:string] || [self isPureFloat:string];
}

//判断是否为int类型
+ (BOOL)isPureInt:(NSString *)string {
    NSScanner *scanner = [NSScanner scannerWithString:string];
    int val;
    return [scanner scanInt:&val] && [scanner isAtEnd];
}
//判断是否为float类型
+ (BOOL)isPureFloat:(NSString *)string {
    NSScanner *scanner = [NSScanner scannerWithString:string];
    float val;
    return [scanner scanFloat:&val] && [scanner isAtEnd];
}

+ (BOOL)stringIsEmpty:(NSString *)object {
    if ([object isEqual:[NSNull null]]) {
        return YES;
    } else if ([object isKindOfClass:[NSNull class]]) {
        return YES;
    } else if (nil == object){
        return YES;
    } else if ([object isEqualToString:@""]) {
        return YES;
    }
    return NO;
}

@end
