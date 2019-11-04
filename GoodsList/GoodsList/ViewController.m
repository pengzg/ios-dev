//
//  ViewController.m
//  GoodsList
//
//  Created by 彭宗阁 on 2018/11/27.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *_goodsList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    _goodsList = [NSArray new];
    _goodsList = @[@"1",@"2",@"3"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"2222");
    NSString *goodsCell = @"goodsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:goodsCell];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:goodsCell];
    }
    cell.textLabel.text = _goodsList[indexPath.row];
    return cell;

}

 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
@end
