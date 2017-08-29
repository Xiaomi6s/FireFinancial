//
//  NSObject+FF.m
//  FireFinancial
//
//  Created by rxj on 2017/8/28.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "NSObject+FF.h"
#import <objc/runtime.h>

@implementation NSObject (FF)

- (FFRequestAgent *)agent {
    FFRequestAgent *agent = objc_getAssociatedObject(self, @selector(agent));
    if (agent == nil) {
        agent = [FFRequestAgent shareInstance];
        objc_setAssociatedObject(self, @selector(agent), agent, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return agent;
}

- (void)setAgentRequestID:(NSString *)reuestID {
    
}

- (void)removeReuestID {
    
}

@end
