//
//  MIYUVideoCall.m
//  MIYU
//
//  Created by hanyutong on 2018/4/27.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUVideoCall.h"

@implementation MIYUVideoCall
- (IBAction)videoCallAction:(id)sender {
  if (self.VideoCallBlock) {
    self.VideoCallBlock(nil);
  }
}
@end
