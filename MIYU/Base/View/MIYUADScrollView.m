//
//  MIYUADScrollView.m
//  MIYU
//
//  Created by hanyutong on 2018/4/16.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUADScrollView.h"


@interface MIYUADScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIPageControl * pageControl;

@end


@implementation MIYUADScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
  if (self == [super initWithFrame:frame])
  {
    [self setSubViews];
  }
  return self;
}

-(void)setSubViews
{
  [self addSubview:self.scrollView];
  [self addSubview:self.pageControl];
}
-(UIScrollView *)scrollView
{
  if (_scrollView == nil)
  {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    _scrollView.contentSize = CGSizeMake(self.width, self.height);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
  }
  return _scrollView;
}
-(UIPageControl *)pageControl
{
  if (_pageControl == nil)
  {
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.height-50, FUll_VIEW_WIDTH, 50)];
    _pageControl.centerX = self.centerX;
    _pageControl.currentPage = 0;
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = COLOR_YELLOW;
  }
  return _pageControl;
}
-(void)setAds:(NSArray *)ads
{
  _ads = ads;

  for (int i = 0; i< ads.count; i++)
  {
    UIImageView * adImage = [[UIImageView alloc] init];
    adImage.tag = i;
    adImage.clipsToBounds = YES;
    adImage.contentMode = UIViewContentModeScaleAspectFill;
    [adImage setImageWithURL:[NSURL URLWithString:@""] placeholder:[UIImage imageNamed:self.ads[i]]];
    adImage.frame = CGRectMake(i*FUll_VIEW_WIDTH, 0, FUll_VIEW_WIDTH, self.height);
    adImage.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
       self.adTapActionBlock ? self.adTapActionBlock(i) : nil ;
    }];
    [adImage addGestureRecognizer:tapGesture];
    [self.scrollView addSubview:adImage];
  }
  self.scrollView.contentSize = CGSizeMake(ads.count*FUll_VIEW_WIDTH, 150);
  self.pageControl.numberOfPages = ads.count;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  int page = scrollView.contentOffset.x / self.width;
  _pageControl.currentPage = page;
}

@end
