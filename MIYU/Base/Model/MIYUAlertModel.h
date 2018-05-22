//
//  MIYUAlertModel.h
//  MIYU
//
//  Created by hanyutong on 2018/5/22.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseModel.h"

@interface MIYUAlertModel : MIYUBaseModel

@property (nonatomic, assign) NSInteger alertTag;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, copy) NSString * leftButton;
@property (nonatomic, copy) NSString * rightButton;

@end
