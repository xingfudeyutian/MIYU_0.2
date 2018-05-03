//
//  MIYUUserSettingViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/4/26.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUUserSettingViewController.h"
#import "MIYUUserView.h"



@interface MIYUUserSettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIButton *unFollow;

@property (nonatomic, strong) NSArray * items;

@end

@implementation MIYUUserSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  self.title = @"用户设置";
  MIYUUserView * userView = [MIYUUserView viewFromXIB];
  userView.autoresizingMask = UIViewAutoresizingNone;
  [self.tableView setTableHeaderView:userView];
  [self.tableView setTableFooterView:[UIView new]];

  UIButton * unFollow=[UIButton buttonWithType:UIButtonTypeCustom];
  self.unFollow = unFollow;
  unFollow.frame=CGRectMake(30,  FUll_VIEW_HEIGHT- NavigationBarHeight - 100, FUll_VIEW_WIDTH - 60, 50);
  unFollow.backgroundColor=[UIColor redColor];
  unFollow.layer.cornerRadius = 25;
  unFollow.layer.shadowOffset =  CGSizeMake(1, 1);
  unFollow.layer.shadowOpacity = 0.8;
  unFollow.layer.shadowColor =  [UIColor redColor].CGColor;
  [unFollow addTarget:self action:@selector(unFollowAction:) forControlEvents:UIControlEventTouchUpInside];
  [unFollow setTitle:@"取消关注" forState:UIControlStateNormal];
  [self.view addSubview:unFollow];



}
- (void)unFollowAction:(id)sender {



}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  if (cell == nil)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
  }
  cell.textLabel.font = [UIFont systemFontOfSize:13];

  cell.textLabel.text = self.items[indexPath.row];

  UISwitch * swi = [[UISwitch alloc] initWithFrame:CGRectMake(0, 11, 44, 15)];
  swi.on = YES;
  swi.onTintColor = COLOR_YELLOW;
  cell.accessoryView = swi;


  return cell;
}


-(NSArray *)items
{
  if (_items == nil) {
    _items = @[@"视频免费",@"屏蔽此人",@"举报"];
  }
  return _items;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
