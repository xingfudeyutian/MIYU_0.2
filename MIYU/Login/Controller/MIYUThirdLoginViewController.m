//
//  MIYUThirdLoginViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/5/14.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUThirdLoginViewController.h"
#import "MIYUPhoneLoginViewController.h"
#import "MIYUNavigationViewController.h"
#import "MIYUWeChat.h"

@interface MIYUThirdLoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *weChatLogin;
@property (weak, nonatomic) IBOutlet UIButton *qqLogin;
@property (weak, nonatomic) IBOutlet UIButton *phoneLogin;


@end

@implementation MIYUThirdLoginViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.navigationController.navigationBar setHidden:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  [self.navigationController.navigationBar setHidden:NO];
}
- (IBAction)thirdLoginAction:(id)sender {
  UIButton * btn = (UIButton *)sender;
  MIYUBaseViewController * vc;
  switch (btn.tag) {
    case 0:
    {

      if ([[MIYUWeChat sharedInstance] isWXAppInstalled])
      {
          [[MIYUWeChat sharedInstance] sendAuthRequest];
      }
      else
      {
        //如果未安装指导用户下载微信
        NSURL * URL = [NSURL URLWithString:[WXApi getWXAppInstallUrl]];
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
          [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:^(BOOL success) {

          }];
        }else
        {
          BOOL success = [[UIApplication sharedApplication] openURL:URL];
        }
      }
    }
      break;
    case 1:
    {//qq登录
      return;
    }
      break;
    case 2:
    {
      vc = [[MIYUPhoneLoginViewController alloc] init];
      MIYUNavigationViewController * nav = [[MIYUNavigationViewController alloc] initWithRootViewController:vc];
      [self presentViewController:nav animated:YES completion:nil];
    }
      break;
    default:
      break;
  }

}



- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}
@end
