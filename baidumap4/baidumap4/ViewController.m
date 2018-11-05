//
//  ViewController.m
//  baiduMap2
//
//  Created by 彭宗阁 on 2018/9/9.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"
#import <BMKLocationKit/BMKLocationManager.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件
#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件

@interface ViewController () <BMKMapViewDelegate, BMKLocationManagerDelegate>
@property(nonatomic,strong) BMKMapView *mapView;
@property(nonatomic, strong) BMKUserLocation *userlocation;
@property(nonatomic, strong) BMKLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mapView = [[BMKMapView alloc] init];
    [_mapView setTrafficEnabled:YES];
    [_mapView setMapType:BMKMapTypeSatellite];
    [_mapView setUserTrackingMode:BMKUserTrackingModeFollow];
    [_mapView setShowsUserLocation:YES];
    self.view = _mapView;
}

-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

- (void)BMKLocationManager:(BMKLocationManager *)manager didUpdateLocation:(BMKLocation *)location orError:(NSError *)error
{
    NSLog(@"location=>%@", location);
}


@end
