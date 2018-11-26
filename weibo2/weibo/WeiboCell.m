//
//  WeiboCell.m
//  weibo
//
//  Created by 彭宗阁 on 2018/8/26.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "WeiboCell.h"
#import "WeiboFrame.h"
#import "Weibo.h"



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


- (void) setWeiboFrame:(WeiboFrame *)weiboFrame
{
    _weiboFrame = weiboFrame;
    Weibo *weibo = _weiboFrame.weibo;
    // 设置数据
    // 头像
     _icon.image = [UIImage imageNamed:weibo.icon];
    //姓名
    _name.text = weibo.name;
    //会员图标
    _vip.hidden = !weibo.vip;
    //时间
    _time.text = weibo.time;
    //来源
    _source.text = weibo.source;
    //微博正文
    _content.text = weibo.content;
    //图片
    if (weibo.img) {
        if ([weibo.img rangeOfString:@"http"].location != NSNotFound) {
            NSLog(@"这是网络图片");
            NSURL *imgUrl = [NSURL URLWithString:weibo.img];
            NSData *imgData = [NSData dataWithContentsOfURL:imgUrl];
            NSLog(@"%@", imgData);
            _img.image = [UIImage imageWithData:imgData];
        } else {
            _img.image = [UIImage imageNamed:weibo.img];
            NSLog(@"名称 %@", weibo.name);
        }
    }
    
    // 设置frame
    
    _icon.frame = _weiboFrame.iconF;
    _name.frame = _weiboFrame.nameF;
    _time.frame = _weiboFrame.timeF;
    _source.frame = _weiboFrame.sourceF;
    _vip.frame = _weiboFrame.vipF;
    _content.frame = _weiboFrame.contentF;
    if (_weiboFrame.weibo.img) {
        
        _img.frame = _weiboFrame.imgF;
    }

}

@end
