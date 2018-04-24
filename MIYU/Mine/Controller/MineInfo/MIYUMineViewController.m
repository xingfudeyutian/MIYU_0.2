//
//  MIYUMineViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/4.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUMineViewController.h"
#import "MIYUMineViewController+UI.h"

#import "MIYUEditMineInfoViewController.h"
#import "MIYUMyMomentViewController.h"
#import "MIYUIncomeViewController.h"
#import "MIYUVirtualmoneyViewController.h"
#import "MIYUVipViewController.h"

#import "MIYUFeedbackViewController.h"
#import "MIYUSettingViewController.h"


#import "MIYUAppDelegate.h"




@interface MIYUMineViewController ()
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@end

@implementation MIYUMineViewController

-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:YES animated:NO];
  [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
  self.navigationController.interactivePopGestureRecognizer.enabled = NO;
  if (@available(iOS 11.0, *)) {
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
  }else {
    self.automaticallyAdjustsScrollViewInsets = NO;
  }
 }
- (void)viewDidLoad {
  [super viewDidLoad];

  if(self.controllerType == MIYUPERSONERALINFO)
  {
    self.leftBtn.hidden = YES;
    [self.rightBtn setTitle: @"编辑" forState:UIControlStateNormal];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableFooterView.height = TabbarHeight;
  }
  else if (self.controllerType == MIYUOTHERINFO)
  {
    self.leftBtn.hidden = NO;
    [self.rightBtn setTitle:nil forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageOriginalWithName:@"more"] forState:UIControlStateNormal];
  }
}
-(void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
  [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (IBAction)rightAction:(id)sender {

  UIButton * button = (UIButton *)sender;
  if (button.tag == 0)
  {
    [self.navigationController popViewControllerAnimated:YES];
  }else
  {
    if(self.controllerType == MIYUPERSONERALINFO)
    {
      MIYUEditMineInfoViewController * editVC = [[MIYUEditMineInfoViewController alloc] init];
      editVC.hidesBottomBarWhenPushed = YES;
      [self.navigationController pushViewController:editVC animated:YES];
    }
    else
    {

    }

  }
}
- (void)cellSelectedWithIndexPath:(NSIndexPath *)indexPath
{
    MIYUBaseViewController * vc;
    switch (indexPath.section) {
        case 0:
        {
          switch (indexPath.row) {
            case 2:
              //我的动态
              vc = [MIYUMyMomentViewController new];
              vc.controllerType = self.controllerType;
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
       NSArray * item = self.controllerType == MIYUPERSONERALINFO?@[
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
                   ] : @[@[
                           @{@"image":@"",
                             @"title":@"",
                             @"detail":@""},
                           @{@"image":@"",
                             @"title":@"视频收费",
                             @"detail":@"15鱼饵"},
                           @{@"image":@"",
                             @"title":@"我的动态",
                             @"detail":@""}]]
      ;
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
