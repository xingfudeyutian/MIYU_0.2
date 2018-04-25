//
//  MIYUMyVideoCell.m
//  MIYU
//
//  Created by hanyutong on 2018/4/23.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUMyVideoCell.h"

@implementation MIYUMyVideoCell

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
