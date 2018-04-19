//
//  MIYUSquareViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/4.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUSquareViewController.h"
#import "MIYUBaseSwitchView.h"
#import "MIYUBaseSquareCollectionController.h"
#import "MIYUFilterViewController.h"

@interface MIYUSquareViewController ()

@property (nonatomic, strong) UISearchBar * searchBar;

@property (nonatomic, strong) MIYUBaseSwitchView * switchView;
@property (nonatomic, strong) NSArray * titles;

@property (nonatomic, strong) MIYUBaseSquareCollectionController * squareVC;
@property (nonatomic, strong) MIYUFilterViewController * filterVC;
@property (nonatomic) BOOL currentFilterState;

@end

@implementation MIYUSquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  self.edgesForExtendedLayout = UIRectEdgeNone;
//  UIView * titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH-60, 44)];
//  titleView.backgroundColor = [UIColor whiteColor];
//  self.searchBar = [[UISearchBar alloc] initWithFrame:titleView.frame];
//  self.searchBar.searchBarStyle = UISearchBarStyleDefault;
//  self.searchBar.placeholder = @"搜索挑战标签关键词";
//
//
//  UITextField *textField = [self.searchBar valueForKey:@"searchBarTextField"];
//  if (textField)
//  {
//    textField.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
//    textField.font = [UIFont systemFontOfSize:12];
//  }
//  [titleView addSubview:self.searchBar];
//
//  self.navigationItem.titleView = titleView;
   self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"filter"] style:UIBarButtonItemStylePlain target:self action:@selector(filterShow)];
   self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(CameraShow)];


  @Weak(self)
  self.switchView.switchBlock = ^(NSInteger tag) {
    @Strong(self)

  };
  self.navigationItem.titleView = self.switchView;

  [self.view addSubview:self.squareVC.view];
  [self addChildViewController:self.squareVC];

//  [self.view addSubview:self.filterVC.view];
//  [self addChildViewController:self.filterVC];

}

-(void)filterShow
{
  self.currentFilterState = !self.currentFilterState;
  self.currentFilterState ? [self addFilter]:[self removeFilter];
}
-(void)CameraShow
{

}

- (void)addFilter
{
  [[UIApplication sharedApplication].keyWindow addSubview:self.filterVC.view];


}
- (void)removeFilter
{
  [self.filterVC.view removeFromSuperview];
}

#pragma mark - Lazy loading

-(NSArray *)titles
{
  if (_titles==nil)
  {
    _titles = @[@"推荐",@"附近"];
  }
  return _titles;
}

-(MIYUBaseSquareCollectionController *)squareVC
{
  if (_squareVC == nil) {
    _squareVC = [[MIYUBaseSquareCollectionController alloc] init];
    _squareVC.view.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    _squareVC.cellType = MIYUCELLTYPE_SQUARE;
  }
  return _squareVC;
}

-(MIYUBaseSwitchView *)switchView
{
  if (_switchView == nil)
  {
    _switchView = [[MIYUBaseSwitchView alloc] init];
    _switchView.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH-130, TabbarHeight);
    _switchView.titles = self.titles;
  }
  return _switchView;
}

-(MIYUFilterViewController *)filterVC
{
  if (_filterVC ==nil) {
    _filterVC = [[MIYUFilterViewController alloc] init];
    _filterVC.view.frame = CGRectMake(0, NavigationBarHeight, self.view.width, FUll_VIEW_HEIGHT - NavigationBarHeight);
  }
 return _filterVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}



@end
