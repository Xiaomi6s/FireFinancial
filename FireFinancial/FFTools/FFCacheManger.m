//
//  FFCacheManger.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFCacheManger.h"
#import "FFRequestCache.h"

@implementation FFCacheManger

+ (instancetype)manager {
    static FFCacheManger *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
        manager.cache = [[PINCache alloc] initWithName:@"FireFinancial.DataCanche"];
    });
    return manager;
}

/**
 缓存中是否存在对应的数据
 
 @param key key
 @return bool
 */
- (BOOL)containsObjectForKey:(NSString *)key {
    return [self.cache containsObjectForKey:key];
}

/**
 保存数据到cache
 
 @param object 保存的数据
 @param key key
 */
- (void)setObject:(id)object withKey:(NSString *)key {
    [self.cache setObject:object forKey:key];
}

/**
 从cache删除对应的数据
 
 @param key key
 */
- (void)removeObjectWithKey:(NSString *)key {
    [self.cache removeObjectForKey:key];
}

/**
 从缓存读取数据
 
 @param key key
 @return 缓存的数据
 */
- (id)objectFromCacheWithKey:(NSString *)key {
   return [self.cache objectForKey:key];
}

/**
 删除所有数据
 */
- (void)removeAllObject {
    [self.cache removeAllObjects];
}

/**
 删除所有缓存，包括接口请求的缓存
 */
- (void)removeAllCache {
    [self.cache removeAllObjects];
    [[FFRequestCache instance] removeAllRequestCache];
}

@end
