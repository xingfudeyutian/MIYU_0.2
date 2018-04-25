//
//  MIYUContentDetailViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/22.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUContentDetailViewController.h"
#import "MIYUContentDetailCell.h"
#import "MIYUShareActionSheet.h"

@interface MIYUContentDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MIYUContentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"Camera_RB"] style:UIBarButtonItemStylePlain target:self action:@selector(Camera_RBShow)];
}

- (void)Camera_RBShow
{

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

      }];
      [self presentViewController:reportAlert animated:YES completion:nil];
    }];
    [self presentViewController:alert animated:YES completion:nil];
  };
  return cell;
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
