//
//  MIYUContentcommentViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/5/2.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUContentcommentViewController.h"
#import "MIYUContentDetailCell.h"
#import "MIYUCommentCell.h"
#import "MIYUReportViewController.h"

#import "MIYUShareActionSheet.h"
#import "MIYUCommentBottomViewController.h"

@interface MIYUContentcommentViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) MIYUCommentBottomViewController * bottomVC;
@property (nonatomic, strong) MIYUReportViewController * reportVC;
@end

@implementation MIYUContentcommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"more"] style:UIBarButtonItemStylePlain target:self action:@selector(moreAction:)];

}
-(void)setupSubViews
{
  self.view.backgroundColor = [UIColor whiteColor];

  [self.view addSubview:self.bottomVC.view];
  [self addChildViewController:self.bottomVC];



  [self.bottomVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
    make.bottom.equalTo(self.view.mas_bottom);
    make.left.right.equalTo(self.view);
    make.height.equalTo(@64);
  }];




  [self.view addSubview:self.tableView];

  @Weak(self)
  self.bottomVC.changedHeightBlock = ^(CGFloat height) {
    @Strong(self)

    [UIView animateWithDuration:0.2 delay:0.05 options:UIViewAnimationOptionTransitionNone animations:^{
      self.tableView.height = FUll_VIEW_HEIGHT - NavigationBarHeight - height;
      [self.bottomVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom).offset(height-64);
      }];
    } completion:nil];
  };

}

-(MIYUCommentBottomViewController *)bottomVC
{
  if (_bottomVC == nil) {
    _bottomVC = [[MIYUCommentBottomViewController alloc] init];
//    _bottomVC.view.frame = CGRectMake(0, FUll_VIEW_HEIGHT - NavigationBarHeight, FUll_VIEW_WIDTH, 64);
  }
  return _bottomVC;
}
-(UITableView *)tableView
{
  if (_tableView == nil)
  {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - 2* NavigationBarHeight)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
  }
  return _tableView;
}
-(void)moreAction:(id)sender
{
  UIAlertController * alert = [MIYUShareActionSheet showShareActionSheetWithType:self.controllerType model:nil actionBlock:^(id paramer) {
    [paramer dismissViewControllerAnimated:YES completion:nil];
    UIAlertController * reportAlert = [MIYUShareActionSheet showReportActionSheetModel:nil actionBlock:^(id paramer) {
      [paramer dismissViewControllerAnimated:YES completion:nil];

      dispatch_async(dispatch_get_main_queue(), ^{
        //          MIYUReportViewController * reportVC = [[MIYUReportViewController alloc] init];
        //          reportVC.view.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:self.reportVC.view];

      });


    }];
    [self presentViewController:reportAlert animated:YES completion:nil];
  }];
 [self presentViewController:alert animated:YES completion:nil];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return section == 0?1:5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return section == 0 ? CGFLOAT_MIN : 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  if (section == 0)
  {
    return nil;
  }

  UIView * sectionHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, 30)];
  UILabel * sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, FUll_VIEW_WIDTH-30, 30)];
  sectionLabel.text = @"评论10条";
  sectionLabel.font = [UIFont systemFontOfSize:13];
  [sectionHeader addSubview:sectionLabel];
  return sectionHeader;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  BaseTableViewCell * cell ;
  if (indexPath.section == 0)
  {
    cell = [MIYUContentDetailCell xibCellWithTableView:tableView];
  }else
  {
    cell = [MIYUCommentCell xibCellWithTableView:tableView];
  }
  return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  [self.bottomVC resignFirstResponder];
}

-(MIYUReportViewController *)reportVC
{
  if (_reportVC == nil)
  {
    _reportVC = [[MIYUReportViewController alloc] init];
    _reportVC.view.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT);
  }
  return _reportVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
