//
//  MIYUMyVideoViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/4/23.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUMyVideoViewController.h"
#import "MIYUMyVideoCell.h"
#import "MIYUVideoShowViewController.h"
#import "MIYUShareActionSheet.h"

@interface MIYUMyVideoViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MIYUMyVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  MIYUMyVideoCell * cell = [MIYUMyVideoCell xibCellWithTableView:tableView];
  @Weak(self)
  cell.moreActionBlock = ^(id model) {
    @Strong(self)
    UIAlertController * alert = [MIYUShareActionSheet showShareActionSheetWithType:self.controllerType model:nil actionBlock:^(id paramer) {

    }];
    [self presentViewController:alert animated:YES completion:nil];
  };
  return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  MIYUVideoShowViewController * showVC = [[MIYUVideoShowViewController alloc] init];
  showVC.controllerType = self.controllerType;

//  [self.navigationController pushViewController:showVC animated:YES];

  [self presentViewController:showVC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
