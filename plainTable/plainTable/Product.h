//
//  Product.h
//  plainTable
//
//  Created by 彭宗阁 on 2018/8/16.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property(nonatomic, copy) NSString *icon;

@property(nonatomic,copy) NSString *title;

@property(nonatomic, copy) NSString *desc;

+ (id) productWithIcon:(NSString *) icon title:(NSString *) title desc:(NSString *) desc;

- (id)initWithDict:(NSDictionary *) dict;

+ (id) productWithDict:(NSDictionary *)dict;
@end
