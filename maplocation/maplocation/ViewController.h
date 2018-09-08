//
//  ViewController.h
//  maplocation
//
//  Created by 彭宗阁 on 2018/9/6.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lat;
@property (weak, nonatomic) IBOutlet UILabel *lng;
@property (weak, nonatomic) IBOutlet UITextField *address;
- (IBAction)geoCoderClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *geolat;
@property (weak, nonatomic) IBOutlet UILabel *geolng;
@property (weak, nonatomic) IBOutlet UILabel *geodetail;

@property (weak, nonatomic) IBOutlet UITextField *revLat;

@property (weak, nonatomic) IBOutlet UITextField *revLng;

- (IBAction)revGeoClick:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *revAddress;

@end

