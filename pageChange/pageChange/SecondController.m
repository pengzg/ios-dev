//
//  SecondController.m
//  pageChange
//
//  Created by 彭宗阁 on 2018/9/22.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "SecondController.h"
#import "ViewController.h"


@interface SecondController ()
{
    UIButton *_btn;
}
@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rec = CGRectMake(100, 100, 100, 100);
    _btn = [[UIButton alloc] initWithFrame:rec];
    [_btn setTitle:_detailId forState:UIControlStateNormal];
    _btn.backgroundColor = [UIColor redColor];
    
    [_btn addTarget:nil action:@selector(jump1) forControlEvents:UIControlEventTouchDown];
    [self.view setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_btn];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) jump1
{
     ViewController *first = [ViewController new];
    [self presentViewController:first animated:YES completion:nil];//从
}

@end
