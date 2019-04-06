//
//  ViewController.m
//  searchList
//
//  Created by 彭宗阁 on 2019/4/6.
//  Copyright © 2019 pengzg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *_tableData;
    NSArray *_searchData;
    BOOL isSearch;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    isSearch = NO;
    _tableData = [NSArray arrayWithObjects:@"java", @"c++", @"php", @"python",nil];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.layer.cornerRadius = 12;
    cell.layer.masksToBounds = YES;
    
    NSInteger rowNo = indexPath.row;
    
    if (isSearch) {
        cell.textLabel.text = [_searchData objectAtIndex:rowNo];
    } else {
        cell.textLabel.text = [_tableData objectAtIndex:rowNo];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (isSearch) {
        return _searchData.count;
    } else {
        return _tableData.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    isSearch = NO;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self filterBySubstring:searchBar.text];
    [self resignFirstResponder];
}

-(void)filterBySubstring:(NSString *) searchText
{
    isSearch = YES;
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c]%@", searchText];
    _searchData = [_tableData filteredArrayUsingPredicate:pred];
    NSLog(@"%ld", _searchData.count);
}

@end
