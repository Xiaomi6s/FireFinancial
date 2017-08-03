//
//  FSResponseObject.m
//  YLBFireShadow
//
//  Created by 任晓健 on 2017/8/1.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFResponseObject.h"
#import <MJExtension/MJExtension.h>

@implementation FFResponseObject

+ (instancetype)instanceWithReturnObject:(id)returnObject infoClass:(Class)infoClass {
    return [[self alloc] initWithRetunObject:returnObject infoClass:infoClass];
}

- (id)initWithRetunObject:(id)returnObject infoClass:(Class)infoClass {
    self = [super init];
    if (self) {
        [self analysisWithJsonDict:returnObject infoClass:infoClass];
    }
    return self;
}

- (void)analysisWithJsonDict:(id)jsonDict infoClass:(Class)infoClass {
    if ([jsonDict isKindOfClass:[NSError class]]) {
        self.error = jsonDict;
    } else {
        if ([jsonDict isKindOfClass:[NSDictionary class]]) {
            self.responseObjectInfo = [infoClass mj_objectWithKeyValues:jsonDict];
            
        }
    }
}

@end
