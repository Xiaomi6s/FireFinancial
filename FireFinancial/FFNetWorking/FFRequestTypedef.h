//
//  FFRequestTypedef.h
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#ifndef FFRequestTypedef_h
#define FFRequestTypedef_h

typedef enum : NSUInteger {
    FFRequestStatusSuccess = 0, //请求成功
    FFRequestStatusFail         //请求失败
} FFRequestStatus;

typedef void (^FinishedBlock)(FFRequestStatus status, id response);





#endif /* FFRequest_h */
