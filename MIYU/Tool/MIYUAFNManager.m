//
//  MIYUAFNManager.m
//  MIYU
//
//  Created by hanyutong on 2018/7/12.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUAFNManager.h"

@implementation MIYUAFNManager

+ (void)post:(NSString *)url params:(id)params progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
  AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
  //https设置
  AFSecurityPolicy * security = [AFSecurityPolicy defaultPolicy];
  //是否允许CA不信任的证书通过
  security.allowInvalidCertificates = YES;
  //是否验证主机名
  security.validatesDomainName = NO;
  mgr.securityPolicy = security;

  [mgr.requestSerializer setTimeoutInterval:20.0];
  //    mgr.requestSerializer = [AFJSONRequestSerializer serializer];


  [mgr POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
    if (progress) {
      progress(uploadProgress);
    }
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    if (success) {
      DLog(@"url---%@/n responseObject -----%@",url,responseObject);
      success(responseObject);
    }
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    if (failure) {
      DLog(@"url---%@/n error -----%@",url,error);
      failure(error);
    }
  }];
}

+ (void)post:(NSString *)url contentType:(NSString*)contentType params:(id)params progress:(void (^)(NSProgress *progress))progress success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
  AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
  //https设置
  AFSecurityPolicy * security = [AFSecurityPolicy defaultPolicy];
  //是否允许CA不信任的证书通过
  security.allowInvalidCertificates = YES;
  //是否验证主机名
  security.validatesDomainName = NO;
  mgr.securityPolicy = security;

  mgr.requestSerializer = [AFJSONRequestSerializer serializer];
  [mgr.requestSerializer setValue:contentType forHTTPHeaderField:@"Content-Type"];
  //    NSLog(@"%@",mgr.requestSerializer.HTTPRequestHeaders);
  [mgr.requestSerializer setTimeoutInterval:20.0];


  [mgr POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
    if (progress) {
      progress(uploadProgress);
    }
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    if (success) {
      success(responseObject);
    }
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    if (failure) {
      failure(error);
    }
  }];
}

+ (void)get:(NSString *)url params:(id)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
  // 1.创建一个请求管理者
  AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
  mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
  //https设置
  AFSecurityPolicy * security = [AFSecurityPolicy defaultPolicy];
  //是否允许CA不信任的证书通过
  security.allowInvalidCertificates = YES;
  //是否验证主机名
  security.validatesDomainName = NO;
  mgr.securityPolicy = security;

  // 2.发送一个GET请求
  [mgr GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {

  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    if (success) {
      success(responseObject);
    }
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    if (failure) {
      failure(error);
    }
  }];
}



+ (void)post:(NSString *)url params:(id)params files:(NSArray *)files success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
  // 1.创建一个请求管理者
  AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
  //https设置
  AFSecurityPolicy * security = [AFSecurityPolicy defaultPolicy];
  //是否允许CA不信任的证书通过
  security.allowInvalidCertificates = YES;
  //是否验证主机名
  security.validatesDomainName = NO;
  mgr.securityPolicy = security;

  // 2.发送请求
  [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    for (MIYUHttpFile *file in files) {
      [formData appendPartWithFileData:file.data name:file.name fileName:file.filename mimeType:file.mimeType];
    }
  } progress:^(NSProgress * _Nonnull uploadProgress) {
    DLog(@"uploadProgress %lld",uploadProgress.completedUnitCount);
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    if (success) {
      DLog(@"url---%@/n responseObject -----%@",url,responseObject);

      success(responseObject);

    }
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    if (failure) {
      DLog(@"url---%@/n error -----%@",url,error.description);

      failure(error);

    }
  }];

}
@end
@implementation MIYUHttpFile

+ (instancetype)fileWithName:(NSString *)name data:(NSData *)data mimeType:(NSString *)mimeType filename:(NSString *)filename
{
  MIYUHttpFile *file = [[self alloc] init];
  file.name = name;
  file.data = data;
  file.mimeType = mimeType;
  file.filename = filename;
  return file;
}

@end
