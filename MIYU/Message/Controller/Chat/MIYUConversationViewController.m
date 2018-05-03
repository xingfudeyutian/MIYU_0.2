//
//  MIYUConversationViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/15.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUConversationViewController.h"

#import "MIYUUserSettingViewController.h"

#import "MIYUChatBoxViewController.h"
#import "MIYUVideoCall.h"

@interface MIYUConversationViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong)MIYUChatBoxViewController * chatBoxVC;
@property (nonatomic, strong) MIYUVideoCall * videoCall;

@end

@implementation MIYUConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.chatSessionInputBarControl setHidden:YES];
    [self.view  addSubview:self.chatBoxVC.view];
    [self.view addSubview:self.videoCall];
    [self addChildViewController:self.chatBoxVC];
    [self.conversationMessageCollectionView scrollToBottomAnimated:YES];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:IMAGE_Original(@"friendship") style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAction)];
}

-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  CGRect frame =  self.conversationMessageCollectionView.frame;
  self.conversationMessageCollectionView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, FUll_VIEW_HEIGHT - NavigationBarHeight - HEIGHT_CHATBOXVIEW_TOOL);
}
-(void)rightBarButtonAction
{
  MIYUUserSettingViewController * userSetting = [[MIYUUserSettingViewController alloc] init];
  [self.navigationController pushViewController:userSetting animated:YES];
}

- (void)tap4ResetDefaultBottomBarStatus:(UIGestureRecognizer *)gestureRecognizer
{
  [self.chatBoxVC resignFirstResponder];
}


-(MIYUChatBoxViewController *) chatBoxVC
{
  if (_chatBoxVC == nil) {
    _chatBoxVC = [[MIYUChatBoxViewController alloc] init];
    [_chatBoxVC.view setFrame:CGRectMake(0, FUll_VIEW_HEIGHT - HEIGHT_CHATBOXVIEW_TOOL, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT)];
//    @Weak(self)
    _chatBoxVC.sendMessageBlock = ^(MIYUChatBoxViewController *chatBoxViewController, RCMessageModel *messageModel) {
//        @Strong(self)
    };
    _chatBoxVC.photoOrVideoShowBlock = ^(MIYUChatBoxStatus status) {
//        @Strong(self)

    };
    @Weak(self)
    _chatBoxVC.changeChatBoxHeightBlock = ^(MIYUChatBoxViewController *chatBoxViewController, CGFloat height) {
//        @Strong(self)
      /**
       *   改变BoxController .view 的高度 ，这采取的是重新设置 Frame 值！！
       */

      [UIView animateWithDuration:0.3 animations:^{
        @Strong(self)
        self.conversationMessageCollectionView.height = FUll_VIEW_HEIGHT - height - NavigationBarHeight;
        self.chatBoxVC.view.y = self.conversationMessageCollectionView.y + self.conversationMessageCollectionView.height;
        self.videoCall.y = self.chatBoxVC.view.y - 60;
        if (self.conversationMessageCollectionView.contentSize.height > self.conversationMessageCollectionView.height)
        {
          [self.conversationMessageCollectionView scrollToBottomAnimated:YES];
        }
      }];
    };
  }
  return _chatBoxVC;
}

- (MIYUVideoCall *)videoCall
{
  if (_videoCall == nil) {
    _videoCall = [MIYUVideoCall viewFromXIB];
    _videoCall.frame = CGRectMake(FUll_VIEW_WIDTH-105, self.chatBoxVC.view.y - 60, 105, 42);
    @Weak(self)
    _videoCall.VideoCallBlock = ^(id paramer) {
      @Strong(self)
      UIAlertController * alert = [[UIAlertController alloc] init];
      UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"语音通话" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

      }];
      UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"视频通话" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

      }];
      UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

      }];
      [alert addAction:action1];
      [alert addAction:action2];
      [alert addAction:cancel];
      [self presentViewController:alert animated:YES completion:nil];
    };
  }
  return _videoCall;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
