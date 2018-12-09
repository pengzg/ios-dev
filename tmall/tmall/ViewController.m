//
//  ViewController.m
//  tmall
//
//  Created by 彭宗阁 on 2018/12/2.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_goodsList;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _goodsList = [NSArray new];
    _goodsList = @[@"1",@"2",@"3",@"4",@"5",@"六",@"七",@"八",@"九",@"十",@"十一",@"十二"];
    _goodsTable.dataSource = self;
    _goodsTable.scrollEnabled = YES;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _goodsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"2222");
    NSString *goodsCell = @"goodsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:goodsCell];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:goodsCell];
    }
    UILabel *lable = [[UILabel alloc] init];
    lable.text =_goodsList[indexPath.row];
    lable.textColor = [UIColor greenColor];
    lable.frame = CGRectMake(0, 0, 600, 600);
    [cell.contentView addSubview:lable];
    //cell.textLabel.text = _goodsList[indexPath.row];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

@end
