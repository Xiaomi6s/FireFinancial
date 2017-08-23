//
//  NSDictionary+FFExtension.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/23.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "NSDictionary+FFExtension.h"
#import <objc/runtime.h>

@implementation NSDictionary (FFExtension)

+(void)load {
    Method dictionaryWithObjects = class_getClassMethod(self, @selector(dictionaryWithObjects:forKeys:count:));
    Method crashDictionaryWithObjects = class_getClassMethod(self, @selector(crashDictionaryWithObjects:forKeys:count:));
    method_exchangeImplementations(dictionaryWithObjects, crashDictionaryWithObjects);
}


+ (instancetype)crashDictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt {
    id instance = nil;
    @try {
       instance = [self crashDictionaryWithObjects:objects forKeys:keys count:cnt];
    } @catch (NSException *exception) {
        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        id  _Nonnull __unsafe_unretained newKeys[cnt];
        for (int i=0; i<cnt; i++) {
            if (objects[i] && keys[i]) {
                newObjects[index] = objects[i];
                newKeys[index] = keys[i];
                index++;
            }
            if (!objects[i]) {
                NSLog(@"value of %@ is nil",keys[i]);
            }
        }
        instance = [self crashDictionaryWithObjects:newObjects forKeys:newKeys count:index];
        
    } @finally {
        return instance;
    }
}

@end
