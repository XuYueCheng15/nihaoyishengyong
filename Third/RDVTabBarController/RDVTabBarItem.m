// RDVTabBarItem.h
// RDVTabBarController
//
// Copyright (c) 2013 Robert Dimitrov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "RDVTabBarItem.h"

@interface RDVTabBarItem () {
    NSString *_title;
    UIOffset _imagePositionAdjustment;
    NSDictionary *_unselectedTitleAttributes;
    NSDictionary *_selectedTitleAttributes;
}

@property UIImage *unselectedBackgroundImage;
@property UIImage *selectedBackgroundImage;
@property UIImage *unselectedImage;
@property UIImage *selectedImage;

@end

@implementation RDVTabBarItem

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInitialization];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInitialization];
    }
    return self;
}

- (id)init {
    return [self initWithFrame:CGRectZero];
}

- (void)commonInitialization {
    // Setup defaults
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    _title = @"";
    _titlePositionAdjustment = UIOffsetZero;
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        _unselectedTitleAttributes = @{
                                       NSFontAttributeName: [UIFont systemFontOfSize:12],
                                       NSForegroundColorAttributeName: RGBA(128, 128, 128, 1),
                                       };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        _unselectedTitleAttributes = @{
                                       UITextAttributeFont: [UIFont systemFontOfSize:12],
                                       UITextAttributeTextColor: RGBA(128, 128, 128, 1),
                                       };
#endif
    }
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        _selectedTitleAttributes = @{
                                       NSFontAttributeName: [UIFont systemFontOfSize:12],
                                       NSForegroundColorAttributeName: RGBA(255, 164, 0, 1),
                                       };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        _selectedTitleAttributes = @{
                                       UITextAttributeFont: [UIFont systemFontOfSize:12],
                                       UITextAttributeTextColor: RGBA(255, 164, 0, 1),
                                       };
#endif
    }
    
    //_selectedTitleAttributes = [_unselectedTitleAttributes copy];
    _badgeBackgroundColor = [UIColor redColor];
    _badgeTextColor = [UIColor whiteColor];
    _badgeTextFont = [UIFont systemFontOfSize:12];
    _badgePositionAdjustment = UIOffsetZero;
    
    //自己加的
    CGRect frame = CGRectMake(SCREEN_WIDTH/5 / 2 + ((20 / 2) * 0.5), 2, 16, [WorkOutWordsSize countDeviceFloat:16]);
    self.badgeLabel = [[UILabel alloc] initWithFrame:frame];
    self.badgeLabel.textColor = [UIColor whiteColor];
    self.badgeLabel.font = [WorkOutWordsSize fontSize:13 isbold:NO];
    self.badgeLabel.backgroundColor = [UIColor colorWithHexString:@"ff496b"];
//    self.badgeLabel.text = @"1";
    self.badgeLabel.textAlignment = NSTextAlignmentCenter;
    self.badgeLabel.layer.cornerRadius=[WorkOutWordsSize countDeviceFloat:16]/2;
    self.badgeLabel.layer.masksToBounds=YES;
    [self addSubview:self.badgeLabel];
    self.badgeLabel.hidden = YES;
    [self bringSubviewToFront:self.badgeLabel];
}

