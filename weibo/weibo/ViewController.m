//
//  ViewController.m
//  weibo
//
//  Created by 彭宗阁 on 2018/8/25.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"
#import "WeiboCell.h"
#import "Weibo.h"


@interface ViewController ()
{
    NSMutableArray *_weiboList;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _weiboList = [NSMutableArray array];
    NSString *content = @"iOS是由苹果公司开发的移动操作系统 [1]  。苹果公司最早于2007年1月9日的Macworld大会上公布这个系统，最初是设计给iPhone使用的，后来陆续套用到iPod touch、iPad以及Apple TV等产品上。iOS与苹果的Mac OS X操作系统一样，属于类Unix的商业操作系统。原本这个系统名为iPhone OS，因为iPad，iPhone，iPod touch都使用iPhone OS，所以2010WWDC大会上宣布改名为iOS（iOS为美国Cisco公司网络设备操作系统注册商标，苹果改名已获得Cisco公司授权）。";
    Weibo *weibo1 = [Weibo weiboWithIcon:@"01.jpg" name:@"彭" time:@"2018-02-02 23:32:33" source:@"来自iphone客户端" content:content img:nil vip:nil];
    Weibo *weibo2 = [Weibo weiboWithIcon:@"02.jpg" name:@"彭宗" time:@"2018-02-02 23:32:33" source:@"来自iphone客户端" content:@"这是测试" img:@"02.jpg" vip:@"02.jpg"];
    Weibo *weibo3 = [Weibo weiboWithIcon:@"03.jpg" name:@"彭宗阁" time:@"2018-02-02 23:32:33" source:@"来自iphone客户端" content:@"这是测试" img:@"02.jpg" vip:@"02.jpg"];
    Weibo *weibo4 = [Weibo weiboWithIcon:@"02.jpg" name:@"彭宗阁彭" time:@"2018-02-02 23:32:33" source:@"来自iphone客户端" content:@"这是测试" img:@"02.jpg" vip:@"02.jpg"];
    
    [_weiboList addObjectsFromArray:@[weibo1,weibo2, weibo3, weibo4]];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _weiboList.count;
}



- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"weibo";
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.weibo = _weiboList[indexPath.row];
    NSLog(@"第%ld个",indexPath.row);
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
