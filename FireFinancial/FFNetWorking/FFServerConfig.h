//
//  FSServerConfig.h
//  YLBFireShadow
//
//  Created by 任晓健 on 2017/8/1.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSServerConfig : NSObject

@property(nonatomic, copy) NSString *serverIP;
@property(nonatomic, copy) NSString *apiVersion;

+ (instancetype)instance;

@end
