//
//  APIClient.m
//  WhenWith
//
//  Created by jav on 15/9/28.
//  Copyright (c) 2015年 java. All rights reserved.
//

#import "APIClient.h"
#import "NSString+Base64.h"
#import <CommonCrypto/CommonDigest.h>

#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
NSString *const Notification_ChangeMainDisplay = @"Notification_ChangeMainDisplay";
#warning 使用 SUNSlideSwitchView 需要tableview高度减少；如果不使用，设置未0.0f即可
CGFloat NavAndBarHeight = 64.0f;

@implementation APIClient

+ (instancetype)sharedClient:(NSString *)url {
    static APIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[APIClient alloc] initWithBaseURL:[NSURL URLWithString:url]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return _sharedClient;
}

//判断返回值是否正确
+ (BOOL) requestSuccess:(NSString *)result{
    return [result intValue] == 1 ? YES : NO;
}

//判断返回值
+ (NSInteger) requestResult:(NSString *)result
{
    return [result intValue];
}



- (NSDictionary *)createBehavior
{
    return @{};
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
//    //    NSLog(@"identifierForVendor=%@",identifierForVendor);
//    NSString *uuid = identifierForVendor ? identifierForVendor : @"";
//    NSString *userId = [defaults objectForKey:Login_isLogin]?[defaults objectForKey:Login_user_id]:@0;
//    NSString *sessionKey = [defaults objectForKey:Login_isLogin]?[defaults objectForKey:Login_access_token]:@0;
//    NSString *appversion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//    NSString *registration = [JPUSHService registrationID]?[JPUSHService registrationID]:@"";
//    [defaults synchronize];
////    if (userId == nil || sessionKey == nil) {
////        NSDictionary *behavior = @{
////                                   @"phoneImei":uuid,
////                                   @"platform":@2,
////                                   @"version":appversion
////                                   };
////        return behavior;
////    }
//    NSString *zhongStr = @"1";
//    if ([NSString isSimpChinessEnvironment] == YES)
//    {
//        zhongStr = @"1";//中文
//    }
//    else
//    {
//        zhongStr = @"2";//老挝语
//    }
////#if ISCHINEEE_SWITCH
////    zhongStr = @"1";//中文
////#else
////    zhongStr = @"2";//老挝语
////#endif
////    NSLog(@"zhongStr:%@", zhongStr);
//    NSDictionary *behavior = @{
//                               @"phone_imei":uuid,
//                               @"registration_id":registration,
//                               @"member_id":userId,
//                               @"access_token":sessionKey,
//                               @"version":appversion,
//                               @"language":zhongStr
//                               };
////    NSLog(@"behavior=%@",behavior);
//    return behavior;
}

- (NSDictionary *)createParam:(NSDictionary *)params {
    
    if (params == nil)
    {
        NSDictionary *behaviorDic = [self createBehavior];
        NSString *behaviorStr = [behaviorDic JSONString].base64EncodedString;
        NSString *behavior    = [behaviorStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *md5Str = [NSString stringWithFormat:@"04580dadc2d09dde44a0e91a737ee6a1%@",behavior];
        const char *cStr = [md5Str UTF8String];
        unsigned char result[16];
        CC_MD5(cStr,  (CC_LONG)strlen(cStr), result); // This is the md5 call
        NSString *md5s = [NSString stringWithFormat:
                          @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                          result[0], result[1], result[2], result[3],
                          result[4], result[5], result[6], result[7],
                          result[8], result[9], result[10], result[11],
                          result[12], result[13], result[14], result[15]
                          ];
        return [NSDictionary dictionaryWithObjectsAndKeys:@2,@"app_id",behaviorStr,@"behavior",md5s,@"sig", nil];
    }
    NSString *base64;
    if (!IOS7_OR_LATER) {
        base64 = [[params JSONString]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }else{
        base64 =[[params JSONString]stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    }
    NSString *input = base64.base64EncodedString;

    NSDictionary *behaviorDic;
    
    behaviorDic = [self createBehavior];

    NSString *behaviorStr = [behaviorDic JSONString].base64EncodedString;
    NSString *behavior    = [behaviorStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *md5Str = [NSString stringWithFormat:@"04580dadc2d09dde44a0e91a737ee6a1%@%@",input,behavior];
    const char *cStr = [md5Str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr,  (CC_LONG)strlen(cStr), result); // This is the md5 call
    NSString *md5s = [NSString stringWithFormat:
                      @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                      result[0], result[1], result[2], result[3],
                      result[4], result[5], result[6], result[7],
                      result[8], result[9], result[10], result[11],
                      result[12], result[13], result[14], result[15]
                      ];
    return [NSDictionary dictionaryWithObjectsAndKeys:@2,@"app_id",input,@"input",behaviorStr,@"behavior",md5s,@"sig", nil];
}


- (void)commonWith:(NSString *)url Params:(NSDictionary *)params success:(APIClientSuccess)success failure:(APIClientFailure)failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:[self createParam:params] progress:nil success:^(NSURLSessionDataTask * task, id  responseObject) {
        
        if (success) {
            success((NSURLSessionDataTask *)task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        NSLog(@"error=%@",error);
        if (failure) {
            failure((NSURLSessionDataTask *)task,error);
        }
    }];
}

- (void)uploadImage:(NSString *)url Params:(NSDictionary *)params imageData:(NSArray *)photoAry success:(APIClientSuccess)success failure:(APIClientFailure)failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSLog(@"url=%@",url);
    [manager POST:url parameters:[self createParam:params] constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (photoAry.count != 0) {
            for (int i = 0; i < photoAry.count; i++) {
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyyMMddHHmmss";
                NSString *str = [formatter stringFromDate:[NSDate date]];
                NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
                [formData appendPartWithFileData:[photoAry objectAtIndex:i] name:[NSString stringWithFormat:@"attachs%d",i] fileName:fileName mimeType:@"image/png"];
            }
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success((NSURLSessionDataTask *)task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure((NSURLSessionDataTask *)task,error);
        }
    }];
}



@end
