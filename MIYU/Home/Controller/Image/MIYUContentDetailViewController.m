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
#import "MIYUAudioDetailCell.h"
#import "MIYUShareActionSheet.h"

#import "MIYUReleaseContentViewController.h"


@interface MIYUContentDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) MIYUReportViewController * reportVC;
@end

@implementation MIYUContentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  NSString * image = self.cellType == MIYUAUDIOINFO?@"microphone":@"Camera_RB";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:image] style:UIBarButtonItemStylePlain target:self action:@selector(Camera_RBShow)];



  if (self.cellType == MIYUAUDIOINFO) {
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    UILabel * titleL = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, headerView.width-20, 20)];
    titleL.font = [UIFont systemFontOfSize:14];
    titleL.text = @"标签介绍";
    NSString * info = @"录制属于你的萝莉音用你的声音去征服身边的录制属于你的萝莉音用你的声音去征服身边的录制属于你的萝莉音用你的声音去征服身边的录制属于你的萝莉音用你的声音去征服身边的录制属于你的萝莉音用你的声音去征服身边的录制属于你的萝莉音用你的声音去征服身边的录制属于你的萝莉音用你的声音去征服身边的录制属于你的萝莉音用你的声音去征服身边的录制属于你的萝莉音用你的声音去征服身边的";
    CGSize infoSize = CGSizeMake(titleL.width, MAXFLOAT);
    NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:12.f ]};
    //默认的
    CGRect infoRect =   [info boundingRectWithSize:infoSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil];

    UILabel * contentL = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, headerView.width-20, infoRect.size.height)];
    contentL.text = info;
    contentL.numberOfLines = 0;
    contentL.font = [UIFont systemFontOfSize:12.0f];
    [headerView addSubview:titleL];
    [headerView addSubview:contentL];
    headerView.height = titleL.height+contentL.height+30;
    self.tableView.tableHeaderView = headerView;

  }

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
  BaseTableViewCell * cell;

  if (self.cellType == MIYUCONTENTINFO)
  {
    cell = [MIYUContentDetailCell xibCellWithTableView:tableView];
  }else
  {
    cell = [MIYUAudioDetailCell xibCellWithTableView:tableView];
  }

//  @Weak(self)
//  cell.shareActionBlock = ^(id model) {
//    @Strong(self)
//    UIAlertController * alert = [MIYUShareActionSheet showShareActionSheetWithType:self.controllerType model:nil actionBlock:^(id paramer) {
//      [paramer dismissViewControllerAnimated:YES completion:nil];
//      UIAlertController * reportAlert = [MIYUShareActionSheet showReportActionSheetModel:nil actionBlock:^(id paramer) {
//        [paramer dismissViewControllerAnimated:YES completion:nil];
//
//        dispatch_async(dispatch_get_main_queue(), ^{
////          MIYUReportViewController * reportVC = [[MIYUReportViewController alloc] init];
////          reportVC.view.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT);
//          [[UIApplication sharedApplication].keyWindow addSubview:self.reportVC.view];
//
//        });
//
//
//      }];
//      [self presentViewController:reportAlert animated:YES completion:nil];
//    }];
//    [self presentViewController:alert animated:YES completion:nil];
//  };
  return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  MIYUContentcommentViewController * commentVC = [[MIYUContentcommentViewController alloc] init];
  commentVC.controllerType = self.controllerType;
  commentVC.cellType = self.cellType;
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
