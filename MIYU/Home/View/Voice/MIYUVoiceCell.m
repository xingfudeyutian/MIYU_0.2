//
//  MIYUVoiceCell.m
//  MIYU
//
//  Created by hanyutong on 2018/4/8.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUVoiceCell.h"

@implementation MIYUVoiceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)moreAction:(id)sender {

  if (self.moreActionBlock)
  {
    self.moreActionBlock(nil);
  }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
