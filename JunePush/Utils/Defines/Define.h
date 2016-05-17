//
//  Define.h
//  Insurance
//
//  Created by June on 15/12/29.
//  Copyright © 2015年 June. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

#define PATH_OF_DATABASE    [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"dataBase.sqlite"]
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define DOC_OF_DATABASE     [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"dataBase.sqlite"]

#define Alert(msg) [GHAlertView showAlertViewWithMessage:msg cancelButtonTitle:@"OK" otherButtonTitles:nil onDismiss:nil onCaenl:nil]


#define DegreesToRadians(degrees)       (degrees * M_PI / 180)
#define RadiansToDegrees(radians)       (radians * 180/M_PI)
#define CvtToMile(float)    (float / 1.609344)
#define CvtFromMile(float)  (float * 1.609344)

#define ALLOW_INPUT_EMAIL_CHARACHER @"1234567890~!@$￥%……&*()- ——_+={}|:""<>?[].`/'\\abcdefghijklmnopqrstuvwxzyABCDEFGHIJKLMNOPQRSTUVWXYZ"

#define ALLOW_INPUT_NAME_STRING @"abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789."


#define REGULAR_COLOR                          [UIColor colorWithHexString:@"#005eae"]
#define REGULAR_BACKGROUND_COLOR               [UIColor colorWithHexString:@"#e6e6e6"]
#define REGULAR_FONT_COLOR                     [UIColor colorWithHexString:@"#404040"]

#define OBLIQUE_FONT(float)          [UIFont fontWithName:@"Helvetica-Oblique" size:float]
#define OBLIQUE_BOLD_FONT(float)     [UIFont fontWithName:@"Helvetica-BoldOblique" size:float]
#define BOLD_FONT(float)             [UIFont fontWithName:@"HelveticaNeue-Bold" size:float]
#define REGULAR_FONT(float)          [UIFont fontWithName:@"HelveticaNeue" size:float]

typedef enum {
    PROFILE_EDIT = 101,
    PAYMENT_EDIT
}EditBtn_Type;


#endif /* Define_h */
