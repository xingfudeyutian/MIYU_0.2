//
//  MIYUFeedbackViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/30.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUFeedbackViewController.h"
#import "MIYUFeedBackTextViewCell.h"
#import "MIYUFeedBackImageCell.h"
#import "MIYUFeedBackLabelCell.h"

@interface MIYUFeedbackViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MIYUFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return section?1:2;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return 48;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
  return CGFLOAT_MIN;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  UIView * headerView = [[UIView alloc] init];
  UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, FUll_VIEW_WIDTH-16, 48)];
  label.text = section?@"手机号":@"问题描述";
  label.textColor = [UIColor colorWithHexString:@"#999999"];
  label.font = [UIFont systemFontOfSize:13];
  [headerView addSubview:label];
  return headerView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
  return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.section == 0) {
    return indexPath.row == 0?170:110;
  }else
  {
    return 54;
  }
  return CGFLOAT_MIN;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  BaseTableViewCell * cell;
  if (indexPath.section == 0)
  {
    if (indexPath.row == 0) {
      cell = [MIYUFeedBackTextViewCell xibCellWithTableView:tableView];
    }else
    {
      cell = [MIYUFeedBackImageCell xibCellWithTableView:tableView];
    }
  }else
  {
    cell = [MIYUFeedBackLabelCell xibCellWithTableView:tableView];
  }
   return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
