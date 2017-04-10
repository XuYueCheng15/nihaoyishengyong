//
//  NSString+Extension.h
//  NeeStore
//
//  Created by ChenRongQin on 16/8/16.
//  Copyright © 2016年 XYC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

//+ (NSString *)getLaoWithChiness:(NSString *)chinessStr;
//
///**
// *  返回中文或者老挝文
// *
// *  @param chinessStr <#chinessStr description#>
// *  @param laoWoStr   <#laoWoStr description#>
// *
// *  @return <#return value description#>
// */
//+ (NSString *)chinessOrLaoWoWith:(NSString *)chinessStr lao:(NSString *)laoWoStr;



+ (NSString *) md5: (NSString *) inPutText;

//将字典转为JSON字符串
+ (NSString *)dicToJsonString:(NSDictionary *)dic;


////判断某个对象是否是空对象或空指针.YES,表示是空对象或空指针
//+ (BOOL)isNullOrNilWithObj:(id)obj;
//
//+ (void)removeLoginInfo;
//
//+ (void)removeLoginInfoAndJump;
//
//+ (void)goBackToMineVC;
//
//
//
//+ (NSString *)getCode;
//
//+ (NSString *)reGetCode;
//
//+ (NSString *)reGetCode60S;
//
//+ (NSString *)miMaMake;
////请输入正确的8位手机号
//+ (NSString *)shuRuShouJiHao;
//
//
////判断是在中国还是在老挝，返回的电话号码位数.中国返回11位，老挝返回8位
//+ (NSInteger)telephoneNum;
//
//
////设置购物车的数量
//+ (void)setShoppingCarCount:(NSString *)countStr;
//
////发送获取购物车数量的请求
//+ (void)sendGetShoppingCarCount;
//
////判断是在中国还是在老挝，返回的电话号码位数.中国返回11位，老挝返回8位
//+ (BOOL)judgeTelephoneNum:(NSInteger)count;
//
////判断当前设置的语言是不是简体中文，YES，是
//+ (BOOL)isSimpChinessEnvironment;

@end
