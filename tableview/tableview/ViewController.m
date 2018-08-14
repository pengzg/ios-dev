//
//  ViewController.m
//  tableview
//
//  Created by 彭宗阁 on 2018/8/12.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
{
    NSArray *_gdCities;
    NSArray *_hnCities;
    NSArray *_sdCities;
    NSArray *_allCities;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView  = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.scrollEnabled = YES;
    [self.view addSubview:tableView];
    
    
    _gdCities = @[@"广东",@"东莞",@"惠州",@"深圳"];
    _hnCities = @[@"长沙",@"益阳",@"岳阳"];
    _sdCities = @[@"济南", @"青岛", @"烟台", @"枣庄"];
    _allCities = @[_gdCities,_hnCities,_sdCities];
}


#pragma mark 数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   // return 2;
    return _allCities.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (section ==0) {
//        return _gdCities.count;
//    } else {
//        return _hnCities.count;
//    }
    NSArray *sectionCities =_allCities[section];
    return sectionCities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    indexPath.row
//    indexPath.section
    NSString *text = nil;
//    if (indexPath.section ==0) {
//        text = _gdCities[indexPath.row];
//    } else {
//        text = _hnCities[indexPath.row];
//    }
    
    text = _allCities[indexPath.section][indexPath.row];
    
//    NSArray *sectionCities =_allCities[indexPath.section];
//    text = sectionCities[indexPath.row];
    
    UITableViewCell *tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    tableCell.textLabel.text = text;
    NSLog(@"session= %ld ,row = %ld", indexPath.section,indexPath.row);
    return tableCell;
}

#pragma mark 组头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"哈";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
