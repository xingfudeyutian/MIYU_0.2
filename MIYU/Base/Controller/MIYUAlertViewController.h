//
//  MIYUAlertViewController.h
//  MIYU
//
//  Created by hanyutong on 2018/5/21.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseViewController.h"
#import "MIYUAlertModel.h"

typedef void(^AlertAction) (NSInteger tag);

@interface MIYUAlertViewController : MIYUBaseViewController

@property (nonatomic, strong) MIYUAlertModel * model;
@property (nonatomic, copy) AlertAction actionBlock;

@end
