//
//  MIYUAFNLinks.h
//  MIYU
//
//  Created by hanyutong on 2018/7/12.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MIYUAFNManager.h"
@interface MIYUAFNLinks : NSObject


+(void)getWeChatAccess_TokenWithAppID:(NSString*)AppID secret:(NSString*)secret code:(NSString*)code grant_type:(NSString*)grant_type;


@end
