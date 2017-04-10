//
//  WorkOutWordsSize.m
//  StoreStreet
//
//  Created by apple on 15/7/5.
//  Copyright (c) 2015年 xmfish. All rights reserved.
//

#import "WorkOutWordsSize.h"

#define isiPhone6 ([[UIScreen mainScreen] bounds].size.height == 667)
#define isiPhone6P ([[UIScreen mainScreen] bounds].size.height >= 736)

@implementation WorkOutWordsSize

+ (CGSize)calculateSizeWithString:(NSString *)string Font:(UIFont *)font MaxWidth:(CGFloat)width MaxHeight:(CGFloat)height
{
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
//    label.text = string;
//    label.font = font;
//    label.numberOfLines = 0;
//    [label sizeToFit];
//    CGSize size;
//    size.width=label.frame.size.width;
//    size.height=label.frame.size.height;
    NSDictionary *dic = @{NSFontAttributeName:font};
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size;
}
//+ (CGSize)calculateLabSizeWithString:(NSString *)string Font:(UIFont *)font MaxWidth:(CGFloat)width MaxHeight:(CGFloat)height{
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
//        label.attributedText = [[EaseEmotionEscape sharedInstance] attstringFromTextForChattingMy:string textFont:font];
//        label.font = font;
//        label.numberOfLines = 0;
//        [label sizeToFit];
//        CGSize size;
//        size.width=label.frame.size.width;
//        size.height=label.frame.size.height;
//    return size;
//}
+ (CGFloat)deviceFloat:(CGFloat)size{
    CGFloat newSize;
    if (isiPhone6) {
        newSize=size*SCREEN_WIDTH/750;
    }
    else if(isiPhone6P){
        newSize=size*SCREEN_WIDTH/828;
    }else if(SCREEN_WIDTH==320){
        newSize=size*SCREEN_WIDTH/640;
    }
    return newSize;
}
//这个可以写到通用类里面去，不用每一次都写
+ (CGFloat)deviceFontOfSize:(CGFloat)size
{
    if (size==0) {
        return 0;
    }
    if (isiPhone6)
    {
    }
    else if (isiPhone6P)
    {
        size = size*1.2;
    }
    else
    {
        size = size*0.8;
    }
    return size;
}
+ (CGFloat)roundedCorners:(CGFloat)size{
    if (isiPhone6)
    {
    }
    else if (isiPhone6P)
    {
        size = size*1.2;
    }
    else
    {
        size = size*0.8;
    }
    return size;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
+ (BOOL)isDicNull:(id)date{
    bool isbNull;
    if (date && ![date isEqual:[NSNull null]]) {
        isbNull=YES;
    }else{
        isbNull=NO;
    }
    return isbNull;
    
}

+ (NSString *) strToString:(id)str {
    if (str && ![str isEqual:[NSNull null]]) {
        return [NSString stringWithFormat:@"%@",str];
    }
    return @"";
}
+ (int)strToInt:(id)str{
    if (str && ![str isEqual:[NSNull null]]) {
        return [[NSString stringWithFormat:@"%@",str] intValue];
    }
    return 0;
}
+ (BOOL)strToBool:(id)str{
    if (str && ![str isEqual:[NSNull null]]) {
        return [[NSString stringWithFormat:@"%@",str] boolValue];
    }
    return NO;
}
+ (CGFloat)strToFloat:(id)str{
    if (str && ![str isEqual:[NSNull null]]) {
        NSLog(@"str=%@",str);
        CGFloat gold=[[NSString stringWithFormat:@"%@",str] floatValue];
        NSLog(@"gold=%f",gold);
        return [[NSString stringWithFormat:@"%@",str] floatValue];
    }
    return 0.0f;
}
+ (UIFont *)fontSize:(CGFloat)size isbold:(BOOL) isYse{

    if (isiPhone6)
    {
    }
    else if (isiPhone6P)
    {
        size = size*1.2;
    }
    else
    {
        size = size*0.8;
    }
    UIFont *font;
    if (isYse) {
        font=[UIFont boldSystemFontOfSize:size];
//        font=[UIFont fontWithName:@"SaysetthaOT-Bold" size:size];
    }else{
        font=[UIFont systemFontOfSize:size];
//        font=[UIFont fontWithName:@"SaysetthaOT" size:size];
    }
    
    return font;
}
//+ (UIFont *)fontZTSize:(CGFloat)size isbold:(BOOL) isYse{
//    if ([NSString isSimpChinessEnvironment] == YES)
//    {
//    }
//    else
//    {
//        size+=2;
//    }
////    if (ISCHINEEE_SWITCH==0) {
////        size+=2;
////    }
//    if (isiPhone6)
//    {
//    }
//    else if (isiPhone6P)
//    {
//        size = size*1.2;
//    }
//    else
//    {
//        size = size*0.8;
//    }
//    UIFont *font;
//    if (isYse) {
//        font=[UIFont boldSystemFontOfSize:size];
//    }else{
//        font=[UIFont systemFontOfSize:size];
//    }
//    
//    return font;
//}
+ (UIFont *)NofontSize:(CGFloat)size isbold:(BOOL) isYse{
    UIFont *font;
    if (isYse) {
        font=[UIFont fontWithName:@"SaysetthaOT-Bold" size:size];
    }else{
        font=[UIFont fontWithName:@"SaysetthaOT" size:size];
    }
//    if (isYse) {
//        font=[UIFont boldSystemFontOfSize:size];
//    }else{
//        font=[UIFont systemFontOfSize:size];
//    }
    
    return font;
}

//获取一个随机整数，范围在[from,to），包括from，不包括to
+ (int)getRandomNumber:(int)from to:(int)to {
    
    return (int)(from + (arc4random() % (to - from + 1)));
}

+(NSString *)getNetWorkStates{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
    NSString *state = [[NSString alloc]init];
    int netType = 0;
    //获取到网络返回码
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏
            netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
            
            switch (netType) {
                case 0:
                    state = @"无网络";
                    //无网模式
                    break;
                case 1:
                    state = @"2G";
                    break;
                case 2:
                    state = @"3G";
                    break;
                case 3:
                    state = @"4G";
                    break;
                case 5:
                {
                    state = @"WIFI";
                }
                    break;
                default:
                    break;
            }
        }
    }
    //根据状态选择
    return state;
}

