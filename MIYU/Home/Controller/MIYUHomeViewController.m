//
//  MIYUHomeViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/4.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUHomeViewController.h"
#import "MIYUBaseSwitchView.h"

#import "MIYUContentViewController.h"
#import "MIYUVoiceViewController.h"
#import "MIYUVideoViewController.h"

@interface MIYUHomeViewController ()

@property (nonatomic, strong) MIYUBaseSwitchView * switchView;
@property (nonatomic, strong) UIViewController * currentVC;
@property (nonatomic, strong) NSArray * titles;
@property (nonatomic, strong) NSArray * vcs;

@property (nonatomic, strong) MIYUContentViewController * imageVC;//图文动态
@property (nonatomic, strong) MIYUVoiceViewController * voiceVC;//语音鱼塘
@property (nonatomic, strong) MIYUVideoViewController * videoVC;//视频鱼塘

@end

@implementation MIYUHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.edgesForExtendedLayout = UIRectEdgeNone;
    @Weak(self)
    self.switchView.switchBlock = ^(NSInteger tag) {
        @Strong(self)
      [self changePageTo:tag];
    };

   [self.view addSubview:self.switchView];
  [self.view addSubview:self.imageVC.view];
  [self.view addSubview:self.voiceVC.view];
  [self.view addSubview:self.videoVC.view];

  [self addChildViewController:self.imageVC];
  [self addChildViewController:self.voiceVC];
  [self addChildViewController:self.videoVC];
  [self changePageTo:0];



}

- (void)changePageTo:(NSInteger)tag
{
  self.currentVC.view.hidden = YES;
  self.currentVC = self.vcs[tag];
  self.currentVC.view.hidden = NO;

  self.navigationItem.leftBarButtonItem = tag == 2?nil:[[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchShow)];
  self.navigationItem.rightBarButtonItem = tag == 1?nil:[[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"Camera_RB"] style:UIBarButtonItemStylePlain target:self action:@selector(Camera_RBShow)];
}

- (void)searchShow
{


}

- (void)Camera_RBShow
{


}

#pragma mark - Lazy loading

-(NSArray *)titles
{
    if (_titles==nil)
    {
        _titles = @[@"图文动态",@"语音鱼塘",@"视频鱼塘"];
    }
    return _titles;
}

-(NSArray *)vcs
{
  if (_vcs == nil) {
    _vcs = @[self.imageVC,self.voiceVC,self.videoVC];
  }
  return _vcs;
}

-(MIYUBaseSwitchView *)switchView
{
    if (_switchView == nil)
    {
        _switchView = [[MIYUBaseSwitchView alloc] init];
        _switchView.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH, TabbarHeight);
        _switchView.titles = self.titles;
        _switchView.backgroundColor = [UIColor whiteColor];

    }
    return _switchView;
}
-(MIYUContentViewController *)imageVC
{
  if (_imageVC == nil)
  {
    _imageVC = [[MIYUContentViewController alloc] init];
    _imageVC.controllerType = MIYUOTHERINFO;
    _imageVC.view.frame = CGRectMake(0, TabbarHeight, self.view.width, self.view.height - TabbarHeight);
    _imageVC.view.hidden = YES;
  }
  return _imageVC;
}
-(MIYUVoiceViewController *)voiceVC
{
  if (_voiceVC == nil) {
    _voiceVC = [[MIYUVoiceViewController alloc] init];
    _voiceVC.controllerType = MIYUOTHERINFO;
    _voiceVC.view.frame = CGRectMake(0, TabbarHeight, self.view.width, self.view.height - TabbarHeight);
    _voiceVC.view.hidden = YES;
  }
  return _voiceVC;
}

-(MIYUVideoViewController *)videoVC
{
  if (_videoVC == nil) {
    _videoVC = [[MIYUVideoViewController alloc] init];
    _videoVC.controllerType = MIYUOTHERINFO;
    _videoVC.view.frame = CGRectMake(0, TabbarHeight, self.view.width, self.view.height - TabbarHeight);
    _videoVC.view.hidden = YES;
  }
  return _videoVC;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
@end
