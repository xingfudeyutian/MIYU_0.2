//
//  MIYUCommentBottomViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/5/4.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUCommentBottomViewController.h"

@interface MIYUCommentBottomViewController ()
@property (nonatomic, assign) CGRect keyboardFrame;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;


@end

@implementation MIYUCommentBottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.equalTo(self.view.mas_top).offset(15);
      make.left.equalTo(self.view.mas_left).offset(15);
      make.right.equalTo(self.view.mas_right).offset(-15);
      make.height.equalTo(@34);
    }];

    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(self.bottomView.mas_left).offset(13);
      make.height.equalTo(@20);
      make.centerY.equalTo(self.bottomView.mas_centerY);
      make.right.equalTo(self.sendBtn.mas_left).offset(-10);
    }];

    [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerY.equalTo(self.bottomView.mas_centerY);
      make.right.equalTo(self.bottomView.mas_right).offset(-4);
      make.width.equalTo(@50);
      make.height.equalTo(@28);
    }];













  /**
   *  添加两个键盘回收通知
   */
  // 即将隐藏

  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
  // 键盘的Frame值即将发生变化的时候创建的额监听
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];

  /**
   *  添加两个键盘回收通知
   */
  // 即将隐藏

  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
  // 键盘的Frame值即将发生变化的时候创建的额监听
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];


}
- (IBAction)sendAction:(id)sender {
    [self.textField resignFirstResponder];
}
#pragma mark - Private Methods

- (void)keyboardWillHide:(NSNotification *)notification{

  self.keyboardFrame = CGRectZero;
  CGFloat height = self.keyboardFrame.size.height + 64;

  if (self.changedHeightBlock)
  {
    self.changedHeightBlock(height);
  }
}


/**
 *  点击了 textView 的时候，这个方法的调用是比  - (void) textViewDidBeginEditing:(UITextView *)textView 要早的。

 */
- (void)keyboardFrameWillChange:(NSNotification *)notification{

  self.keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
  CGFloat height = self.keyboardFrame.size.height + 64;

  if (self.changedHeightBlock)
  {
    self.changedHeightBlock(height);
  }
}
- (void)dealloc{

  NSLog(@"%s",__func__);
  /**
   *  移除键盘通知
   */
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];

}
-(BOOL)resignFirstResponder
{
  [self.textField resignFirstResponder];
  return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
