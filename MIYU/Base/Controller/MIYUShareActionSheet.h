//
//  MIYUShareActionSheet.h
//  MIYU
//
//  Created by hanyutong on 2018/4/24.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MIYUShareActionSheet : NSObject

+(UIAlertController *)showShareActionSheetWithType:(MIYUViewControllerType)controllerType model:(id)model actionBlock:(void(^) (id paramer))block;
+(UIAlertController *)showMoreActionSheetModel:(id)model actionBlock:(void(^) (id paramer))block;
+(UIAlertController *)showReportActionSheetModel:(id)model actionBlock:(void(^) (id paramer))block;

@end
