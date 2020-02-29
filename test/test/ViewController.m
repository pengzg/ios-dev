//
//  ViewController.m
//  test
//
//  Created by 彭宗阁 on 2020/2/29.
//  Copyright © 2020 pengzg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"考反应扑克游戏" message:@"当黑桃出现时以最快速度按下扑克"  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertView addAction:cancel];

    
//    [self presentingViewController:alertView];
   
}


@end
