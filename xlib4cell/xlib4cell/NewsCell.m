//
//  NewsCell.m
//  xib4cell
//
//  Created by 彭宗阁 on 2018/8/22.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "NewsCell.h"
#import "News.h"
@implementation NewsCell

+ (id)newsCell
{
    return [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil][0];
}


- (void) setNews:(News *)news
{
    _titleLabel.text = news.title;
    _authorLabel.text = news.author;
//    _commentLabel.text
    _icon.image = [UIImage imageNamed:news.icon];
}

+(NSString *)ID
{
    return @"news";
}
@end
