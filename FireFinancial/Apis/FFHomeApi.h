//
//  HomeApi.h
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/4.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFBasicApi.h"

@interface FFHomeApi : FFBasicApi

- (void)getHomefinished:(FinishedBlock)finished;

@end
