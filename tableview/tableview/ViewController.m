//
//  ViewController.m
//  tableview
//
//  Created by 彭宗阁 on 2018/8/12.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"
#import "Province.h"
#define kHeader @"header"

@interface ViewController () <UITableViewDataSource>
{
    NSArray *_gdCities;
    NSArray *_hnCities;
    NSArray *_sdCities;
    NSArray *_allCities;
    
    NSArray *_allProvince;
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
    
    Province *sxCities = [Province provinceWithHeader:@"陕西" footer:@"古城墙" cities:@[@"西安",@"延安"]];
    // 用对象初始化数据
    Province *hn = [[Province alloc] init];
    hn.header = @"河南";
    hn.footer = @"井盖之都";
    hn.cities = @[@"郑州",@"安阳", @"信阳"];
//    _allProvince = @[
//                     @{
//                         kHeader:@"广东",
//                         @"footer":@"广东好",
//                         @"cities":_gdCities
//                     },
//                     @{
//                         kHeader:@"湖南",
//                         @"footer":@"湖好",
//                         @"cities":_hnCities
//                    },
//                     @{
//                         kHeader:@"山东",
//                         @"footer":@"微山湖好",
//                         @"cities":_sdCities
//                    }
//                     ];
    _allProvince = @[
                     hn,sxCities,
                     [Province provinceWithHeader:@"山西" footer:@"太行山" cities:@[@"太原",@"大同",@"运城"]],
                     [Province provinceWithHeader:@"江苏" footer:@"总统府" cities:@[@"南京",@"苏州",@"徐州"@"无锡",@"连云港"]]
                     ];
    
}


#pragma mark 数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   // return 2;
   // return _allCities.count;
    
    return _allProvince.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (section ==0) {
//        return _gdCities.count;
//    } else {
//        return _hnCities.count;
//    }
    
//    NSArray *sectionCities =_allCities[section];
//    return sectionCities.count;
    
//    NSDictionary *province = _allProvince[section];
//    NSArray *cities = province[@"cities"];
    
    Province *province = _allProvince[section];
    return province.cities.count;
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
    
 //   text = _allCities[indexPath.section][indexPath.row];
    
//    NSArray *sectionCities =_allCities[indexPath.section];
//    text = sectionCities[indexPath.row];
    
//    NSDictionary *province = _allProvince[indexPath.section];
//    NSArray *cities = province[@"cities"];
    
    Province *province = _allProvince[indexPath.section];
    
    text = province.cities[indexPath.row];
    
    
    
    UITableViewCell *tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    tableCell.textLabel.text = text;
    NSLog(@"session= %ld ,row = %ld", indexPath.section,indexPath.row);
    return tableCell;
}

#pragma mark 组头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    //return _allProvince[section][kHeader];
    Province *province = _allProvince[section];
    return  province.header;
    
}
#pragma mark 返回右边索引条
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *titles  = [NSMutableArray array];
    for (Province *p in _allProvince) {
        [titles addObject:p.header];
    }
    return titles;
}


#pragma mark 组尾
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{

    
//    return _allProvince[section][@"footer"];
    
    Province *province = _allProvince[section];
    return  province.footer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
