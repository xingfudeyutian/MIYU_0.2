//
//  MIYUContentCell.h
//  MIYU
//
//  Created by hanyutong on 2018/3/14.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIYUContentCell : BaseTableViewCell

@property (nonatomic, copy) void(^moreActionBlock)(id model);

@end
