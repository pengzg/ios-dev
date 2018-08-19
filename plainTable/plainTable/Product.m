//
//  Product.m
//  plainTable
//
//  Created by 彭宗阁 on 2018/8/16.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "Product.h"

@implementation Product

+ (id)productWithIcon:(NSString *)icon title:(NSString *)title desc:(NSString *)desc
{
    Product *product = [[Product alloc] init];
    product.icon = icon;
    product.title = title;
    product.desc = desc;
    
    return product;
}

-(id)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.desc = dict[@"desc"];
    }
    
    return self;
}

+ (id)productWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
