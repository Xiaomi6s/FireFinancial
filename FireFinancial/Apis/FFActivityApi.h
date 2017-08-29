//
//  FFActivityApi.h
//  FireFinancial
//
//  Created by rxj on 2017/8/28.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicApi.h"

@interface FFActivityApi : FFBasicApi


/**
 活动中心列表

 @param finished 回调
 */
- (void)activityListWithFinished:(FinishedBlock)finished;

/**
 记录分享API

 @param activityId 活动id
 @param shareType 分享方式
 @param finished 回调
 */
- (void)activityShareReturnWithActivityId:(int)activityId
                                shareType:(NSString *)shareType
                                 Finished:(FinishedBlock)finished;

@end
