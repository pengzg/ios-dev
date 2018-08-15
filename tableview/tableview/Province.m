//
//  Province.m
//  tableview
//
//  Created by 彭宗阁 on 2018/8/15.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "Province.h"

@implementation Province

+ (id)provinceWithHeader:(NSString *)header footer:(NSString *)footer cities:(NSArray *)cities
{
    Province *province = [[Province alloc] init];
    province.cities = cities;
    province.footer = footer;
    province.header = header;
    return province;
}

@end
