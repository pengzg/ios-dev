//
//  NewsViewController.m
//  xlib4cell
//
//  Created by 彭宗阁 on 2018/8/21.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCell.h"
#import "News.h"

@interface NewsViewController ()
{
    NSMutableArray *_newsList;
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _newsList = [NSMutableArray array];
    
    News *news1 = [News newsWithTitle:@"新闻1" author:@"作者1" commentNum:4 icon:@"01.jpg"];
    News *news2 = [News newsWithTitle:@"新闻2" author:@"作者1" commentNum:4 icon:@"01.jpg"];
    News *news3 = [News newsWithTitle:@"新闻3" author:@"作者1" commentNum:4 icon:@"01.jpg"];
    News *news4 = [News newsWithTitle:@"新闻4" author:@"作者1" commentNum:4 icon:@"01.jpg"];
    News *news5 = [News newsWithTitle:@"新闻5" author:@"作者1" commentNum:4 icon:@"01.jpg"];
    [_newsList addObjectsFromArray:@[news1,news2,news3,news4,news5,news1,news2,news3,news4,news5]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    // 2.从缓存池中取数据
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[NewsCell ID]];
    if (cell == nil) {
//        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil];
        
//        cell = objects[0];
        cell = [NewsCell newsCell];
        
    }
    cell.news = _newsList[indexPath.row];
//    UILabel *titleLabel = (UILabel *)[cell viewWithTag:1];
//    titleLabel.text = @"这是什么啊";
    
    
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


@end
