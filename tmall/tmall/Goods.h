//
//  Goods.h
//  tmall
//
//  Created by 彭宗阁 on 2018/12/9.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Goods : NSObject
@property(nonatomic,copy) NSString *goodsId;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *salenum;
@property(nonatomic,copy) NSString *price;
@property(nonatomic,copy) NSArray *activityList;
@property(nonatomic,copy) NSString *themeName;


+ (id)goodsWithGoodsId:(NSString *) goodsId name:(NSString *) name icon:(NSString *) icon salenum:(NSString *) salenum price:(NSString *) price activityList:(NSArray *) activityList themeName:(NSString *) themeName;
@end

NS_ASSUME_NONNULL_END
