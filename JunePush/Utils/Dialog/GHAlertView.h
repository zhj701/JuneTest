//
//  GHAlertView.h
//  ZoomImageDemo
//
//  Created by June on 2/21/14.
//  Copyright (c) 2014 June. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^alertDismissBlock)(NSInteger index);
typedef void (^alertCancelBlock)();

@interface GHAlertView : NSObject

+ (void) showAlertViewWithMessage:(NSString*) message
                cancelButtonTitle:(NSString*) cancelButtonTitle
                otherButtonTitles:(NSArray*) otherButtons
                        onDismiss:(alertDismissBlock)dismissed
                          onCaenl:(alertCancelBlock)cancelled;

@end
