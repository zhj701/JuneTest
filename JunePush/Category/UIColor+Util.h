//
//  UIColor+Util.h
//  CNDBS
//
//  Created by June on 3/11/14.
//  Copyright (c) 2014 June. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (BOOL) isTheSameColor2:(UIColor*)color1 anotherColor:(UIColor*)color2;
@end
