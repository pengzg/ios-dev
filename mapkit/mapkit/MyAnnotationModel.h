//
//  MyAnnotationModel.h
//  mapkit
//
//  Created by 彭宗阁 on 2018/9/8.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotationModel : NSObject<MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;

@end
