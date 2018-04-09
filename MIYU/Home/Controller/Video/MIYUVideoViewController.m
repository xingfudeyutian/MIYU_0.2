//
//  MIYUVideoViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/4/8.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUVideoViewController.h"
#import "MIYUVideoShowViewController.h"

#import "CardView.h"
#import "CardItem2.h"
#import "CardViewConstants.h"

@interface MIYUVideoViewController ()<CardViewDelegate, CardViewDataSource>
{
  BOOL __oneTypeItem;
  CardViewItemScrollMode __cardViewMode;
}
@property (weak, nonatomic) IBOutlet CardView * cardView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint * cardViewHeightConstraint;

@end

//static NSString * ITEM_XIB    = @"CardItem";
static NSString * ITEM_XIB_2  = @"CardItem2";
//static NSString * ITEM_RUID   = @"Item_RUID";
static NSString * ITEM_RUID_2 = @"Item_RUID2";

@implementation MIYUVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self initData];
  self.cardView.delegate   = self;
  self.cardView.dataSource = self;
  self.cardView.maxItems   = 2;
  self.cardView.scaleRatio = 0.08;
  self.cardView.isNeedControl = NO;
  self.cardViewHeightConstraint.constant = CARD_ITEM_H;
  // 修改约束后 cardView 的高度不会立即生效，依然是以 530 来计算，会导致 item 项布局错误，所以此处调用
  [self.view layoutIfNeeded];

//  [self.cardView registerXibFile:ITEM_XIB forItemReuseIdentifier:ITEM_RUID];
  [self.cardView registerXibFile:ITEM_XIB_2 forItemReuseIdentifier:ITEM_RUID_2];
  [self.cardView reloadData];
}
- (void)initData
{
  __oneTypeItem  = NO;
  __cardViewMode = CardViewItemScrollModeRemove;

}

#pragma mark - CYKJCardViewDelegate/DataSource

- (NSInteger)numberOfItemsInCardView:(CardView *)cardView
{
  if (!__oneTypeItem) {
  }
  return 10;
}

- (CardViewItem *)cardView:(CardView *)cardView itemAtIndex:(NSInteger)index
{
//  if (!__oneTypeItem && index % 2) {

    CardItem2 * item2 = (CardItem2 *)[cardView dequeueReusableCellWithIdentifier:ITEM_RUID_2];

    item2.imageView.image = [UIImage imageNamed:@"info"];

    return item2;
//  }
//
//  CardItem * item = (CardItem *)[cardView dequeueReusableCellWithIdentifier:ITEM_RUID];
//
//  NSInteger idx = __oneTypeItem ? index : index / 2;
//
//  [item setItemWithData:self.model1[idx]];
//
//  return item;
}

- (CGRect)cardView:(CardView *)cardView rectForItemAtIndex:(NSInteger)index
{
  return CGRectMake(0, 0, CARD_ITEM_W, CARD_ITEM_H);
}

- (void)cardView:(CardView *)cardView didSelectItemAtIndex:(NSInteger)index
{
  NSLog(@"卡片%ld被选中", (long)index);

  MIYUVideoShowViewController * videoShowVC = [[MIYUVideoShowViewController alloc] init];
  videoShowVC.hidesBottomBarWhenPushed = YES;
  [self.navigationController pushViewController:videoShowVC animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
