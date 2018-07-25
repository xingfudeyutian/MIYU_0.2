//
//  MIYUAudioDetailCell.h
//  MIYU
//
//  Created by hanyutong on 2018/7/24.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "NSObject+extend.h"

@interface MIYUAudioDetailCell : BaseTableViewCell
@property (nonatomic, copy) void(^shareActionBlock)(id model);
@end
