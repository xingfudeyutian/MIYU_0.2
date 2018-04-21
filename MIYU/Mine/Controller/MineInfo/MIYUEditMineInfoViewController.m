//
//  MIYUEditMineInfoViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/30.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUEditMineInfoViewController.h"
#import "MIYUEditImageCell.h"
#import "MIYUMineInfoSquareCell.h"
#import "ZLCollectionViewFlowLayout.h"

#define EditImageID @"MIYUEditImageCell"
#define EditInfoID  @"MIYUMineInfoSquareCell"

#define margin 2.0f

@interface MIYUEditMineInfoViewController  ()<UICollectionViewDelegate,UICollectionViewDataSource,ZLCollectionViewFlowLayoutDelegate>

@property(nonatomic,strong)UICollectionView* collectionView;
//@property(nonatomic,strong)UICollectionViewLayout* layout;


@end

@implementation MIYUEditMineInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑个人信息";
    [self.view addSubview:self.collectionView];
}

-(void)setupSubViews
{
  [super setupSubViews];
  //    self.automaticallyAdjustsScrollViewInsets = NO;
//  self.edgesForExtendedLayout = UIRectEdgeNone;
  // Register cell classes
  //注册cell
  UINib * editImageNib = [UINib nibWithNibName:NSStringFromClass([MIYUEditImageCell class]) bundle: [NSBundle mainBundle]];
  [self.collectionView registerNib:editImageNib forCellWithReuseIdentifier:EditImageID];

  UINib * editInfoNib = [UINib nibWithNibName:NSStringFromClass([MIYUMineInfoSquareCell class]) bundle: [NSBundle mainBundle]];
  [self.collectionView registerNib:editInfoNib forCellWithReuseIdentifier:EditInfoID];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  return section ? 4:6;
}

- (ZLLayoutType)collectionView:(UICollectionView *)collectionView layout:(ZLCollectionViewFlowLayout *)collectionViewLayout typeOfLayout:(NSInteger)section {
  return  AbsoluteLayout;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

  MIYUBaseCollectionViewCell * cell ;
  if (indexPath.section == 0)
  {
      cell = [collectionView dequeueReusableCellWithReuseIdentifier:EditImageID forIndexPath:indexPath];
  }else
  {
      cell = [collectionView dequeueReusableCellWithReuseIdentifier:EditInfoID forIndexPath:indexPath];
  }

  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"点击了section=%zd，item=%zd",indexPath.section,indexPath.item);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  CGFloat w = (FUll_VIEW_WIDTH-2*margin)/3;
  switch (indexPath.section) {
    case 0: {
      switch (indexPath.item) {
        case 0:
          return CGSizeMake(2*w+margin, 2*w+margin);
        default:
          return CGSizeMake(w,w);
      }
    }
    case 1:{
     return CGSizeMake(FUll_VIEW_WIDTH, 50);
    }
    default:
      return CGSizeZero;
  }
}
- (CGRect)collectionView:(UICollectionView *)collectionView layout:(ZLCollectionViewFlowLayout*)collectionViewLayout rectOfItem:(NSIndexPath*)indexPath
{
   CGFloat w = (FUll_VIEW_WIDTH-2*margin)/3;

    switch (indexPath.section) {
      case 0:
      {
        switch (indexPath.item) {
          case 0:
            return CGRectMake(0, 0, 2*w+margin, 2*w+margin);
          case 1:
            return CGRectMake(2*w+2*margin, 0,  w ,  w );
          case 2:
            return CGRectMake(2*w+2*margin, w+margin,  w ,  w );
          case 3:
            return CGRectMake(0, 2*w+2*margin,  w ,  w );
          case 4:
            return CGRectMake(w+margin,  2*w+2*margin,  w ,  w );
          case 5:
            return CGRectMake(2*w+2*margin,  2*w+2*margin,  w ,  w );
          default:
             return CGRectZero;
            break;
        }
      }
        break;
        case 1:
      {
        switch (indexPath.item) {
          case 0:
            return CGRectMake(0, 0, FUll_VIEW_WIDTH,50);
          case 1:
            return CGRectMake(0, 50, FUll_VIEW_WIDTH,50);
          case 2:
            return CGRectMake(0, 100, FUll_VIEW_WIDTH,50);
          case 3:
            return CGRectMake(0, 150, FUll_VIEW_WIDTH,50);
          default:
            return CGRectZero;
            break;
        }
      }
        break;
      default:
        return CGRectZero;
        break;
    }

}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
       return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
      return margin;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
      return 0;
}


-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
  return YES;
}

-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{

}

- (void)longPressAction:(UILongPressGestureRecognizer *)longPress {
  //获取此次点击的坐标，根据坐标获取cell对应的indexPath
  CGPoint point = [longPress locationInView:_collectionView];
  NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
  //根据长按手势的状态进行处理。
  switch (longPress.state) {
    case UIGestureRecognizerStateBegan:
      //当没有点击到cell的时候不进行处理
      if (!indexPath) {
        break;
      }
      //开始移动
      [_collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
      break;
    case UIGestureRecognizerStateChanged:
      //移动过程中更新位置坐标
      [_collectionView updateInteractiveMovementTargetPosition:point];
      break;
    case UIGestureRecognizerStateEnded:
      //停止移动调用此方法
      [_collectionView endInteractiveMovement];
      break;
    default:
      //取消移动
      [_collectionView cancelInteractiveMovement];
      break;
  }
}

- (UICollectionView*)collectionView {
  if (!_collectionView) {
    ZLCollectionViewFlowLayout *flowLayout = [[ZLCollectionViewFlowLayout alloc] init];
    flowLayout.delegate = self;

    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT-NavigationBarHeight) collectionViewLayout:flowLayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    [_collectionView addGestureRecognizer:longPressGesture];

  }
  return _collectionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
