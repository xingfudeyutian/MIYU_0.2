//
//  MIYUVideoViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/4/8.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUVideoViewController.h"
#import "CCAnimationContainerView.h"
#import "CardView.h"
@interface MIYUVideoViewController ()
@property(nonatomic, strong) CCAnimationContainerView *cardContainerView;
@property(nonatomic, strong) NSMutableArray *items;
@property(nonatomic)float leftWidth;
@end

@implementation MIYUVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createCardViewWithDataSource:self.items];
}
//创建容器
- (void)createCardViewWithDataSource:(NSArray *)array {
  self.leftWidth = 10.0;

  CCAnimationContainerView * containerView = [[CCAnimationContainerView alloc] initWithFrame:CGRectMake(10, 10,FUll_VIEW_WIDTH - 20, self.view.height-20-TabbarHeight)];
  self.cardContainerView = containerView;
  self.cardContainerView.totalCount = array.count;
  self.cardContainerView.dataSourceArray = array;

  self.cardContainerView.cardRefreshBlock = ^(){

  };
  self.cardContainerView.cardPushBlock = ^(){

  };
  [self.view addSubview:self.cardContainerView];
  [self setAnimationSubviews];
}

//设置容器子视图
-(void)setAnimationSubviews{
  self.cardContainerView.subViewArray = [NSMutableArray array];
  NSInteger cardCount = (self.items.count >= 4)?4:self.items.count;
  for(int i = 0;i < cardCount;i++){
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"CardView" owner:nil options:nil];
    CardView *cardView = [nibView lastObject];
    cardView.frame = CGRectMake(0, 0, CGRectGetWidth(self.cardContainerView.frame), CGRectGetHeight(self.cardContainerView.frame));
    [cardView setupDataSource:self.dataArray[i] andPage:i];
//    UIView * cardView = [[UIView alloc] init];
//    cardView.backgroundColor = [UIColor lightGrayColor];

    cardView.tag = 100 + i;
    if(i == 1){
      cardView.frame = CGRectMake(10, 10, CGRectGetWidth(self.cardContainerView.frame), CGRectGetHeight(self.cardContainerView.frame));
    }
    if(i >= 2){
      cardView.frame = CGRectMake(10, 10, CGRectGetWidth(self.cardContainerView.frame), CGRectGetHeight(self.cardContainerView.frame));
    }
    [self.cardContainerView.subViewArray addObject:cardView];
    [self.cardContainerView addSubview:cardView];
    [self.cardContainerView sendSubviewToBack:cardView];

  }
  [self.cardContainerView addPanGesture];
}

- (NSArray *)items {
  if(!_items) {
    _items = [NSMutableArray array];
    for (int i = 1;i < 8;i++) {
      NSString *title = [NSString stringWithFormat:@"这是标题%d",i];
      NSString *content = [NSString stringWithFormat:@"这是内容%d",i];
      NSString *image = [NSString stringWithFormat:@"%d.jpg",i];
      NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:title,@"title",content,@"content",image,@"image", nil];
      [_items addObject:dic];
    }
  }
  return _items;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
