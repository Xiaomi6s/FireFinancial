//
//  FFCashActivityApi.m
//  FireFinancial
//
//  Created by rxj on 2017/8/28.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFCashActivityApi.h"

#import "FFSiginInfo.h"

NSString *const myCashSignListApi = @"/cashActivity/myCashSignList";
NSString *const sendSignApi = @"/cashActivity/sendSign";
NSString *const signLoadingApi = @"/cashActivity/sendSign";

@implementation FFCashActivityApi

- (void)myCashSignListWithSiginId:(int)siginId
                         finished:(FinishedBlock)finished {
    NSDictionary *parma = @{@"siginId": @(siginId)};
    [self asyncPostRequestWithUrl:myCashSignListApi
                       parameters:parma
                        infoclass:[FFSiginInfo class]
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
                         }];
}

- (void)sendSignWithFinished:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:sendSignApi
                       parameters:nil
                        infoclass:nil
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
    }];
}

- (void)signLoadingWithFinished:(FinishedBlock)finished {
    [self asyncPostRequestWithUrl:signLoadingApi
                       parameters:nil
                        infoclass:nil
                         finished:^(FFRequestStatus status, id response) {
        finished(status, response);
                         }];
}

@end
