//
//  ViewController.m
//  guide
//
//  Created by 彭宗阁 on 2018/9/9.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>


@interface ViewController () <MKMapViewDelegate>

@property (nonatomic, strong) CLLocationManager *mgr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mgr = [CLLocationManager new];
    
    if ([[UIDevice currentDevice].systemVersion doubleValue]>9.0) {
        [self.mgr requestWhenInUseAuthorization];
    }
    [self.mgr startUpdatingLocation];
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
}



- (IBAction)goGuide:(id)sender {
    
    CLGeocoder *geoCoder = [CLGeocoder new];
    
    [geoCoder geocodeAddressString:self.address.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        MKMapItem *source = [MKMapItem mapItemForCurrentLocation];
        
        MKPlacemark *mkpm = [[MKPlacemark alloc] initWithPlacemark:placemarks.lastObject];
        
        
        
        MKMapItem *dis = [[MKMapItem alloc] initWithPlacemark:mkpm];
        
        NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving};
        
        [MKMapItem openMapsWithItems:@[source,dis] launchOptions:options];
    }];
    
    
    
   
    
}

- (IBAction)drawLine:(id)sender {
    
    CLGeocoder *geoCoder = [CLGeocoder new];
    
    [geoCoder geocodeAddressString:self.address.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
    
        MKPlacemark *sourceMkpm = [[MKPlacemark alloc] initWithCoordinate:self.mapView.userLocation.location.coordinate];
        MKMapItem *source = [[MKMapItem alloc] initWithPlacemark:sourceMkpm];
        
        MKPlacemark *disMkpm = [[MKPlacemark alloc] initWithPlacemark:placemarks.firstObject];
        MKMapItem *dis = [[MKMapItem alloc] initWithPlacemark:disMkpm];
        
        
        MKDirectionsRequest *request = [MKDirectionsRequest new];
        
        request.source = source;
        NSLog(@"source=>%@", source);
        request.destination = dis;
        
        MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
        
        [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
            
            if (response.routes.count ==0 || error) {
                return ;
            }
            
            for (MKRoute *route in response.routes) {
                MKPolyline *line = route.polyline;
                
                [self.mapView addOverlay:line];
            }
            
            
        }];
    }];
    
    
}

#pragma mark 设置地图渲染
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *polyLine = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    
    polyLine.strokeColor = [UIColor greenColor];
    
    return polyLine;
    
}
@end