- (void)drawRect:(CGRect)rect
{
    CGSize frameSize = self.frame.size;
    CGSize imageSize = CGSizeZero;
    CGSize titleSize = CGSizeZero;
    NSDictionary *titleAttributes = nil;
    UIImage *backgroundImage = nil;
    UIImage *image = nil;
    CGFloat imageStartingY = 0.0f;
    
    if ([self isSelected])
    {
        image = [self selectedImage];
        backgroundImage = [self selectedBackgroundImage];
        titleAttributes = [self selectedTitleAttributes];
        
        if (!titleAttributes)
        {
            titleAttributes = [self unselectedTitleAttributes];
        }
    }
    else
    {
        image = [self unselectedImage];
        backgroundImage = [self unselectedBackgroundImage];
        titleAttributes = [self unselectedTitleAttributes];
    }
    
    imageSize = [image size];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    [backgroundImage drawInRect:self.bounds];
    
    // Draw image and title
    
    if (![_title length])
    {
        [image drawInRect:CGRectMake(roundf(frameSize.width / 2 - imageSize.width / 2) +
                                     _imagePositionAdjustment.horizontal,
                                     roundf(frameSize.height / 2 - imageSize.height / 2) +
                                     _imagePositionAdjustment.vertical,
                                     imageSize.width, imageSize.height)];
    }
    
    else
    {
        if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1)
        {
            //自己改的地方
            CGFloat titleWidth = [WorkOutWordsSize calculateSizeWithString:_title Font:[UIFont systemFontOfSize:10] MaxWidth:CGFLOAT_MAX MaxHeight:CGFLOAT_MAX].width;
            CGFloat titleHeight = [WorkOutWordsSize calculateSizeWithString:_title Font:[UIFont systemFontOfSize:10] MaxWidth:CGFLOAT_MAX MaxHeight:CGFLOAT_MAX].height;
            titleSize = CGSizeMake(titleWidth, titleHeight);
            //自己改的地方
//            titleSize = [_title boundingRectWithSize:CGSizeMake(frameSize.width, 20)
//                                                    options:NSStringDrawingUsesLineFragmentOrigin
//                                                 attributes:titleAttributes
//                                                    context:nil].size;
            
//            imageStartingY = roundf((frameSize.height - imageSize.height - titleSize.height) / 2);
            imageStartingY = 7.5;//根据UI图改的
//            NSLog(@"imageSize.width:%f", imageSize.width);
//            NSLog(@"imageSize.height:%f", imageSize.height);
//            
//            NSLog(@"_imagePositionAdjustment.horizontal:%f", _imagePositionAdjustment.horizontal);
//            NSLog(@"_imagePositionAdjustment.vertical:%f", _imagePositionAdjustment.vertical);
//            
//            NSLog(@"_titlePositionAdjustment.horizontal:%f", _titlePositionAdjustment.horizontal);
//            NSLog(@"_titlePositionAdjustment.vertical:%f", _titlePositionAdjustment.vertical);
            [image drawInRect:CGRectMake(roundf(frameSize.width / 2 - imageSize.width / 2) +
                                         _imagePositionAdjustment.horizontal,
                                         imageStartingY + _imagePositionAdjustment.vertical,
                                         imageSize.width, imageSize.height)];
            
            CGContextSetFillColorWithColor(context, [titleAttributes[NSForegroundColorAttributeName] CGColor]);
            
            [_title drawInRect:CGRectMake(roundf(frameSize.width / 2 - titleSize.width / 2) +
                                          _titlePositionAdjustment.horizontal,
                                          imageStartingY + imageSize.height + _titlePositionAdjustment.vertical+4.5,
                                          titleSize.width, titleSize.height)
                withAttributes:titleAttributes];
        }
        else
        {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
            titleSize = [_title sizeWithFont:titleAttributes[UITextAttributeFont]
                           constrainedToSize:CGSizeMake(frameSize.width, 20)];
            UIOffset titleShadowOffset = [titleAttributes[UITextAttributeTextShadowOffset] UIOffsetValue];
            imageStartingY = roundf((frameSize.height - imageSize.height - titleSize.height) / 2);
            
            [image drawInRect:CGRectMake(roundf(frameSize.width / 2 - imageSize.width / 2) +
                                         _imagePositionAdjustment.horizontal,
                                         imageStartingY + _imagePositionAdjustment.vertical,
                                         imageSize.width, imageSize.height)];
            
            CGContextSetFillColorWithColor(context, [titleAttributes[UITextAttributeTextColor] CGColor]);
            
            UIColor *shadowColor = titleAttributes[UITextAttributeTextShadowColor];
            
            if (shadowColor)
            {
                CGContextSetShadowWithColor(context, CGSizeMake(titleShadowOffset.horizontal, titleShadowOffset.vertical),
                                            1.0, [shadowColor CGColor]);
            }
            
            [_title drawInRect:CGRectMake(roundf(frameSize.width / 2 - titleSize.width / 2) +
                                          _titlePositionAdjustment.horizontal,
                                          imageStartingY + imageSize.height + _titlePositionAdjustment.vertical,
                                          titleSize.width, titleSize.height)
                      withFont:titleAttributes[UITextAttributeFont]
                 lineBreakMode:NSLineBreakByTruncatingTail];
#endif
        }
    }
    
    // Draw badges
    NSInteger length = [self badgeValue].length;
    NSInteger value = [[self badgeValue] integerValue];
    CGRect frame = self.badgeLabel.frame;
    if (length == 0 || value<=0)
    {
        self.badgeLabel.hidden = YES;
    }
    else
    {
        self.badgeLabel.hidden = NO;
    }
    
    if (1<=value&&value<=9)
    {
        frame.size.width =[WorkOutWordsSize countDeviceFloat:16];
//        cell.redPayLabWidth.constant = [WorkOutWordsSize countDeviceFloat:16];
    }
    else if (9<value&&value<=99)
    {
        frame.size.width =[WorkOutWordsSize countDeviceFloat:22.5];
//        cell.redPayLabWidth.constant = [WorkOutWordsSize countDeviceFloat:22.5];
    }
    self.badgeLabel.frame = frame;
