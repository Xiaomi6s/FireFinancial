//
//  FFRequestCache.h
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PINCache/PINCache.h>

@interface FFRequestCache : NSObject

@property(nonatomic, strong) PINCache *cache;
@property(nonatomic, assign) NSUInteger validTime; //缓存失效时间单位为秒

/**
 初始化

 @return instance单例
 */
+ (instancetype)instance;

/**
 cache中是否存在该key对应的数据

 @param key key
 @return 是否存在
 */
- (BOOL)isExistCacheWithKey:(NSString *)key;


/**
 根据key从cache中取出数据

 @param key key
 @return object
 */
- (id)objectFromCacheWithKey:(NSString *)key;

/**
 保存数据到cache中

 @param object 保存的数据
 @param key 对应的key
 */
- (void)setObject:(id)object
   toCacheWithKey:(NSString *)key;

/**
 清除所有请求的缓存
 */
- (void)removeAllRequestCache;


@end
