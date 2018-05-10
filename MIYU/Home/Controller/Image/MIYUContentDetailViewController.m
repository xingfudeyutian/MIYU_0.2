//
//  MIYUContentDetailViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/22.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUContentDetailViewController.h"
#import "MIYUReportViewController.h"
#import "MIYUContentcommentViewController.h"
#import "MIYUContentDetailCell.h"
#import "MIYUShareActionSheet.h"

#import "MIYUReleaseContentViewController.h"


@interface MIYUContentDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) MIYUReportViewController * reportVC;
@end

@implementation MIYUContentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"Camera_RB"] style:UIBarButtonItemStylePlain target:self action:@selector(Camera_RBShow)];
}

- (void)Camera_RBShow
{
  MIYUReleaseContentViewController * releaseVC = [[MIYUReleaseContentViewController alloc] init];
  [self.navigationController pushViewController:releaseVC animated:YES];
}
#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
  return CGFLOAT_MIN;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
  return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return UITableViewAutomaticDimension;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  MIYUContentDetailCell * cell = [MIYUContentDetailCell xibCellWithTableView:tableView];
  @Weak(self)
  cell.shareActionBlock = ^(id model) {
    @Strong(self)
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
  };
  return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  MIYUContentcommentViewController * commentVC = [[MIYUContentcommentViewController alloc] init];
  commentVC.controllerType = self.controllerType;
  [self.navigationController pushViewController:commentVC animated:YES];
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
