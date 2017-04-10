//
//  UIColor+hexColor.h
//  MobileStore
//
//  Created by RTJiang on 13-5-30.
//  Copyright (c) 2013年 yunpos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (hexColor)

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;


+ (UIColor *) colorWithHexString: (NSString *) stringToConvert Alpha:(CGFloat) alpha;

@end
