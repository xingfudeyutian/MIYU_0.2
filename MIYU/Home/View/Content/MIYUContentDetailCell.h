//
//  MIYUContentDetailCell.h
//  MIYU
//
//  Created by hanyutong on 2018/3/22.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIYUContentDetailCell : BaseTableViewCell

@property (nonatomic, copy) void(^shareActionBlock)(id model);

@end
