//
//  MIYUAudioView.m
//  MIYU
//
//  Created by hanyutong on 2018/7/24.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUAudioView.h"
#import "WaveView.h"

@interface MIYUAudioView ()
@property (weak, nonatomic) IBOutlet UIButton *audioBtn;
@property (weak, nonatomic) IBOutlet WaveView *waveView;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIView *fuzzyView;
@end

@implementation MIYUAudioView


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
