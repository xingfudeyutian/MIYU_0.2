//
//  MIYUBaseViewController.h
//  MIYU
//
//  Created by hanyutong on 2018/1/3.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MIYUBaseViewController : UIViewController

@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, assign) MIYUViewControllerType controllerType;

- (void)setupSubViews;

@end
