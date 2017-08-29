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
#import "RSAEncryptor.h"
#import "NSString+AES.h"
#import "APITestVC.h"
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
//    NSString *rsaStr = [RSAEncryptor encryptString:@"深圳市信融财富投资管理有限公司创办于2012年3月，注册资本6904.55万元人民币，实收资本5704.55万元人民币，总部位于深圳，拥有完整的产品、研发、风控、财务以及客服等职能体系，是一家具备优秀的自主研发能力的金融创新型企业，在2014年当选广东互联网金融协会首届副会长单位。我们旨在通过为投资人提供低风险、收益率适中的投资理财服务，帮助其实现资产的稳健增值；同时，通过为融资方高效解决资金需求，帮助其改善生产和生活" publicKey:@""];
//    NSString *aesStr = @"NG9OZHZoVWViY29qK2pGSWk5a0U1THpDNWtsWVJBWWl1TW5RMm15UjBJaz0=";
//    NSData *aesData = [aesStr dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *aesData2 = [[NSData alloc] initWithBase64EncodedData:aesData options:0];
//    NSString *str11 = [[NSString alloc] initWithData:aesData2 encoding:NSUTF8StringEncoding];
//    NSString *encodStr = @"hello mei";
//    NSString *enStr = [encodStr AES_encrypt];
//    NSString *denStr = [enStr AES_decrypt];
//    NSString *str3 = [str11 AES_decrypt];
    
    self.title = @"apis";
    [self loadData];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    APITestVC *testVC = [APITestVC new];
    [self.navigationController pushViewController:testVC animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
