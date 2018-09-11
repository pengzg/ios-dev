//
//  ViewController.m
//  baiduMap2
//
//  Created by 彭宗阁 on 2018/9/9.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件
#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件
#import <Social/Social.h>


@interface ViewController () <BMKMapViewDelegate, BMKPoiSearchDelegate>
{
    BMKMapView *_mapView;
    BMKPoiSearch *_searcher;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mapView = [[BMKMapView alloc] init];
    [_mapView setMapType:BMKMapTypeSatellite];
     self.view = _mapView;
    

    [self performSelector:@selector(poiSearch) withObject:nil afterDelay:3];
   
}

//实现PoiSearchDeleage处理回调结果
- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPOISearchResult *)poiResult errorCode:(BMKSearchErrorCode)errorCode
{
    if (errorCode == BMK_SEARCH_NO_ERROR) {
        //在此处理正常结果
         NSLog(@"%@", poiResult);
    }else if (errorCode == BMK_SEARCH_AMBIGUOUS_KEYWORD){
        //当在设置城市未找到结果，但在其他城市找到结果时，回调建议检索城市列表
        // result.cityList;
        NSLog(@"起始点有歧义");
    }else {
        NSLog(@"抱歉，未找到结果");
    }
    
}

- (void) poiSearch
{
    //初始化搜索对象 ，并设置代理
    _searcher =[[BMKPoiSearch alloc]init];
    _searcher.delegate = self;
    //请求参数类BMKCitySearchOption
    BMKPOICitySearchOption *citySearchOption = [[BMKPOICitySearchOption alloc]init];
    citySearchOption.pageIndex = 1;
    citySearchOption.pageSize = 10;
    citySearchOption.city= @"北京";
    citySearchOption.keyword = @"小吃";
    //发起城市内POI检索
    BOOL flag = [_searcher poiSearchInCity:citySearchOption];
    if(flag) {
        NSLog(@"城市内检索发送成功");
    }
    else {
        NSLog(@"城市内检索发送失败");
    }
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]){
        NSLog(@"分享不可用");
        return ;
    }
    
    SLComposeViewController *composeVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
    [self presentViewController:composeVC animated:YES completion:^{
        
    }];
}


@end
