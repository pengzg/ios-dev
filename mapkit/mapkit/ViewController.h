//
//  ViewController.h
//  mapkit
//
//  Created by 彭宗阁 on 2018/9/8.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)mapTypeChange:(UISegmentedControl *)sender;
- (IBAction)backMyLocation:(id)sender;


@end

