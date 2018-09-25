//
//  ViewController.h
//  httpRequest
//
//  Created by 彭宗阁 on 2018/9/23.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
- (IBAction)login:(id)sender;


@end

