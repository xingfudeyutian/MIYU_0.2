//
//  MIYUMyMomentViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/4/23.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUMyMomentViewController.h"
#import "MIYUBaseSwitchView.h"
#import "MIYUMyVideoViewController.h"
#import "MIYUContentDetailViewController.h"
#import "MIYUVoiceViewController.h"

@interface MIYUMyMomentViewController ()

@property (nonatomic , strong) MIYUBaseSwitchView * switchView;
@property (nonatomic, strong) UIViewController * currentVC;
@property (nonatomic, strong) NSArray * vcs;


@property (nonatomic , strong) MIYUContentDetailViewController * myImage;
@property (nonatomic , strong) MIYUContentDetailViewController * myVoice;
@property (nonatomic , strong) MIYUMyVideoViewController * myVideo;


@end

@implementation MIYUMyMomentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.controllerType == MIYUPERSONERALINFO)
    {
      self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"nav_add"] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    }

    [self.view addSubview:self.switchView];
    @Weak(self)
    self.switchView.switchBlock = ^(NSInteger tag) {
      @Strong(self)
      [self changePageTo:tag];
    };
    [self.view addSubview:self.myImage.view];
    [self addChildViewController:self.myImage];
    [self.view addSubview:self.myVoice.view];
    [self addChildViewController:self.myVoice];
    [self.view addSubview:self.myVideo.view];
    [self addChildViewController:self.myVideo];
    [self changePageTo:0];


}

- (void)changePageTo:(NSInteger)tag
{
  self.currentVC.view.hidden = YES;
  self.currentVC = self.vcs[tag];
  self.currentVC.view.hidden = NO;
}


- (void)rightAction
{

}


-(MIYUBaseSwitchView *)switchView
{
  if (_switchView == nil)
  {
    _switchView = [[MIYUBaseSwitchView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, TabbarHeight)];
    _switchView.titles = @[@"图文动态",@"语音鱼塘",@"视频鱼塘"];
    _switchView.currentPage = 0;
  }
  return _switchView;
}

-(MIYUContentDetailViewController *)myImage
{
  if (_myImage == nil) {
    _myImage = [[MIYUContentDetailViewController alloc] init];
    _myImage.view.frame = CGRectMake(0, TabbarHeight, self.view.width, self.view.height - TabbarHeight);
    _myImage.view.hidden = YES;
  }
  return _myImage;
}
-(MIYUContentDetailViewController *)myVoice
{
  if (_myVoice==nil) {
    _myVoice = [[MIYUContentDetailViewController alloc] init];
    _myVoice.view.frame = CGRectMake(0, TabbarHeight, self.view.width, self.view.height - TabbarHeight);
    _myVoice.view.hidden = YES;
  }
  return _myVoice;
}
-(MIYUMyVideoViewController *)myVideo
{
  if (_myVideo == nil)
  {
    _myVideo = [[MIYUMyVideoViewController alloc] init];
    _myVideo.view.frame = CGRectMake(0, TabbarHeight, self.view.width, self.view.height - TabbarHeight);
    _myVideo.view.hidden = YES;
  }
  return _myVideo;
}

-(NSArray *)vcs
{
  if (_vcs == nil)
  {
    _vcs = @[self.myImage,self.myVoice,self.myVideo];
  }
  return _vcs;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}



@end
