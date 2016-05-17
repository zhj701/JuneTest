//
//  GHAlertView.m
//  ZoomImageDemo
//
//  Created by June on 2/21/14.
//  Copyright (c) 2014 June. All rights reserved.
//

#import "GHAlertView.h"

@implementation GHAlertView


+ (void) showAlertViewWithMessage:(NSString*) message
                cancelButtonTitle:(NSString*) cancelButtonTitle
                otherButtonTitles:(NSArray*) otherButtons
                        onDismiss:(alertDismissBlock)dismissed
                          onCaenl:(alertCancelBlock)cancelled{
    UIAlertController *contrl =[UIAlertController alertControllerWithTitle:@"JunePush" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        if (cancelled) {
            cancelled();
        }
    }];
    
    [contrl addAction:cancelAction];
    
    for (int i = 0 ; i < otherButtons.count; i ++) {
        NSString *string = otherButtons[i];
        UIAlertAction *aAction = [UIAlertAction actionWithTitle:string style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            if (dismissed) {
                dismissed(i);
            }
        }];
        [contrl addAction:aAction];
    }
    
    [[[[[UIApplication sharedApplication] delegate] window]rootViewController] presentViewController:contrl animated:YES completion:nil];
}

@end
