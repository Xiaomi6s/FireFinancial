//
//  FFRequestCache.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFRequestCache.h"

static NSString *const cacheTimeKey = @"cacheTime";
static NSString *const cacheDataKey = @"cacheData";

@implementation FFRequestCache

+ (instancetype)instance {
    static FFRequestCache *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.cache = [[PINCache alloc] initWithName:@"FireFinancial.RequestCanche"];
        instance.validTime = NSUIntegerMax;
    });
    return instance;
}

- (BOOL)isExistCacheWithKey:(NSString *)key {
    if ([self isExistCacheWithKey:key]) {
        NSDictionary *dict = [self.cache objectForKey:key];
        NSTimeInterval cacheTime = [dict[cacheTimeKey] integerValue];
        if ([self getNowTime] - cacheTime < self.validTime) {
            return YES;
        } else {
            [self.cache removeObjectForKey:key];
        }
    }
    return NO;
}

- (id)objectFromCacheWithKey:(NSString *)key {
    if ([self isExistCacheWithKey:key]) {
        NSDictionary *dict = [self.cache objectForKey:key];
        NSTimeInterval cacheTime = [dict[cacheTimeKey] integerValue];
        if ([self getNowTime] - cacheTime < self.validTime) {
            return dict[cacheDataKey];
        } else {
            [self.cache removeObjectForKey:key];
        }
    }
    return nil;
}

- (void)setObject:(id)object
   toCacheWithKey:(NSString *)key {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dict setObject:@([self getNowTime]) forKey:cacheTimeKey];
    [dict setObject:object forKey:cacheDataKey];
    [self.cache setObject:dict forKey:key];
}

- (NSTimeInterval)getNowTime {
    NSTimeInterval nowTime;
    NSDate *date = [NSDate date];
    nowTime = [date timeIntervalSinceNow];
    return nowTime;
}

- (void)removeAllRequestCache {
    [self.cache removeAllObjects];
}

@end
