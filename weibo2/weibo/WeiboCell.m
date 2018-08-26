//
//  WeiboCell.m
//  weibo
//
//  Created by 彭宗阁 on 2018/8/26.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "WeiboCell.h"
#import "Weibo.h"

#define kBorderWh 20
#define kIconWH 50

#define kVipWH 14

@interface WeiboCell()
{
    // 头像
    UIImageView *_icon;
    //姓名
    UILabel *_name;
    //会员图标
    UIImageView *_vip;
    //时间
    UILabel *_time;
    //来源
    UILabel *_source;
    //微博正文
    UILabel *_content;
    //图片
    UIImageView *_img;
}
@end

@implementation WeiboCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 头像
        _icon  = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon];
        //姓名
        _name  = [[UILabel alloc] init];
        [self.contentView addSubview:_name];
        //会员图标
        _vip  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vip.png"]];
        [self.contentView addSubview:_vip];
        //时间
        _time  = [[UILabel alloc] init];
        _time.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_time];
        //来源
        _source  = [[UILabel alloc] init];
        _source.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_source];
        //微博正文
        _content  = [[UILabel alloc] init];
        _content.numberOfLines = 0;
        [self.contentView addSubview:_content];
        //图片
        _img  = [[UIImageView alloc] init];
        [self.contentView addSubview:_img];
    }
    
    return self;
}


- (void) setWeibo:(Weibo *)weibo
{
    _weibo = weibo;
    // 设置数据
    // 头像
     _icon.image = [UIImage imageNamed:_weibo.icon];
    //姓名
    _name.text = _weibo.name;
    //会员图标
    _vip.hidden = !weibo.vip;
    //时间
    _time.text = _weibo.time;
    //来源
    _source.text = _weibo.source;
    //微博正文
    _content.text = _weibo.content;
    //图片
    _img.image = [UIImage imageNamed:_weibo.name];
    NSLog(@"名称 %@", _weibo.name);
    // 设置frame
    // 头像
    CGFloat iconX = kBorderWh;
    CGFloat iconY = kBorderWh;
    
    CGRect iconF = CGRectMake(iconX, iconY, kIconWH, kIconWH);
    _icon.frame = iconF;
    
    //呢称
    CGFloat nameX = CGRectGetMaxX(_icon.frame)+kBorderWh;
    CGFloat nameY = iconY;
    CGSize size = [_weibo.name sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18.0f],NSStrokeColorAttributeName: [UIColor redColor], NSForegroundColorAttributeName:[UIColor redColor]}];
    _name.frame = CGRectMake(nameX, nameY, size.width, size.height);
    
    // vip
    CGFloat vipX = CGRectGetMaxX(_name.frame)+100;
    CGFloat vipY = iconY;
    NSLog(@"vipX---%f", vipX);
    _vip.frame = CGRectMake(vipX, vipY, 14,14);
    
    // time
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(_name.frame);
    CGSize timeSize = [_weibo.time sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18.0f],NSStrokeColorAttributeName: [UIColor redColor], NSForegroundColorAttributeName:[UIColor redColor]}];
    _time.frame = CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    
    // source
    CGFloat sourceX = CGRectGetMaxX(_time.frame);
    CGFloat sourceY =CGRectGetMaxY(_name.frame);
    CGSize sourceSize = [_weibo.source sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18.0f],NSStrokeColorAttributeName: [UIColor redColor], NSForegroundColorAttributeName:[UIColor redColor]}];
    _source.frame = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    
    
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14]};
    // NSString class method: boundingRectWithSize:options:attributes:context is
    // available only on ios7.0 sdk.
//    CGRect rect = [textToMeasure boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    // content
    CGFloat contentX = iconX;
    CGFloat contentY = MAX(CGRectGetMaxY(_icon.frame), CGRectGetMaxY(_time.frame)) + kBorderWh;
//    CGSize contentSize = [_weibo.content sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18.0f],NSStrokeColorAttributeName: [UIColor redColor], NSForegroundColorAttributeName:[UIColor redColor]}];
    CGFloat contentW = self.frame.size.width - 2*kBorderWh;
    CGRect rect = [_weibo.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:14]} context:nil];
    _content.frame = CGRectMake(contentX, contentY, contentW, rect.size.height);
    
    CGFloat cellHeight = 0;
    // img
    if (weibo.img) {
        CGFloat imgX = iconX;
        CGFloat imgY = CGRectGetMaxY(_content.frame);
        NSLog(@"imgY====%f", imgY);
        _img.image = [UIImage imageNamed:weibo.img];
        _img.frame = CGRectMake(imgX, imgY, 200, 200);
        cellHeight = CGRectGetMaxY(_img.frame);
    } else {
        cellHeight = CGRectGetMaxY(_content.frame);
    }
}

@end
