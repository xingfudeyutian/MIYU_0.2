//
//  MIYUContentDetailCell.m
//  MIYU
//
//  Created by hanyutong on 2018/3/22.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUContentDetailCell.h"
#import "MIYUAudioView.h"


@interface MIYUContentDetailCell ()


@end

@implementation MIYUContentDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)shareButton:(id)sender {
  if (self.shareActionBlock)
  {
    self.shareActionBlock(nil);
  }
  
}
-(void)setControllerType:(MIYUViewControllerType)controllerType
{
  _controllerType = controllerType;

  
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
