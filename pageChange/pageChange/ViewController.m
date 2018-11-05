//
//  ViewController.m
//  pageChange
//
//  Created by 彭宗阁 on 2018/9/22.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"
#import "SecondController.h"
@interface ViewController ()
{
    UIButton *_btn;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rec = CGRectMake(100, 100, 100, 100);
    _btn = [[UIButton alloc] initWithFrame:rec];
    [_btn setTitle:@"11111111" forState:UIControlStateNormal];
    _btn.backgroundColor = [UIColor blueColor];
    
    [_btn addTarget:nil action:@selector(jump) forControlEvents:UIControlEventTouchDown];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_btn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)jump
{
    NSLog(@"跳转");
//    [self.window setRootViewController:VC];
    SecondController *second = [SecondController new];
    second.detailId = @"rtwt";
    [self presentViewController:second animated:YES completion:nil];//从当前界面到nextVC
    
//    [self dismissViewControllerAnimated:YES completion:nil];//从nextVC界面回去
    
   
}

@end
