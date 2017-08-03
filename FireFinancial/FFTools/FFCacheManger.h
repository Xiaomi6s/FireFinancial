//
//  FFCacheManger.h
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PINCache/PINCache.h>

@interface FFCacheManger : NSObject

@property(nonatomic, strong) PINCache *cache;

+ (instancetype)manager;


/**
 缓存中是否存在对应的数据

 @param key key
 @return bool
 */
- (BOOL)containsObjectForKey:(NSString *)key;

/**
 保存数据到cache

 @param object 保存的数据
 @param key key
 */
- (void)setObject:(id)object withKey:(NSString *)key;

/**
 从cache删除对应的数据

 @param key key
 */
- (void)removeObjectWithKey:(NSString *)key;

/**
 从缓存读取数据

 @param key key
 @return 缓存的数据
 */
- (id)objectFromCacheWithKey:(NSString *)key;

/**
 删除所有数据
 */
- (void)removeAllObject;

/**
 删除所有缓存，包括接口请求的缓存
 */
- (void)removeAllCache;



@end
