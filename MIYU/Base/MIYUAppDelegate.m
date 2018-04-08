//
//  MIYUAppDelegate.m
//  MIYU
//
//  Created by hanyutong on 2018/1/3.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUAppDelegate.h"

//tab页
#import "MIYUTabBarController.h"

#import "MIYUPhoneLoginViewController.h"



@interface MIYUAppDelegate ()

@end

@implementation MIYUAppDelegate

	
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  //MIYUPhoneLoginViewController  *tabBarVC = [[MIYUPhoneLoginViewController alloc] init];
  //UINavigationController  * nav = [[UINavigationController alloc] initWithRootViewController:tabBarVC];

    MIYUTabBarController *tabBarVC = [[MIYUTabBarController alloc] init];
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyWindow];

  [self RongCloudConfig];
    return YES;
}


-(void)RongCloudConfig
{
//  dv7RbD8Q5qRZ0yDiEJxapkwpknsxF1CPoX0DzdOdedfAPjYadnbqLKr2VYqH4ny6GhFFBHOjyWNoCydanNJEFg==

  //初始化融云SDK
  [[RCIM sharedRCIM] initWithAppKey:RONGCLOULDIM_KEY];
  //连接服务器
  [[RCIM sharedRCIM] connectWithToken:@"dv7RbD8Q5qRZ0yDiEJxapkwpknsxF1CPoX0DzdOdedfAPjYadnbqLKr2VYqH4ny6GhFFBHOjyWNoCydanNJEFg=="     success:^(NSString *userId) {
    NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
  } error:^(RCConnectErrorCode status) {
    NSLog(@"登陆的错误码为:%ld", status);
  } tokenIncorrect:^{
    //token过期或者不正确。
    //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
    //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
    NSLog(@"token错误");
  }];
}








- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
