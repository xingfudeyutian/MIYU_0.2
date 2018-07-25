//
//  MIYUWeChat.h
//  MIYU
//
//  Created by hanyutong on 2018/7/12.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WXApi.h>



@interface MIYUWeChat : NSObject
+ (instancetype)sharedInstance;
- (void)registerApp;
- (BOOL)isWXAppInstalled;
//- (void)share;
- (void)sendAuthRequest;
//- (void)sendPaymentRequest;
//- (void)jumpToBizProfile;
//- (void)jumpToWechat;
//- (void)chooseInvoiceFromWX;

@end
