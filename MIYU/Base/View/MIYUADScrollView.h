//
//  MIYUADScrollView.h
//  MIYU
//
//  Created by hanyutong on 2018/4/16.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIYUADScrollView : UIView

@property (nonatomic ,strong) NSArray * ads;
@property (nonatomic, copy) void (^adTapActionBlock)(int i);

@end
