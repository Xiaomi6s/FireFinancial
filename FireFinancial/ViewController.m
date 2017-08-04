//
//  ViewController.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/3.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+FFXJ.h"
#import "FFBasicApi.h"
#import "HomeApi.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeApi *homeApi = [HomeApi new];
    [homeApi getHomefinished:^(FFRequestStatus status, id response) {
        
    }];
    [homeApi getHomefinished:^(FFRequestStatus status, id response) {
        
    }];
    [homeApi getHomefinished:^(FFRequestStatus status, id response) {
        
    }];
    [homeApi getHomefinished:^(FFRequestStatus status, id response) {
        
    }];
    [homeApi getHomefinished:^(FFRequestStatus status, id response) {
        
    }];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
