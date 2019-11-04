//
//  ViewController.h
//  plainTable
//
//  Created by 彭宗阁 on 2018/8/15.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)delData:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *delBtn;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

- (IBAction)editData:(id)sender;

@end

