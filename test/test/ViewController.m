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

@synthesize startDate;

@synthesize pokerImage;

int spadeON = 0;
- (void)viewDidLoad {
    [super viewDidLoad];
    pokerImage.image = [UIImage imageNamed:@"pokerBack.jpeg"];
    
}


-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    pokerImage.image = [UIImage imageNamed:@"pokerBack.jpeg"];
    spadeON = 0;
    [NSTimer scheduledTimerWithTimeInterval:(3.0) target:self selector:@selector(onOtherAceTime) userInfo:nil repeats:NO];
    
}

-(void)onSpadesAceTimer{
    pokerImage.image = [UIImage imageNamed:@"spadesAce.jpeg"];
    spadeON = 1;
    self.startDate = [NSDate date];
}

-(void)onOtherAceTimer{
    int rNumber = rand()%3;
    switch (rNumber) {
        case 0:
            pokerImage.image = [UIImage imageNamed:@"clubsAce.jpeg"];
            break;
        case 1:
            pokerImage.image = [UIImage imageNamed:@"diamonsAce.jpeg"];
            break;
            
        case 2:
            pokerImage.image = [UIImage imageNamed:@"heartsAce.jpeg"];
            break;
            
        default:
            break;
    }
    int delay = ((int)(random()%7)+1);
    [NSTimer scheduledTimerWithTimeInterval:3.0+delay target:self selector:@selector(onSpadesAceTimer) userInfo:nil repeats:NO];
}

-(IBAction)pokerPressed{
    NSLog(@"点击按钮");
    double noSeconds = (double)[self.startDate timeIntervalSinceNow] *-1000;
    NSString *reactionTime = [[NSString alloc]initWithFormat:@"好样的", noSeconds];
    if (spadeON==0) {
        reactionTime = @"请不要着急，等到黑桃出现时才能按下扑克";
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"考反应扑克游戏" message:reactionTime  preferredStyle:UIAlertControllerStyleAlert];
     UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];

     NSLog(@"这是什么啊");
     
     [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)showTip:(UIButton *)sender {
    
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"考反应扑克游戏" message:@"当黑桃出现时以最快速度按下扑克"  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
       [alert addAction:cancel];

        NSLog(@"这是什么啊");
        
        [self presentViewController:alert animated:YES completion:nil];
}

-(void)dealloc{
   
}

@end
