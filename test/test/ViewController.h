//
//  ViewController.h
//  test
//
//  Created by 彭宗阁 on 2020/2/29.
//  Copyright © 2020 pengzg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ViewController : UIViewController
{
    NSDate *startDate;
    IBOutlet UIImageView *pokerImage;
}
@property(nonatomic,copy)NSDate *startDate;

@property(nonatomic,retain)UIImageView *pokerImage;

- (IBAction)pokerPressed;


- (IBAction)showTip:(UIButton *)sender;

@end

