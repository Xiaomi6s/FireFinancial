//
//  HomeApi.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/4.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFHomeApi.h"
#import "FFRequestTypedef.h"


static NSString * const homeApi = @"/hlc/home/index";

@implementation FFHomeApi

- (void)getHomeIndexWithFinished:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:homeApi parameters:nil infoclass:nil finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

@end
