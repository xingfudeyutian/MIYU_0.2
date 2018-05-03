//
//  MIYUContentcommentViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/5/2.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUContentcommentViewController.h"
#import "MIYUContentDetailCell.h"
#import "MIYUCommentCell.h"
#import "MIYUReportViewController.h"

#import "MIYUShareActionSheet.h"

@interface MIYUContentcommentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, assign) CGRect keyboardFrame;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (nonatomic, strong) MIYUReportViewController * reportVC;
@end

@implementation MIYUContentcommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"more"] style:UIBarButtonItemStylePlain target:self action:@selector(moreAction:)];
  /**
   *  添加两个键盘回收通知
   */
  // 即将隐藏

  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
  // 键盘的Frame值即将发生变化的时候创建的额监听
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];


}
-(void)setupSubViews
{
  [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.view.mas_left);
    make.top.equalTo(self.view.mas_top);
    make.right.equalTo(self.view.mas_right);
    make.height.equalTo(self.bottomView.mas_top);
  }];
  [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.equalTo(self.tableView);
    make.bottom.equalTo(self.view.mas_bottom);
    make.height.equalTo(@64);
  }];

  
}

-(void)moreAction:(id)sender
{
  UIAlertController * alert = [MIYUShareActionSheet showShareActionSheetWithType:self.controllerType model:nil actionBlock:^(id paramer) {
    [paramer dismissViewControllerAnimated:YES completion:nil];
    UIAlertController * reportAlert = [MIYUShareActionSheet showReportActionSheetModel:nil actionBlock:^(id paramer) {
      [paramer dismissViewControllerAnimated:YES completion:nil];

      dispatch_async(dispatch_get_main_queue(), ^{
        //          MIYUReportViewController * reportVC = [[MIYUReportViewController alloc] init];
        //          reportVC.view.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:self.reportVC.view];

      });


    }];
    [self presentViewController:reportAlert animated:YES completion:nil];
  }];
 [self presentViewController:alert animated:YES completion:nil];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return section == 0?1:5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return section == 0 ? CGFLOAT_MIN : 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  if (section == 0)
  {
    return nil;
  }

  UIView * sectionHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, 30)];
  UILabel * sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, FUll_VIEW_WIDTH-30, 30)];
  sectionLabel.text = @"评论10条";
  sectionLabel.font = [UIFont systemFontOfSize:13];
  [sectionHeader addSubview:sectionLabel];
  return sectionHeader;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  BaseTableViewCell * cell ;
  if (indexPath.section == 0)
  {
    cell = [MIYUContentDetailCell xibCellWithTableView:tableView];
  }else
  {
    cell = [MIYUCommentCell xibCellWithTableView:tableView];
  }
  return cell;
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

#pragma mark - Private Methods

- (void)keyboardWillHide:(NSNotification *)notification{

  self.keyboardFrame = CGRectZero;

}


/**
 *  点击了 textView 的时候，这个方法的调用是比  - (void) textViewDidBeginEditing:(UITextView *)textView 要早的。

 */
- (void)keyboardFrameWillChange:(NSNotification *)notification{

  [UIView animateWithDuration:0.3 animations:^{
    self.tableView.height =FUll_VIEW_HEIGHT - NavigationBarHeight -(self.keyboardFrame.size.height + self.bottomView.height);
    self.bottomView.y = self.tableView.y + self.tableView.height;
  }];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  [self resignFirstResponder];
}

- (void)dealloc{

  /**
   *  移除键盘通知
   */
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
