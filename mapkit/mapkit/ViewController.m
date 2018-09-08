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
    // ios新增
    self.mapView.showsTraffic = YES;
    self.mapView.showsCompass = YES;
    self.mapView.showsScale = YES;
    
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
    
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
//    self.mapView.region = MKCoordinateRegionMake(self.mapView.userLocation.location.coordinate, span);
    // 设置中心点 可以设置动画
    [self.mapView setRegion:MKCoordinateRegionMake(self.mapView.userLocation.location.coordinate, span) animated:YES];
}

#pragma mark 地图显示区域发生改变后调用
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"latitudeDelta=>%f,longitudeDelta=>%f", self.mapView.region.span.latitudeDelta, self.mapView.region.span.longitudeDelta);
}
@end
