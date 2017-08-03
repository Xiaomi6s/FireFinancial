//
//  FFRequestCache.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFRequestCache.h"

@implementation FFRequestCache

+ (instancetype)instance {
    static FFRequestCache *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.cache = [PINCache sharedCache];
    });
    return instance;
}

- (BOOL)isExistCacheWithKey:(NSString *)key {
    if ([self.cache containsObjectForKey:key]) {
        return YES;
    }
    return NO;
}

@end
