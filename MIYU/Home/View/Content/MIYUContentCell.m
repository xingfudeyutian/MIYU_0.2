//
//  MIYUContentCell.m
//  MIYU
//
//  Created by hanyutong on 2018/3/14.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUContentCell.h"


@interface MIYUContentCell()


@end


@implementation MIYUContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
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
