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
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, copy) NSArray *apis;

@end

@implementation ViewController

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = nil;
    NSDictionary *dic = @{@"222": str, @"333": @"333",@"666": @"666"};
    
    self.title = @"apis";
    [self loadData];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    UIImage *img = [UIImage imageNamed:@"11"];
    NSData *data = UIImagePNGRepresentation(img);
    DLog(@"%ld",data.length / 1024);
}

- (void)loadData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"apis" ofType:@"plist"];
    if (filePath) {
        self.apis = [NSArray arrayWithContentsOfFile:filePath];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.apis.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *mApis = self.apis[section][@"apis"];
    return mApis.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSArray *mApis = self.apis[indexPath.section][@"apis"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@/%@(%@)",self.apis[indexPath.section][@"apiModel"], mApis[indexPath.row][@"apiurl"], mApis[indexPath.row][@"apiName"]];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = self.apis[section][@"apiModel"];
    return title;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
