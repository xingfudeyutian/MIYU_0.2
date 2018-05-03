//
//  MIYUGiftViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/4/27.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUGiftViewController.h"
#import "MIYUGiftCell.h"

#define GiftCellID @"MIYUGiftCell"

@interface MIYUGiftViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;

@end

@implementation MIYUGiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)setupSubViews
{
  [super setupSubViews];
  self.edgesForExtendedLayout = UIRectEdgeNone;
  self.collectionView.alwaysBounceHorizontal = YES;
  self.collectionView.showsHorizontalScrollIndicator = NO;
  //注册cell
  UINib * giftCellNib = [UINib nibWithNibName:NSStringFromClass([MIYUGiftCell class]) bundle: [NSBundle mainBundle]];
  [self.collectionView registerNib:giftCellNib forCellWithReuseIdentifier:GiftCellID];
}
//item大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  return CGSizeMake(FUll_VIEW_WIDTH/5, (self.view.height - 60)/2);
}
//纵向间距
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
  return 0;
}
//横向间距
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
  return 0;
}
//通过调整inset使单元格顶部和底部都有间距(inset次序: 上，左，下，右边)

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView
                         layout:(UICollectionViewLayout *)collectionViewLayout
         insetForSectionAtIndex:(NSInteger)section
{
  return UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(FUll_VIEW_WIDTH, 60);
//}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

  return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

  return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

  MIYUBaseCollectionViewCell * cell;
  cell = [collectionView dequeueReusableCellWithReuseIdentifier:GiftCellID forIndexPath:indexPath];

  return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
 

@end
