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
#import "MIYUShareActionSheet.h"

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
  @Weak(self)
  cell.moreActionBlock = ^(id model) {
    @Strong(self)
    UIAlertController * alert = [MIYUShareActionSheet showMoreActionSheetModel:nil actionBlock:^(id paramer) {

    }];
    [self presentViewController:alert animated:YES completion:nil];
  };
  return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  MIYUContentDetailViewController * contentDetail = [[MIYUContentDetailViewController alloc] init];
  contentDetail.controllerType = self.controllerType;
  contentDetail.cellType = MIYUAUDIOINFO;
  contentDetail.hidesBottomBarWhenPushed = YES;
  [self.navigationController pushViewController:contentDetail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
