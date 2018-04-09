//
//  MIYUVoiceViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/4/8.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUVoiceViewController.h"
#import "MIYUVoiceCell.h"
#import "MIYUContentDetailViewController.h"

@interface MIYUVoiceViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MIYUVoiceViewController

- (void)viewDidLoad {
  [super viewDidLoad];

}

#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  MIYUVoiceCell * cell = [MIYUVoiceCell xibCellWithTableView:tableView];
  return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  MIYUContentDetailViewController * contentDetail = [[MIYUContentDetailViewController alloc] init];
  contentDetail.hidesBottomBarWhenPushed = YES;
  [self.navigationController pushViewController:contentDetail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
