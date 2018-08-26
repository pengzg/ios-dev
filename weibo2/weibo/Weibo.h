//
//  Weibo.h
//  weibo
//
//  Created by 彭宗阁 on 2018/8/26.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weibo : NSObject

@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *time;
@property(nonatomic,copy) NSString *source;
@property(nonatomic,copy) NSString *content;
@property(nonatomic,copy) NSString *img;
@property(nonatomic,copy) NSString *vip;

+ (id) weiboWithIcon:(NSString *)icon name:(NSString *)name time:(NSString *)time source:(NSString *)source content:(NSString *)content img:(NSString *)img vip:(NSString *)vip;

@end
