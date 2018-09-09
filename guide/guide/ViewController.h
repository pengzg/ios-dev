//
//  ViewController.h
//  guide
//
//  Created by 彭宗阁 on 2018/9/9.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *address;

- (IBAction)goGuide:(id)sender;
- (IBAction)drawLine:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

