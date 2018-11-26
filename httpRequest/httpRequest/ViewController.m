//
//  ViewController.m
//  httpRequest
//
//  Created by 彭宗阁 on 2018/9/23.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"
#import "MD5.h"


@interface ViewController ()<NSURLConnectionDataDelegate>

// 定义接收数据的容器
@property(nonatomic, strong) NSMutableData *allData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)login:(id)sender {
    
    
    //1.设置请求路径
    NSString *urlStr=[NSString stringWithFormat:@"http://192.168.1.53:8080/MJServer/login?username=%@&pwd=%@",_accountTF.text,_pwdTF.text];
    NSURL *url=[NSURL URLWithString:urlStr];
    
    //    2.创建请求对象
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    
//    NSURLSession send
//    [self asyncBlock];
//    [self asyncDelegate];
    [self sync];
    NSLog(@"登录吧");
}

#pragma mark 同步请求
- (void) sync
{
    // 创建nsurl对象
    NSURL *url  = [NSURL URLWithString:@"https://yxtest.sqkx.net/mobile/work/loginControl/login.action"];
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    //设置请求体

    NSString *param=[NSString stringWithFormat:@"logincode=%@&pwd=%@",_accountTF.text,[MD5 md5:_pwdTF.text]];
    //把拼接后的字符串转换为data，设置请求体
    request.HTTPBody=[param dataUsingEncoding:NSUTF8StringEncoding];
    
//    request.HTTPMethod
    NSURLResponse * response = nil;
    NSError *error = nil;
    NSData *data =  [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error == nil) {
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@", dict[@"desc"]);
        NSLog(@"str==>%@", str);
    }
    
}


#pragma mark 异步请求  代理方法
- (void)asyncDelegate
{
    // block回调
    NSURL *url = [NSURL URLWithString:@"https://yxtest.sqkx.net/mobile/work/loginControl/login.action?logincode=17090023352&pwd=123456"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}
#pragma  mark 协议方法 连接
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error=>%@", error);
}
#pragma  mark 协议方法 接收到响应
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"response==>%@", response);
    if (self.allData) {
        self.allData.length = 0;
    } else {
        self.allData = [NSMutableData new];
    }
    
}
#pragma mark 接收的数据 可能会被 调用 多次
- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"data==>%@", data);
    [self.allData appendData:data];
}
#pragma mark 加载完成之后调用
- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"加载完成了 同志");
    NSString *str = [[NSString alloc] initWithData:self.allData encoding:NSUTF8StringEncoding];
    NSLog(@"总数据是==>%@", str);
}

#pragma mark 异步请求  block
- (void)asyncBlock{
    
    // block回调
    NSURL *url = [NSURL URLWithString:@"https://yxtest.sqkx.net/mobile/work/loginControl/login.action?logincode=17090023352&pwd=123456"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError == nil) {
            NSLog(@"response=>%@", response);
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@", str);
        } else {
            NSLog(@"error=>%@", connectionError);
        }
        
        
        NSLog(@"thread=>%@", [NSThread currentThread]);
    }];
}





@end
