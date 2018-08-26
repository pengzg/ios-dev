//
//  news.m
//  xib4cell
//
//  Created by 彭宗阁 on 2018/8/22.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "News.h"

@implementation News
+ (id)newsWithTitle:(NSString *)title author:(NSString *)author commentNum:(int *)commentNum icon:(NSString *)icon
{
    News *news = [[News alloc] init];
    news.author = author;
    news.title = title;
    news.icon = icon;
    news.commentNum = commentNum;
    return news;
}
@end