//    else if (value>99)
//    {
//        iPayNum = @"99";
//        cell.redPayLabWidth.constant = [WorkOutWordsSize countDeviceFloat:22.5];
//    }
    self.badgeLabel.text = [self badgeValue];
    
//
//    if ([[self badgeValue] length])
//    {
//        CGSize badgeSize = CGSizeZero;
//        
//        if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1)
//        {
//            badgeSize = [_badgeValue boundingRectWithSize:CGSizeMake(frameSize.width, 20)
//                                                  options:NSStringDrawingUsesLineFragmentOrigin
//                                               attributes:@{NSFontAttributeName: [self badgeTextFont]}
//                                                  context:nil].size;
//        }
//        else
//        {
//#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
//            badgeSize = [_badgeValue sizeWithFont:[self badgeTextFont]
//                                constrainedToSize:CGSizeMake(frameSize.width, 20)];
//#endif
//        }
//        
//        CGFloat textOffset = 2.0f;
//        
//        if (badgeSize.width < badgeSize.height)
//        {
//            badgeSize = CGSizeMake(badgeSize.height, badgeSize.height);
//        }
//        
//        CGRect badgeBackgroundFrame = CGRectMake(roundf(frameSize.width / 2 + (image.size.width / 2) * 0.9) +
//                                                 [self badgePositionAdjustment].horizontal,
//                                                 textOffset + [self badgePositionAdjustment].vertical,
//                                                 badgeSize.width + 2 * textOffset, badgeSize.height + 2 * textOffset);
//        
//        if ([self badgeBackgroundColor])
//        {
//            CGContextSetFillColorWithColor(context, [[self badgeBackgroundColor] CGColor]);
//            
//            CGContextFillEllipseInRect(context, badgeBackgroundFrame);
//        }
//        else if ([self badgeBackgroundImage])
//        {
//            [[self badgeBackgroundImage] drawInRect:badgeBackgroundFrame];
//        }
//        
//        CGContextSetFillColorWithColor(context, [[self badgeTextColor] CGColor]);
//        
//        if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1)
//        {
//            NSMutableParagraphStyle *badgeTextStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
//            [badgeTextStyle setLineBreakMode:NSLineBreakByWordWrapping];
//            [badgeTextStyle setAlignment:NSTextAlignmentCenter];
//            
//            NSDictionary *badgeTextAttributes = @{
//                                                  NSFontAttributeName: [self badgeTextFont],
//                                                  NSForegroundColorAttributeName: [self badgeTextColor],
//                                                  NSParagraphStyleAttributeName: badgeTextStyle,
//                                                  };
//            
//            [[self badgeValue] drawInRect:CGRectMake(CGRectGetMinX(badgeBackgroundFrame) + textOffset,
//                                                     CGRectGetMinY(badgeBackgroundFrame) + textOffset,
//                                                     badgeSize.width, badgeSize.height)
//                withAttributes:badgeTextAttributes];
//        }
//        else
//        {
//#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
//            [[self badgeValue] drawInRect:CGRectMake(CGRectGetMinX(badgeBackgroundFrame) + textOffset,
//                                                     CGRectGetMinY(badgeBackgroundFrame) + textOffset,
//                                                     badgeSize.width, badgeSize.height)
//                                 withFont:[self badgeTextFont]
//                            lineBreakMode:NSLineBreakByTruncatingTail
//                                alignment:NSTextAlignmentCenter];
//#endif
//        }
//    }
    
    CGContextRestoreGState(context);
}

#pragma mark - Image configuration

- (UIImage *)finishedSelectedImage {
    return [self selectedImage];
}

- (UIImage *)finishedUnselectedImage {
    return [self unselectedImage];
}

- (void)setFinishedSelectedImage:(UIImage *)selectedImage withFinishedUnselectedImage:(UIImage *)unselectedImage {
    if (selectedImage && (selectedImage != [self selectedImage])) {
        [self setSelectedImage:selectedImage];
    }
    
    if (unselectedImage && (unselectedImage != [self unselectedImage])) {
        [self setUnselectedImage:unselectedImage];
    }
}

- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = badgeValue;
    
    [self setNeedsDisplay];
}

#pragma mark - Background configuration

- (UIImage *)backgroundSelectedImage {
    return [self selectedBackgroundImage];
}

- (UIImage *)backgroundUnselectedImage {
    return [self unselectedBackgroundImage];
}

- (void)setBackgroundSelectedImage:(UIImage *)selectedImage withUnselectedImage:(UIImage *)unselectedImage {
    if (selectedImage && (selectedImage != [self selectedBackgroundImage])) {
        [self setSelectedBackgroundImage:selectedImage];
    }
    
    if (unselectedImage && (unselectedImage != [self unselectedBackgroundImage])) {
        [self setUnselectedBackgroundImage:unselectedImage];
    }
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
