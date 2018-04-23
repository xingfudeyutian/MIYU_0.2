//
//  MIYUMyVideoViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/4/23.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUMyVideoViewController.h"
#import "MIYUMyVideoCell.h"

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
  BaseTableViewCell * cell = [MIYUMyVideoCell xibCellWithTableView:tableView];
  return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
