//
//  MIYUContentViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/14.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUContentViewController.h"
#import "MIYUContentDetailViewController.h"
#import "MIYUContentCell.h"
#import "MIYUADScrollView.h"

@interface MIYUContentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ,strong) MIYUADScrollView * adScrollView;

@end

@implementation MIYUContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  self.tableView.tableHeaderView = self.adScrollView;
  self.tableView.tableHeaderView.height = 150;
  self.adScrollView.ads = [NSArray arrayWithObjects:@"",@"",@"",@"", nil];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MIYUContentCell * cell = [MIYUContentCell xibCellWithTableView:tableView];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  MIYUContentDetailViewController * contentDetail = [[MIYUContentDetailViewController alloc] init];
  contentDetail.hidesBottomBarWhenPushed = YES;
  [self.navigationController pushViewController:contentDetail animated:YES];
}

- (MIYUADScrollView *)adScrollView
{
  if (_adScrollView == nil)
  {
    _adScrollView = [[MIYUADScrollView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, 150)];

  }
  return _adScrollView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
