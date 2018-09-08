//
//  WeiboFrame.m
//  weibo
//
//  Created by 彭宗阁 on 2018/8/28.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "WeiboFrame.h"
#import "Weibo.h"

#define kBorderWh 20
#define kIconWH 50

#define kVipWH 14
@implementation WeiboFrame

- (void)setWeibo:(Weibo *)weibo
{
    _weibo = weibo;
    // 头像
    CGFloat iconX = kBorderWh;
    CGFloat iconY = kBorderWh;
    
    CGRect iconF = CGRectMake(iconX, iconY, kIconWH, kIconWH);
    _iconF = iconF;
    
    //呢称
    CGFloat nameX = CGRectGetMaxX(_iconF)+kBorderWh;
    CGFloat nameY = iconY;
    CGSize size = [weibo.name sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18.0f],NSStrokeColorAttributeName: [UIColor redColor], NSForegroundColorAttributeName:[UIColor redColor]}];
    _nameF = CGRectMake(nameX, nameY, size.width, size.height);
    
    // vip
    CGFloat vipX = CGRectGetMaxX(_nameF)+100;
    CGFloat vipY = iconY;
    NSLog(@"vipX---%f", vipX);
    _vipF = CGRectMake(vipX, vipY, 14,14);
    
    // time
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(_nameF);
    CGSize timeSize = [weibo.time sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18.0f],NSStrokeColorAttributeName: [UIColor redColor], NSForegroundColorAttributeName:[UIColor redColor]}];
    _timeF = CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    
    // source
    CGFloat sourceX = CGRectGetMaxX(_timeF);
    CGFloat sourceY =CGRectGetMaxY(_nameF);
    CGSize sourceSize = [_weibo.source sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18.0f],NSStrokeColorAttributeName: [UIColor redColor], NSForegroundColorAttributeName:[UIColor redColor]}];
    _sourceF = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    
    
    //    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14]};
    // NSString class method: boundingRectWithSize:options:attributes:context is
    // available only on ios7.0 sdk.
    //    CGRect rect = [textToMeasure boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    // content
    CGFloat contentX = iconX;
    CGFloat contentY = MAX(CGRectGetMaxY(_iconF), CGRectGetMaxY(_timeF)) + kBorderWh;
    //    CGSize contentSize = [_weibo.content sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18.0f],NSStrokeColorAttributeName: [UIColor redColor], NSForegroundColorAttributeName:[UIColor redColor]}];
    CGFloat contentW = 640 - 2*kBorderWh;
    CGRect rect = [_weibo.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:14]} context:nil];
    _contentF = CGRectMake(contentX, contentY, contentW, rect.size.height);

    // img
    if (_weibo.img) {
        CGFloat imgX = iconX;
        CGFloat imgY = CGRectGetMaxY(_contentF);
        NSLog(@"imgY====%f", imgY);
        _imgF = CGRectMake(imgX, imgY, 200, 200);
        _cellHeight = CGRectGetMaxY(_imgF);
    } else {
        _cellHeight = CGRectGetMaxY(_contentF);
    }
}

@end
