//
//  DetailViewController.h
//  plainTable
//
//  Created by 彭宗阁 on 2019/4/6.
//  Copyright © 2019 pengzg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property(weak, nonatomic) NSString *detailId;
@property(weak, nonatomic) NSString *productName;

@end

NS_ASSUME_NONNULL_END
