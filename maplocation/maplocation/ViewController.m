//
//  ViewController.m
//  maplocation
//
//  Created by 彭宗阁 on 2018/9/6.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>


@property(nonatomic, strong) CLLocationManager *mgr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建locationmanager
    self.mgr = [CLLocationManager new];
    // 请求用户授权
    if ([self.mgr respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.mgr requestWhenInUseAuthorization];
    }
    // 获取用户定位
    self.mgr.delegate = self;
    
    // 定位
    [self.mgr startUpdatingLocation];
    
    // 持续定位
    self.mgr.distanceFilter = 10;
    // 期望精准度
    self.mgr.desiredAccuracy = kCLLocationAccuracyBest;
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"location==>%@", locations);
    CLLocation *loc = locations.lastObject;
    CLLocationCoordinate2D coordinate = loc.coordinate;
    NSLog(@"lo==>%lf", coordinate.latitude);
    double latVal =coordinate.latitude;
    double lngVal = coordinate.longitude;
    _lat.text = [NSString stringWithFormat:@"%lf",latVal];
    _lng.text = [NSString stringWithFormat:@"%lf",lngVal];
    
}


- (IBAction)geoCoderClick:(id)sender {
    
    // 创建对象 c
    CLGeocoder *geoCoder = [CLGeocoder new];
    //
    [geoCoder geocodeAddressString:_address.text inRegion:nil completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        NSLog(@"你好");
        NSLog(@"%@",placemarks.lastObject);
        
        for (CLPlacemark *placemark in placemarks) {
            self.geolat.text = [NSString stringWithFormat:@"%f",placemark.location.coordinate.latitude];
            self.geolng.text = [NSString stringWithFormat:@"%f",placemark.location.coordinate.longitude];
            self.geodetail.text = placemark.name;
            
        }
    }];
}
- (IBAction)revGeoClick:(id)sender {
    // 创建对象 c
    CLGeocoder *revCoder = [CLGeocoder new];
    //
    CLLocation *revLoc = [[CLLocation alloc] initWithLatitude:[self.revLat.text doubleValue] longitude:[self.revLng.text doubleValue]];
    
    // 得到 传入数据
   [revCoder reverseGeocodeLocation:revLoc
                  completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                      for (CLPlacemark *placemark in placemarks) {
                          
                          self.revAddress.text = placemark.name;
                          
                      }
                  }];
    
}
@end
