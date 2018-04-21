//
//  MIYUBaseSquareCollectionController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/26.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseSquareCollectionController.h"
#import "MIYUShowSquareCell.h"

#define SquareID @"MIYUShowSquareCell"
#define margin 10.0f


@interface MIYUBaseSquareCollectionController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation MIYUBaseSquareCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setupSubViews
{
    [super setupSubViews];
    self.edgesForExtendedLayout = UIRectEdgeNone;

    //注册cell
    UINib * squareNib = [UINib nibWithNibName:NSStringFromClass([MIYUShowSquareCell class]) bundle: [NSBundle mainBundle]];
    [self.collectionView registerNib:squareNib forCellWithReuseIdentifier:SquareID];
}
//item大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  CGFloat width;
  CGFloat height;

      width = (FUll_VIEW_WIDTH - 3*margin)/2;
      height = 8*width/5;

    return CGSizeMake(width, height);
}
//纵向间距
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return margin;
}
//横向间距
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return margin;
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

  return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

  MIYUBaseCollectionViewCell * cell;
      cell = [collectionView dequeueReusableCellWithReuseIdentifier:SquareID forIndexPath:indexPath];

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 

@end
