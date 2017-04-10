//
//  APIClient.h
//  WhenWith
//
//  Created by jav on 15/9/28.
//  Copyright (c) 2015年 java. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
//#import "AFHTTPSessionManager.h"

#import "JSONKit.h"
#import "NSString+Base64.h"

#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
//#import "AFHTTPSessionManager.h"
//#import "AFHTTPRequestOperation.h"
//#import "AFHTTPRequestOperationManager.h"

typedef void (^APIClientSuccess) (NSURLSessionDataTask *operation, id responseObject);
typedef void (^APIClientFailure) (NSURLSessionDataTask *operation, NSError *error);

@interface APIClient : AFHTTPSessionManager
+ (instancetype)sharedClient:(NSString *)url;

- (void)commonWith:(NSString *)url Params:(NSDictionary *)params success:(APIClientSuccess)success failure:(APIClientFailure)failure;

- (void)uploadImage:(NSString *)url Params:(NSDictionary *)params imageData:(NSArray *)photoAry success:(APIClientSuccess)success failure:(APIClientFailure)failure;

//判断返回值是否正确
+ (BOOL) requestSuccess:(NSString *)result;


//判断返回值
+ (NSInteger) requestResult:(NSString *)result;
@end
