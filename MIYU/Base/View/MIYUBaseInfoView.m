//
//  MIYUBaseInfoView.m
//  MIYU
//
//  Created by hanyutong on 2018/7/24.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseInfoView.h"

@implementation MIYUBaseInfoView
- (instancetype)initWithCoder:(NSCoder *)aDecoder

{

  self = [super initWithCoder:aDecoder];

  if (self) {

    UIView *containerView = [[[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:self options:nil] firstObject ];

    containerView.frame = self.bounds;

    [self addSubview:containerView];

  }

  return self;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
