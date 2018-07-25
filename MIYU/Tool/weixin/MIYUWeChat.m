//
//  MIYUWeChat.m
//  MIYU
//
//  Created by hanyutong on 2018/7/12.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUWeChat.h"

static NSString * AppKey = @"wxfdc69d4343bfd0b9";
static NSString * AppSecret = @"";

@interface MIYUWeChat () <WXApiDelegate>

@property (nonatomic, strong) SendAuthResp * authResp;

@end

@implementation MIYUWeChat

+ (instancetype)sharedInstance
{   //线程锁方式
  static id sharedInstance;
  @synchronized(self) {
    if (sharedInstance == nil) {
      sharedInstance = [[MIYUWeChat alloc] init];
    }
  }
  return sharedInstance;
}

//注册微信
- (void)registerApp
{
  [WXApi registerApp:AppKey];

}

- (BOOL)isWXAppInstalled
{
  return [WXApi isWXAppInstalled];
}


-(void)sendAuthRequest
{
  //构造SendAuthReq结构体
  SendAuthReq* req =[[SendAuthReq alloc]init];
  req.scope = @"snsapi_userinfo";
  req.state = @"123";
  //第三方向微信终端发送一个SendAuthReq消息结构
  [WXApi sendReq:req];
}

-(void)onReq:(BaseReq *)req
{

}
-(void)onResp:(BaseResp *)resp
{
  BOOL success = NO;
  NSString * message = @"UnKnown";

  switch (resp.errCode)
  {
    case WXSuccess:
      success = YES;
      break;

    case WXErrCodeCommon:
      message = @"普通错误";
      break;

    case WXErrCodeUserCancel:
      message = @"用户点击取消并返回";
      break;

    case WXErrCodeSentFail:
      message = @"发送失败";
      break;

    case WXErrCodeAuthDeny:
      message = @"授权失败";
      break;

    case WXErrCodeUnsupport:
      message = @"微信不支持";
      break;

    default:
      message = @"未知错误";
  }

  if (success)
  {
    //如果返回值为第三方登录resp
    if ([resp isKindOfClass:[SendAuthResp class]]) {
      self.authResp = (SendAuthResp*)resp;

    }else
    {

    }
  }

}

-(void)getAccessToken
{
  //  https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
  [MIYUAFNLinks getWeChatAccess_TokenWithAppID:AppKey secret:AppSecret code:self.authResp.code grant_type:@"authorization_code"];

}









@end
