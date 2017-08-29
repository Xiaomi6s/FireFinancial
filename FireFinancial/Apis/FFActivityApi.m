//
//  FFActivityApi.m
//  FireFinancial
//
//  Created by rxj on 2017/8/28.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFActivityApi.h"
#import "FFActivityInfo.h"

NSString *const activityListApi = @"/activity/activityList";
NSString *const activityShareReturnApi = @"/activity/activityShareReturn";

@implementation FFActivityApi

- (void)activityListWithFinished:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:activityListApi
                       parameters:nil
                        infoclass:[FFActivityInfo class]
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

- (void)activityShareReturnWithActivityId:(int)activityId
                                shareType:(NSString *)shareType
                                 Finished:(FinishedBlock)finished {
    NSDictionary *param = @{@"activityId": @(activityId),
                            @"shareType": shareType};
    [self asyncPostRequestWithUrl:activityShareReturnApi
                       parameters:param
                        infoclass:nil
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

@end
