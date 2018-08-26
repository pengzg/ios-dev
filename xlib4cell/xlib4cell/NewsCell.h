//
//  NewsCell.h
//  xib4cell
//
//  Created by 彭宗阁 on 2018/8/22.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;
@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *icon;


@property(nonatomic, strong) News *news;

+ (id)newsCell;

+ (NSString *)ID;
@end
