//
//  ViewController.m
//  mapkit
//
//  Created by 彭宗阁 on 2018/9/8.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>

@property(nonatomic, strong) CLLocationManager *mgr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mgr = [CLLocationManager new];
    
    if ([UIDevice currentDevice].systemVersion.doubleValue>8.0) {
        [self.mgr requestWhenInUseAuthorization];
    }
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    self.mapView.delegate = self;
    
}

#pragma mark 大头针模型
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{

    CLGeocoder *geoCoder = [CLGeocoder new];
    [geoCoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        userLocation.title = placemarks.lastObject.locality;
        userLocation.subtitle = placemarks.lastObject.name;
        
        
    }];
    
}


- (IBAction)mapTypeChange:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        case 3:
            self.mapView.mapType = MKMapTypeHybridFlyover;
            break;
        case 4:
            self.mapView.mapType = MKMapTypeSatelliteFlyover;
            break;
        case 5:
            self.mapView.mapType = MKMapTypeMutedStandard;
            break;
            
        default:
            self.mapView.mapType = MKMapTypeStandard;
            break;
    }
    
//    self.mapView.mapType =
}

#pragma mark 返回用户位置
- (IBAction)backMyLocation:(id)sender {
    // 设置中心点
    self.mapView.centerCoordinate = self.mapView.userLocation.location.coordinate;
}
@end
