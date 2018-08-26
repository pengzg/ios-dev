//
//  news.h
//  xib4cell
//
//  Created by 彭宗阁 on 2018/8/22.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *author;
@property(nonatomic,assign) int *commentNum;
@property(nonatomic,copy) NSString *icon;

+ (id)newsWithTitle:(NSString *) title author:(NSString *)author commentNum:(int *) commentNum icon:(NSString *)icon;

@end
