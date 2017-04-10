//
//  WorkOutWordsSize.h
//  StoreStreet
//
//  Created by apple on 15/7/5.
//  Copyright (c) 2015年 xmfish. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MoneySuffix @"LAK"
#define MomeyChange 3
@interface WorkOutWordsSize : NSObject

+ (CGSize)calculateSizeWithString:(NSString *)string Font:(UIFont *)font MaxWidth:(CGFloat)width MaxHeight:(CGFloat)height;
//+ (CGSize)calculateLabSizeWithString:(NSString *)string Font:(UIFont *)font MaxWidth:(CGFloat)width MaxHeight:(CGFloat)height;
+ (CGFloat)deviceFloat:(CGFloat)size;
+ (CGFloat)deviceFontOfSize:(CGFloat)size;
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (CGFloat)roundedCorners:(CGFloat)size;
+ (BOOL)isDicNull:(id)date;
+ (NSString *) strToString:(id)str;
+ (int)strToInt:(id)str;
+ (BOOL)strToBool:(id)str;
+ (CGFloat)strToFloat:(id)str;
+ (UIFont *)fontSize:(CGFloat)size isbold:(BOOL) isYse;
//+ (UIFont *)fontZTSize:(CGFloat)size isbold:(BOOL) isYse;
+ (UIFont *)NofontSize:(CGFloat)size isbold:(BOOL) isYse;
+ (int)getRandomNumber:(int)from to:(int)to;
+(NSString *)getNetWorkStates;
+(NSString *)HoursTime:(NSString *)timeC;
+(UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;
+(NSString *)countNumAndChangeformat:(NSString *)strMomey;
+(NSString *)countNum:(NSString *)strMomey;
+(NSString *)countNumDian:(NSString *)strMomey;

+ (CGFloat)countDeviceFloat:(CGFloat)size;

@end
