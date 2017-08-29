//
//  APITestVC.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/23.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "APITestVC.h"
#import "FFUserApi.h"

@interface APITestVC ()

@end

@implementation APITestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    FFUserApi *userApi = [FFUserApi new];
    [userApi loginWithPhone:@"15800436830" password:@"123456a" returnBlock:^(FFRequestStatus status, id response) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
