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
    
//    [self performSelector:@selector(after) withObject:nil afterDelay:1];
   
}

- (void)after {
    HomeApi *homeApi = [HomeApi new];
    [homeApi getHomefinished:^(FFRequestStatus status, id response) {
        
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
