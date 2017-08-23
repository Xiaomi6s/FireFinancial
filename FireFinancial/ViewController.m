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

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
