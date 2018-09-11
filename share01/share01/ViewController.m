//
//  ViewController.m
//  share01
//
//  Created by 彭宗阁 on 2018/9/10.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]){
        NSLog(@"分享不可用");
        return ;
    }
    
    SLComposeViewController *composeVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
    [self presentViewController:composeVC animated:YES completion:^{
        
    }];
}

@end
