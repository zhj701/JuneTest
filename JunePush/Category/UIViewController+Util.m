//
//  UIViewController+Util.m
//  Insurance
//
//  Created by June on 15/12/25.
//  Copyright © 2015年 June. All rights reserved.
//

#import "UIViewController+Util.h"
#import <objc/runtime.h>


@implementation UIViewController (Util)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
        Method customLoad = class_getInstanceMethod(self, @selector(CustomMethod));
        method_exchangeImplementations(viewDidLoad, customLoad);
    });

}

-(void)CustomMethod{
    [self CustomMethod];
//    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navTitle"]];
//    self.navigationItem.titleView = imgView;
//    
//    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
//    self.navigationController.navigationBar.tintColor = [UIColor colorWithHexString:@"#b9b9b9"];
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    if (!SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

@end
