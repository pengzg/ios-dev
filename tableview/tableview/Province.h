//
//  Province.h
//  tableview
//
//  Created by 彭宗阁 on 2018/8/15.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject

@property(nonatomic, copy) NSString *header;

@property(nonatomic, copy) NSString *footer;

@property(nonatomic, strong) NSArray *cities;

+ (id)provinceWithHeader:(NSString *)header footer:(NSString *)footer cities:(NSArray *)cities;

@end
