//
//  ViewController.m
//  sensor
//
//  Created by 彭宗阁 on 2018/9/16.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
@property(nonatomic, strong) CMMotionManager *motionMgr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 开启距离传感器
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityStateDidChangeNotification) name:UIDeviceProximityStateDidChangeNotification object:nil];
   // 陀螺仪push
    self.motionMgr = [CMMotionManager new];
    
    [self gyroPull];
    
}

- (void)proximityStateDidChangeNotification
{
    if ([UIDevice currentDevice].proximityState) {
        NSLog(@"YES");
    } else {
        NSLog(@"NO");
    }
}

- (void) gyroPull
{
    if (![self.motionMgr isGyroAvailable]) {
        NSLog(@"陀螺仪不可用");
        return;
        
    }
      [self.motionMgr startGyroUpdates];
}


- (void) gyroPush
{
    if (![self.motionMgr isGyroAvailable]) {
        NSLog(@"陀螺仪不可用");
        return;
        
    }
    self.motionMgr.gyroUpdateInterval = 1;
    
    [self.motionMgr startGyroUpdatesToQueue:[NSOperationQueue new] withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
        CMRotationRate rotationData = gyroData.rotationRate;
        
        
        
        NSLog(@"x=>%f, y=>%f, z=>%f", rotationData.x, rotationData.y, rotationData.z);
    }];
}

#pragma mark push方式 需要设置取样时间间隔
- (void)accelerometerPush
{
    // 加速计
    self.motionMgr = [CMMotionManager new];
    
    if (![self.motionMgr isAccelerometerAvailable]) {
        NSLog(@"加速计不可用");
        return ;
    }
    // [self accelerometerPush];
    
    
    self.motionMgr.accelerometerUpdateInterval = 1;
    
    [self.motionMgr startAccelerometerUpdatesToQueue:[NSOperationQueue new] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        NSLog(@"data=>%@", accelerometerData);
    }];
}

- (void)accelerometerPull
{
    // 加速计
    self.motionMgr = [CMMotionManager new];
    
    if (![self.motionMgr isAccelerometerAvailable]) {
        NSLog(@"加速计不可用");
        return ;
    }
    // [self accelerometerPush];
    
    [self.motionMgr startAccelerometerUpdates];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
//    CMAcceleration acceleration = self.motionMgr.accelerometerData.acceleration;
//
//    NSLog(@"x==>%f,y==>%f, z==>%f", acceleration.x, acceleration.y, acceleration.z);
        CMRotationRate rotationData = self.motionMgr.gyroData.rotationRate;
    
        NSLog(@"x==>%f,y==>%f, z==>%f", rotationData.x, rotationData.y, rotationData.z);
}

@end
