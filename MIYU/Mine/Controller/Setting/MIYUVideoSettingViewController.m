//
//  MIYUVideoSettingViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/13.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUVideoSettingViewController.h"

@interface MIYUVideoSettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray * items;

@end

@implementation MIYUVideoSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 }

#pragma mark - UITableViewDataSource,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return self.items.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.items[section] count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
  return 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
  UIView * view = [UIView new];
  UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, FUll_VIEW_WIDTH-40, 50)];
  label.numberOfLines = 0;
  label.text = section?@"":@"若不喜欢陌生人打扰请关闭请求功能";
  label.textColor = [UIColor lightGrayColor];
  label.font = [UIFont systemFontOfSize:10];
  [view addSubview:label];
  return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  if(!cell)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
  }
  cell.textLabel.text = self.items[indexPath.section][indexPath.row];
  cell.textLabel.font = [UIFont systemFontOfSize:13];
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

  UISwitch * switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
  switchBtn.onTintColor = COLOR_YELLOW;
  cell.accessoryView = indexPath.section?nil:switchBtn;
  cell.accessoryType = indexPath.section?UITableViewCellAccessoryDisclosureIndicator:UITableViewCellAccessoryNone;
  cell.detailTextLabel.text = indexPath.section?@"免费":nil;
  cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
  return cell;


}

-(NSArray *)items
{
  if (_items == nil)
  {
    _items = @[
               @[@"允许陌生人发送视频请求",@"允许陌生人发送语音请求"],
               @[@"视频收费"]
               ];
  }
  return _items;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
