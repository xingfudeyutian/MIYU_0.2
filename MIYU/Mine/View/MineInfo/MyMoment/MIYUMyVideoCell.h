//
//  MIYUMyVideoCell.h
//  MIYU
//
//  Created by hanyutong on 2018/4/23.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "NSObject+extend.h"

@interface MIYUMyVideoCell : BaseTableViewCell
@property (nonatomic, copy) void(^moreActionBlock)(id model);

@end