+(NSString *)HoursTime:(NSString *)timeC{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"HH"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeC intValue]];
    NSString *currentDateStr = [formatter stringFromDate:date];
    return currentDateStr;
}
+(UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, image.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}
+(NSString *)countNumAndChangeformat:(NSString *)strMomey
{
    int momey=[strMomey intValue];
    NSString *num=[NSString stringWithFormat:@"%d",momey];
    int count = 0;
    long long int a = num.longLongValue;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    NSMutableString *string = [NSMutableString stringWithString:num];
    NSMutableString *newstring = [NSMutableString string];
    while (count > MomeyChange) {
        count -= MomeyChange;
        NSRange rang = NSMakeRange(string.length - MomeyChange, MomeyChange);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"," atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    NSString *strMomey1=[NSString stringWithFormat:@"%@%@",newstring,MoneySuffix];
    return strMomey1;
}

+(NSString *)countNum:(NSString *)strMomey;
{
    int momey=[strMomey intValue];
    NSString *num=[NSString stringWithFormat:@"%d",momey];
    int count = 0;
    long long int a = num.longLongValue;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    NSMutableString *string = [NSMutableString stringWithString:num];
    NSMutableString *newstring = [NSMutableString string];
    while (count > MomeyChange) {
        count -= MomeyChange;
        NSRange rang = NSMakeRange(string.length - MomeyChange, MomeyChange);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"," atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    return newstring;
}
+(NSString *)countNumDian:(NSString *)strMomey;
{
    int momey=[strMomey intValue];
    NSString *num=[NSString stringWithFormat:@"%d",momey];
    int count = 0;
    long long int a = num.longLongValue;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    NSMutableString *string = [NSMutableString stringWithString:num];
    NSMutableString *newstring = [NSMutableString string];
    while (count > MomeyChange) {
        count -= MomeyChange;
        NSRange rang = NSMakeRange(string.length - MomeyChange, MomeyChange);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"," atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    return newstring;
}

+ (CGFloat)countDeviceFloat:(CGFloat)size;
{
    CGFloat newSize;
    newSize=size*SCREEN_WIDTH/375;
    return newSize;
}

@end
