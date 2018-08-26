//
//  Weibo.m
//  weibo
//
//  Created by 彭宗阁 on 2018/8/26.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "Weibo.h"

@implementation Weibo
+ (id)weiboWithIcon:(NSString *)icon name:(NSString *)name time:(NSString *)time source:(NSString *)source content:(NSString *)content img:(NSString *)img vip:(NSString *)vip{
    Weibo *weibo = [[Weibo alloc] init];
    weibo.time = time;
    weibo.name = name;
    weibo.source = source;
    weibo.content = content;
    weibo.img = img;
    weibo.vip = vip;
    weibo.icon = icon;
    
    
    
    return weibo;
}
@end
