//
//  NSString+Extension.m
//  NeeStore
//
//  Created by ChenRongQin on 16/8/16.
//  Copyright © 2016年 XYC. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


//+ (NSString *)getLaoWithChiness:(NSString *)chinessStr
//{
//    return Localized(chinessStr);
//}

/**
 *  返回中文或者老挝文
 *
 *  @param chinessStr
 *  @param laoWoStr   <#laoWoStr description#>
 *
 *  @return <#return value description#>
 */
//+ (NSString *)chinessOrLaoWoWith:(NSString *)chinessStr lao:(NSString *)laoWoStr;
//{
////    NSString *returnStr = nil;
////    
////    #if ISCHINEEE_SWITCH
////    returnStr = chinessStr;
////    #else
////    returnStr = laoWoStr;
////    #endif
//    
//    return Localized(chinessStr);
//}

+ (NSString *) md5: (NSString *) inPutText
{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ]lowercaseString];
}


//将字典转为JSON字符串
+ (NSString *)dicToJsonString:(NSDictionary *)dic;
{
    //dic-->data
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    
    //data-->JsonStr
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    
    return str;
}

////判断某个对象是否是空对象或空指针.YES,表示是空对象或空指针
//+ (BOOL)isNullOrNilWithObj:(id)obj;
//{
//    BOOL isNullOrNil = YES;
//    
//    if ([obj isEqual: [NSNull null]] == NO && obj)
//    {
//        isNullOrNil = NO;
//    }
//    
//    return isNullOrNil;
//}
//
//+ (void)removeLoginInfo;
//{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    [defaults removeObjectForKey:Login_access_token];
//    [defaults removeObjectForKey:Login_birthday];
//    [defaults removeObjectForKey:Login_create_time];
//    [defaults removeObjectForKey:Login_user_id];
//    [defaults removeObjectForKey:Login_is_post_comment];
//    [defaults removeObjectForKey:Login_mobile_phone];
//    [defaults removeObjectForKey:Login_resident];
//    [defaults removeObjectForKey:Login_status];
//    [defaults removeObjectForKey:Login_user_icon];
//    [defaults removeObjectForKey:Login_user_name];
//    [defaults removeObjectForKey:Login_user_sex];
//    [defaults removeObjectForKey:Login_isLogin];
//    [defaults removeObjectForKey:Login_password];//不清空，自动登录会用到
//    [defaults removeObjectForKey:@"system_numStr"];
//    [defaults removeObjectForKey:@"system_news_num"];
//    [defaults synchronize];
//}
//
//
//+ (void)removeLoginInfoAndJump;
//{
//    [self removeLoginInfo];
//    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    //自动跳转
//    delegate.customTabbarCtr.selectedIndex = 0;
//}
//
//+ (void)goBackToMineVC;
//{
//    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    //自动跳转到我的页面
//    delegate.customTabbarCtr.selectedIndex = 4;
//    [[NSNotificationCenter defaultCenter] postNotificationName:Notification_UpdateMineVCUserInfo object:self userInfo:nil];//修改我的页面
//}
//
//+ (NSString *)getCode;
//{
//    return Localized(@"获取验证码");
//}
//
//+ (NSString *)reGetCode;
//{
//    return Localized(@"重新获取");
//}
//
//+ (NSString *)reGetCode60S;
//{
//    
//    return [NSString stringWithFormat:@"%@ 60s", Localized(@"重新获取")];
//}
//
//+ (NSString *)miMaMake;
//{
//    return Localized(@"密码由6-20位字符组成");
//}
//
//+ (NSString *)shuRuShouJiHao;
//{
//    return Localized(@"请输入正确的8位手机号");
//}
//
////判断是在中国还是在老挝，返回的电话号码位数.中国返回11位，老挝返回8位
//+ (NSInteger)telephoneNum;
//{
//    NSInteger count = 11;
//    
//#if TELEPHONEINCHINA_SWITCH
//    count = 11;
//#else
//    count = 8;
//#endif
//    
//    return count;
//}
//
////设置购物车的数量
//+ (void)setShoppingCarCount:(NSString *)countStr
//{
//    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    NSInteger index = 3;
//    UINavigationController *navi = [delegate.customTabbarCtr.viewControllers objectAtIndex:index];
//    if (countStr.length > 0 && [countStr integerValue] > 99)
//    {
//        countStr = @"99";
//    }
//    [[navi rdv_tabBarItem] setBadgeValue:countStr];
//}
//
//#pragma mark-发送获取购物车数量的请求
//+ (void)sendGetShoppingCarCount;
//{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    if ([defaults objectForKey:Login_access_token]&&[defaults boolForKey:Login_isLogin]==YES)
//    {
//        NSDictionary *params=@{};
//        NSLog(@"GetCartNumAPI=%@",GetCartNumAPI);
//        [[APIClient sharedClient:nil] commonWith:GetCartNumAPI Params:params  success:^(NSURLSessionDataTask *operation, id responseObject)
//         {
//             NSDictionary *dict = responseObject;
//             NSLog(@"dict:%@", dict);
//             NSLog(@"resultMsg:%@", dict[@"resultMsg"]);
//             
//             if ([APIClient requestSuccess:dict[@"resultId"]] == 1)
//             {
//                 NSDictionary *resultDataDict = [dict[@"resultData"] objectFromJSONString];
//                 NSLog(@"resultDataDict:%@", resultDataDict);
//                 id cart_num = ([NSString isNullOrNilWithObj:resultDataDict[@"cart_num"]] == NO)?resultDataDict[@"cart_num"]:@"0";
//                 NSString *cart_numStr = [NSString stringWithFormat:@"%@", cart_num];
//                 NSLog(@"cart_numStr:%@", cart_numStr);
//                 [NSString setShoppingCarCount:cart_numStr];
//                 
////                 id system_num = ([NSString isNullOrNilWithObj:resultDataDict[@"system_message_num"]] == NO)?resultDataDict[@"system_message_num"]:@"0";
//                 NSString *system_numStr = [WorkOutWordsSize strToString:resultDataDict[@"system_message_num"]];
//                 [NSString setNewSystemNumCount:system_numStr];
//                 BOOL isNewOfficeMsg=[WorkOutWordsSize strToBool:resultDataDict[@"system_news_num"]];
//                 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//                 [defaults setObject:system_numStr forKey:@"system_numStr"];
//                 [defaults setBool:isNewOfficeMsg forKey:@"system_news_num"];
//                 [defaults synchronize];
//             }
//             else
//             {
//                 [NSString setShoppingCarCount:@"0"];
//                 [NSString setNewSystemNumCount:@"0"];
//                 BOOL isNewOfficeMsg=NO;
//                 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//                 [defaults setObject:@"0" forKey:@"system_numStr"];
//                 [defaults setBool:isNewOfficeMsg forKey:@"system_news_num"];
//                 [defaults synchronize];
//             }
//         }
//         
//                                         failure:^(NSURLSessionDataTask *openation, NSError *error)
//         {
//         }];
//    }
//}
//+ (void)setNewSystemNumCount:(NSString *)countStr{
//    NSLog(@"setNewSystemNumCount");
//    [[NSNotificationCenter defaultCenter] postNotificationName:showRedImgNum object:countStr];
//}
//+ (void)setNewOfficialMessage:(BOOL)isShow{
//    [[NSNotificationCenter defaultCenter] postNotificationName:upDataMessageTable object:nil];
//}
////判断是在中国还是在老挝，返回的电话号码位数.中国返回11位，老挝返回8位
//+ (BOOL)judgeTelephoneNum:(NSInteger)count;
//{
//    BOOL isRight = NO;
//    if (count==8 ||count==11)
//    {
//        isRight = YES;
//    }
//    return isRight;
//}
//
////判断当前设置的语言是不是简体中文，YES，是
//+ (BOOL)isSimpChinessEnvironment;
//{
//    BOOL isChiness = NO;
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults ];
//    // 取得 iPhone 支持的所有语言设置
//    NSArray *languages = [defaults objectForKey :@"AppleLanguages" ];
//    [defaults synchronize];
//    //    NSLog(@"languages：%@",languages);
//    //    NSLog(@"count：%ld",languages.count);
//    // 获得当前iPhone使用的语言
//    NSString* currentLanguage =[languages firstObject];
//    if ([currentLanguage rangeOfString:@"zh-Hans"].location != NSNotFound)
//    {
//        isChiness = YES;
//    }
//    else
//    {
//    }
//    return isChiness;
//}

@end
