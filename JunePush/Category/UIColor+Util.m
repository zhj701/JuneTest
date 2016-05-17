//
//  UIColor+Util.m
//  CNDBS
//
//  Created by June on 3/11/14.
//  Copyright (c) 2014 June. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert {
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor whiteColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+ (BOOL) isTheSameColor2:(UIColor*)color1 anotherColor:(UIColor*)color2
{
    if (CGColorEqualToColor(color1.CGColor, color2.CGColor)) {
        return YES;
    }
    else {
        return NO;
    }
}
@end
