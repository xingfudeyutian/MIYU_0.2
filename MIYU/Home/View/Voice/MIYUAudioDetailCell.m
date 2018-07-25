//
//  MIYUAudioDetailCell.m
//  MIYU
//
//  Created by hanyutong on 2018/7/24.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUAudioDetailCell.h"
#import "MIYUAudioView.h"

@interface MIYUAudioDetailCell ()
@property (weak, nonatomic) IBOutlet MIYUAudioView *audioView;

@end

@implementation MIYUAudioDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
  float levels = 30;

  [self.audioView frequenceLevel:&levels];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
