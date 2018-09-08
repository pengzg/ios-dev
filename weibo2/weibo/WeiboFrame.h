//
//  WeiboFrame.h
//  weibo
//
//  Created by 彭宗阁 on 2018/8/28.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Weibo;

@interface WeiboFrame : NSObject

@property(nonatomic, assign, readonly) CGRect iconF;
@property(nonatomic, assign, readonly) CGRect nameF;
@property(nonatomic, assign, readonly) CGRect vipF;
@property(nonatomic, assign, readonly) CGRect sourceF;
@property(nonatomic, assign, readonly) CGRect timeF;
@property(nonatomic, assign, readonly) CGRect contentF;
@property(nonatomic, assign, readonly) CGRect imgF;

@property(nonatomic, assign) CGFloat cellHeight;

@property(nonatomic, strong) Weibo *weibo;


@end
