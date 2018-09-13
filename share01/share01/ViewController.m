//
//  ViewController.m
//  share01
//
//  Created by 彭宗阁 on 2018/9/10.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>
#import <UMShare/UMShare.h>
#import <UShareUI/UShareUI.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]){
//        NSLog(@"分享不可用");
//        return ;
//    }
//
//    SLComposeViewController *composeVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
//    [self presentViewController:composeVC animated:YES completion:^{
//
//    }];
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
    }];
    //创建分享消息对象
//    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//    //创建网页内容对象
//    NSString* thumbURL =  @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
//    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"欢迎使用【友盟+】社会化组件U-Share" descr:@"欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！" thumImage:thumbURL];
//    //设置网页地址
//    shareObject.webpageUrl = @"http://mobile.umeng.com/social";
//    //分享消息对象设置分享内容对象
//    messageObject.shareObject = shareObject;
//    //调用分享接口
//    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
//        if (error) {
//            UMSocialLogInfo(@"************Share fail with error %@*********",error);
//        }else{
//            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
//                UMSocialShareResponse *resp = data;
//                //分享结果消息
//                UMSocialLogInfo(@"response message is %@",resp.message);
//                //第三方原始返回的数据
//                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
//            }else{
//                UMSocialLogInfo(@"response data is %@",data);
//            }
//        }
//    }];
}

@end
