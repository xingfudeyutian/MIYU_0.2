//
//  MIYUShareActionSheet.m
//  MIYU
//
//  Created by hanyutong on 2018/4/24.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUShareActionSheet.h"

@implementation MIYUShareActionSheet


+(UIAlertController *)showShareActionSheetWithType:(MIYUViewControllerType)controllerType model:(id)model actionBlock:(void(^) (id paramer))block
{
  UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
  UIAlertAction * actionQQZone = [UIAlertAction actionWithTitle:@"分享到QQ空间" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
  }];
  UIAlertAction * actionQQ = [UIAlertAction actionWithTitle:@"分享到QQ" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
  }];
  UIAlertAction * actionMoment = [UIAlertAction actionWithTitle:@"分享到朋友圈" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
  }];
  UIAlertAction * actionWeChat = [UIAlertAction actionWithTitle:@"分享到微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
  }];
  NSString * title = controllerType == MIYUOTHERINFO ? @"举报":@"删除";
  UIAlertAction * actionExt = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
    if ([action.title isEqualToString:@"举报"])
    {
      block(alert);
    }
  }];
  UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
  }];
  [alert addAction:actionQQZone];
  [alert addAction:actionQQ];
  [alert addAction:actionMoment];
  [alert addAction:actionWeChat];
  [alert addAction:actionExt];
  [alert addAction:cancel];
  return alert;
}

+(UIAlertController *)showMoreActionSheetModel:(id)model actionBlock:(void(^) (id paramer))block
{
  UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
  UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"关注此标签" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
  }];
  UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"不感兴趣" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
  }];
  UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
  }];
  [alert addAction:action1];
  [alert addAction:action2];
  [alert addAction:cancel];
  return alert;
}
+(UIAlertController *)showReportActionSheetModel:(id)model actionBlock:(void(^) (id paramer))block
{
  UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
  UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"广告或垃圾信息" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
  }];
  UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"色情或低俗内容" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
  }];
  UIAlertAction * action3 = [UIAlertAction actionWithTitle:@"其他理由" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
  }];
  UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
  }];
  [alert addAction:action1];
  [alert addAction:action2];
  [alert addAction:action3];
  [alert addAction:cancel];
  return alert;
}


@end
