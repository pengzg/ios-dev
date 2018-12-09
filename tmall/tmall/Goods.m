//
//  Goods.m
//  tmall
//
//  Created by 彭宗阁 on 2018/12/9.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "Goods.h"

@implementation Goods

+ (id)goodsWithGoodsId:(NSString *)goodsId name:(NSString *)name icon:(NSString *)icon salenum:(NSString *)salenum price:(NSString *)price activityList:(NSArray *)activityList themeName:(NSString *)themeName
{
    Goods *goods = [[Goods alloc] init];
    goods.goodsId = goodsId;
    goods.name = name;
    goods.icon = icon;
    goods.salenum = salenum;
    goods.price = price;
    goods.activityList = activityList;
    goods.themeName = themeName;
    
    return goods;
    
}

@end
