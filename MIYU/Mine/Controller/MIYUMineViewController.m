//
//  MIYUMineViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/4.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUMineViewController.h"
#import "MIYUMineViewController+UI.h"

#import "MIYUIncomeViewController.h"
#import "MIYUVirtualmoneyViewController.h"
#import "MIYUVipViewController.h"

#import "MIYUFeedbackViewController.h"
#import "MIYUSettingViewController.h"


#import "MIYUAppDelegate.h"

@interface MIYUMineViewController ()

@end

@implementation MIYUMineViewController


-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:YES animated:YES];
  [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
 }
- (void)viewDidLoad {
  [super viewDidLoad];

  self.navigationController.interactivePopGestureRecognizer.enabled = NO;
  if (@available(iOS 11.0, *)) {
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
  }else {
    self.automaticallyAdjustsScrollViewInsets = NO;
  }
}
-(void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
  [self.navigationController setNavigationBarHidden:NO animated:YES];

}
-(void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
}

- (void)cellSelectedWithIndexPath:(NSIndexPath *)indexPath
{
    MIYUBaseViewController * vc;
    switch (indexPath.section) {
        case 0:
        {
          switch (indexPath.row) {
            case 2:
              //
              break;
            case 3:
              //我的收益
              vc = [MIYUIncomeViewController new];
              break;
            case 4:
              //我的鱼饵
              vc = [MIYUVirtualmoneyViewController new];
              break;
            case 5:
              //VIP服务
              vc = [MIYUVipViewController new];
              break;
            default:
              break;
          }

        }
            break;
        case 1:
        {
          if (indexPath.row == 0)
          {
            //意见反馈
            vc = [MIYUFeedbackViewController new];
          }else
          {
            //设置
            vc = [MIYUSettingViewController new];
          }
        }
            break;
        default:
            break;
    }
    vc.title = self.items[indexPath.section][indexPath.row][@"title"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSMutableArray *)items
{
    if (!_items)
    {
       NSArray * item = @[
                   @[
                      @{@"image":@"",
                        @"title":@"",
                        @"detail":@""},
                      @{@"image":@"",
                        @"title":@"视频收费",
                        @"detail":@"15鱼饵"},
                      @{@"image":@"",
                       @"title":@"我的动态",
                       @"detail":@""},
                      @{@"image":@"income",
                        @"title":@"我的收益",
                        @"detail":@"鱼饵：xxx"},
                      @{@"image":@"Virtualmoney",
                        @"title":@"我的鱼饵",
                        @"detail":@"鱼饵：xxx"},
                     @{@"image":@"vipicon",
                       @"title":@"VIP服务",
                       @"detail":@"VIP服务最少3天"},
                     ],
                   @[@{@"image":@"feedback",
                       @"title":@"意见反馈",
                       @"detail":@""},
                     @{@"image":@"setting",
                       @"title":@"设置",
                       @"detail":@""},]
                   ];
        _items = [NSMutableArray arrayWithArray:item];
    }
    return _items;
}
 
-(MIYUADScrollView *)adScrollView
{
  if (_adScrollView == nil)
  {
    _adScrollView = [[MIYUADScrollView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, 240)];
    _adScrollView.ads = @[@"info",@"info",@"info",@"info",@"info",@"info",@"info",@"info"];
  }
  return _adScrollView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
