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
      return;
    }
      break;
    case 1:
    {
      return;
    }
      break;
    case 2:
    {
      vc = [[MIYUPhoneLoginViewController alloc] init];
    }
      break;
    default:
      break;
  }
  MIYUNavigationViewController * nav = [[MIYUNavigationViewController alloc] initWithRootViewController:vc];
  [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
