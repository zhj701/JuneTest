//
//  UserDefault.h
//  Insurance
//
//  Created by June on 15/12/28.
//  Copyright © 2015年 June. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefault : NSObject
+(void)saveUserDefault:(NSString *)key andValue:(id)value;
+(id)getUserDefalut:(NSString *)key;


@end
