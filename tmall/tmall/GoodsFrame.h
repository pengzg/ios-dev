//
//  GoodsFrame.h
//  tmall
//
//  Created by 彭宗阁 on 2018/12/9.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "Goods.h"
NS_ASSUME_NONNULL_BEGIN

@interface GoodsFrame : NSObject

@property(nonatomic, assign) CGRect *goodsIdF;
@property(nonatomic, assign) CGRect *iconF;
@property(nonatomic, assign) CGRect *nameF;
@property(nonatomic, assign) CGRect *saleNumF;
@property(nonatomic, assign) CGRect *priceF;
@property(nonatomic, assign) CGRect *activityListF;
@property(nonatomic, assign) CGRect *themeNameF;

@property(nonatomic, assign) CGFloat *cellHeight;

@property(nonatomic, strong) Goods *goods;

@end

NS_ASSUME_NONNULL_END
