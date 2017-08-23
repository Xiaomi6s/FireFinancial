//
//  FFAboutApi.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/23.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFAboutApi.h"

static NSString * const appConfigApi = @"/hlc/about/appConfig";

@implementation FFAboutApi

- (void)getAppConfigWithFinished:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:appConfigApi
                       parameters:nil
                        infoclass:nil
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

@end
