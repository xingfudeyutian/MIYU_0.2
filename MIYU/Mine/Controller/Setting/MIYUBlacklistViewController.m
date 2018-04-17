//
//  MIYUBlacklistViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/4/17.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBlacklistViewController.h"
#import "MIYUBlacklistCell.h"

@interface MIYUBlacklistViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MIYUBlacklistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.title = @"屏蔽的人";
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  MIYUBlacklistCell * cell = [MIYUBlacklistCell xibCellWithTableView:tableView];
  return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
