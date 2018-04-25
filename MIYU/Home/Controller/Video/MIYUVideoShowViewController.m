//
//  MIYUVideoShowViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/23.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUVideoShowViewController.h"
#import "MIYUViewToolViewController.h"
#import "MIYUBarrageViewController.h"

#import "MIYUShareActionSheet.h"



#define VideoToolHeight 60

@interface MIYUVideoShowViewController ()<ZFPlayerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, assign) CGRect keyboardFrame;
/** 视频URL */
@property (nonatomic, strong) NSURL *videoURL;
@property (weak, nonatomic) IBOutlet UIButton *barrageBtn;
@property (nonatomic) BOOL   currentBarrageState;
@property (weak, nonatomic) IBOutlet UIView *playerFatherView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIView *playerControlView;
@property (weak, nonatomic) IBOutlet UIView *toolView;
@property (weak, nonatomic) IBOutlet UITextField *messageTF;

@property (strong, nonatomic) ZFPlayerView *playerView;
/** 离开页面时候是否在播放 */
@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, strong) ZFPlayerModel *playerModel;
@property (nonatomic, strong) UIView *bottomView;


@property (nonatomic, strong) MIYUBarrageViewController * barrageController;

@end

@implementation MIYUVideoShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.videoURL = [NSURL URLWithString:@"http://120.25.226.186:32812/resources/videos/minion_03.mp4"];
  // 自动播放，默认不自动播放
  [self.playerView autoPlayTheVideo];
  /**
   *  添加两个键盘回收通知
   */
  // 即将隐藏
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
  // 键盘的Frame值即将发生变化的时候创建的额监听
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [self.navigationController.navigationBar setHidden:YES];
  // pop回来时候是否自动播放
  if (self.navigationController.viewControllers.count == 2 && self.playerView && self.isPlaying) {
    self.isPlaying = NO;
    self.playerView.playerPushedOrPresented = NO;
  }
}
-(void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  [self.navigationController.navigationBar setHidden:NO];
  // push出下一级页面时候暂停
  if (self.navigationController.viewControllers.count == 3 && self.playerView && !self.playerView.isPauseByUser)
  {
    self.isPlaying = YES;
    //        [self.playerView pause];
    self.playerView.playerPushedOrPresented = YES;
  }
}
#pragma mark - ZFPlayerDelegate

- (void)zf_playerBackAction {
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)zf_playerDownload:(NSString *)url {
  // 此处是截取的下载地址，可以自己根据服务器的视频名称来赋值
  NSString *name = [url lastPathComponent];

  [[ZFDownloadManager sharedDownloadManager] downFileUrl:url filename:name fileimage:nil];
  // 设置最多同时下载个数（默认是3）
  [ZFDownloadManager sharedDownloadManager].maxCount = 4;
}

- (void)zf_playerControlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen {
  //    self.backBtn.hidden = YES;
  [UIView animateWithDuration:0.25 animations:^{
    self.backBtn.alpha = 0;
  }];
}

- (void)zf_playerControlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen {
  //    self.backBtn.hidden = fullscreen;
  [UIView animateWithDuration:0.25 animations:^{
    self.backBtn.alpha = !fullscreen;
  }];
}

#pragma mark - Getter

- (ZFPlayerModel *)playerModel {
  if (!_playerModel) {
    _playerModel                  = [[ZFPlayerModel alloc] init];
    _playerModel.title            = @"这里设置视频标题";
    _playerModel.videoURL         = self.videoURL;
    _playerModel.placeholderImage = [UIImage imageNamed:@"loading_bgView1"];
    _playerModel.fatherView       = self.playerFatherView;
  }
  return _playerModel;
}

- (ZFPlayerView *)playerView {
  if (!_playerView) {
    _playerView = [[ZFPlayerView alloc] init];

    [self.playerControlView addSubview:self.barrageController.view];
//    [self addChildViewController:self.barrageController];
    [_playerView playerControlView:self.playerControlView playerModel:self.playerModel];

    // 设置代理
    _playerView.delegate = self;

    //（可选设置）可以设置视频的填充模式，内部设置默认（ZFPlayerLayerGravityResizeAspect：等比例填充，直到一个维度到达区域边界）
     _playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspectFill;

    // 打开下载功能（默认没有这个功能）
    _playerView.hasDownload    = YES;

    // 打开预览图
    _playerView.hasPreviewView = YES;

    //        _playerView.forcePortrait = YES;
    /// 默认全屏播放
    //        _playerView.fullScreenPlay = YES;

  }
  return _playerView;
}

-(MIYUBarrageViewController *)barrageController
{
  if (_barrageController == nil)
  {
    _barrageController = [[MIYUBarrageViewController alloc] init];
    [_barrageController.view setFrame:CGRectMake(0, FUll_VIEW_HEIGHT/4, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT/2)];
    [_barrageController startBarrage];
    self.currentBarrageState = YES;
  }
  return _barrageController;
}


- (IBAction)navigationClick:(UIButton *)sender {
  UIButton * btn = (UIButton *)sender;
  switch (btn.tag)
  {
    case 0:
    {
//      [self.navigationController popViewControllerAnimated:YES];
      //返回
      [self dismissViewControllerAnimated:YES completion:nil];
    }
      break;
    case 1:
    {
      //弹幕开关
      self.currentBarrageState  = !self.currentBarrageState;
      NSString * imageName = self.currentBarrageState ? @"barrage_on":@"barrage_off";
      [self.barrageBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
      self.currentBarrageState ? [self.barrageController startBarrage] : [self.barrageController stopBarrage];
    }
      break;
    case 2:
    {
      //更多
      UIAlertController * alert = [MIYUShareActionSheet showShareActionSheetWithType:self.controllerType model:nil actionBlock:^(id paramer) {
        [paramer dismissViewControllerAnimated:YES completion:nil];
        UIAlertController * reportAlert = [MIYUShareActionSheet showReportActionSheetModel:nil actionBlock:^(id paramer) {

        }];
        [self presentViewController:reportAlert animated:YES completion:nil];
      }];
      [self presentViewController:alert animated:YES completion:nil];
    }
      break;
    default:
      break;
  }
}
// 返回值要必须为NO
- (BOOL)shouldAutorotate {
  return NO;
}

- (IBAction)controlViewTapGesture:(UITapGestureRecognizer *)sender {
    [self.messageTF resignFirstResponder];
}
#pragma mark - Private Methods

- (void)keyboardWillHide:(NSNotification *)notification{

  self.keyboardFrame = CGRectZero;
  [UIView animateWithDuration:0.3 animations:^{
    self.toolView.bottom = self.playerControlView.bottom;
  }];


}

/**
 *  点击了 textView 的时候，这个方法的调用是比  - (void) textViewDidBeginEditing:(UITextView *)textView 要早的。

 */
- (void)keyboardFrameWillChange:(NSNotification *)notification{

  self.keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
  if (self.keyboardFrame.size.height>VideoToolHeight) {
    [UIView animateWithDuration:0.3 animations:^{

       self.toolView.bottom = self.playerControlView.bottom - self.keyboardFrame.size.height ;
    }];

  }
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
