//
//  UIImage+Util.m
//  Insurance
//
//  Created by June on 16/1/5.
//  Copyright © 2016年 June. All rights reserved.
//

#import "UIImage+Util.h"

@implementation UIImage (Util)
+(UIImage *)imageNamed1:(NSString *)name1 andImageName2:(NSString *)name2{
    UIImage *image1 = [UIImage imageNamed:name1];
    UIImage *image2 = [UIImage imageNamed:name2];
    
    CGSize size = CGSizeMake(image1.size.width,image1.size.height);
    UIGraphicsBeginImageContext(size);
    [image1 drawInRect:CGRectMake(0, 0, image1.size.width, image1.size.height)];
    CGFloat startX = (image1.size.width - image2.size.width) / 2;
    [image2 drawInRect:CGRectMake(startX, 7, image2.size.width, image2.size.height)];
    UIImage *togetherImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return togetherImage;
}
+ (UIImage*)imageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
-(UIImage*)imageWithscaleToSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}
@end
