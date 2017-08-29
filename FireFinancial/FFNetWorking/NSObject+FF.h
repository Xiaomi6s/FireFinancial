//
//  NSObject+FF.h
//  FireFinancial
//
//  Created by rxj on 2017/8/28.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFRequestAgent.h"

@interface NSObject (FF)

@property(nonatomic, strong, readonly) FFRequestAgent *agent;

@end
