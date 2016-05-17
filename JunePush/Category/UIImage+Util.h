//
//  UIImage+Util.h
//  Insurance
//
//  Created by June on 16/1/5.
//  Copyright © 2016年 June. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Util)
+(UIImage *)imageNamed1:(NSString *)name1 andImageName2:(NSString *)name2;
+(UIImage*)imageWithColor:(UIColor*) color;
-(UIImage*)imageWithscaleToSize:(CGSize)size;
@end
