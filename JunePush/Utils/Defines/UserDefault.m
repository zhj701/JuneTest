//
//  UserDefault.m
//  Insurance
//
//  Created by June on 15/12/28.
//  Copyright © 2015年 June. All rights reserved.
//

#import "UserDefault.h"

@implementation UserDefault
+(void)saveUserDefault:(NSString *)key andValue:(id)value{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}

+(id)getUserDefalut:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}

@end
