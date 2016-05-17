//
//  AppDelegate.m
//  JunePush
//
//  Created by June on 16/4/19.
//  Copyright © 2016年 June. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePageVC.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    application.applicationIconBadgeNumber = 0;
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    NSDictionary *dic = [UserDefault getUserDefalut:@"userInfo"];
    ViewController *vc;
    if (dic.allKeys.count) {
        vc = [HomePageVC new];
    }
    else{
        vc = [ViewController new];
    }

    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    [self registerRemoveNoti:application];
    [Fabric with:@[[Crashlytics class]]];
    return YES;
}

- (void)registerRemoveNoti:(UIApplication *)application{
    UIUserNotificationType type = UIUserNotificationTypeBadge |
                                    UIUserNotificationTypeAlert |
                                    UIUserNotificationTypeSound;
    
    UIUserNotificationSettings *s =[UIUserNotificationSettings
                                    settingsForTypes:type
                                    categories:nil];
    
    [application registerUserNotificationSettings:s];
    [application registerForRemoteNotifications];
}

#pragma mark - NotificationDelegate
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSString *decToken = [NSString stringWithFormat:@"%@", deviceToken];
     //获取到之后要去掉尖括号和中间的空格
    NSMutableString *st = [NSMutableString stringWithString:decToken];
    [st deleteCharactersInRange:NSMakeRange(0, 1)];
    [st deleteCharactersInRange:NSMakeRange(st.length-1, 1)];
    NSString *string1 = [st stringByReplacingOccurrencesOfString:@" " withString:@""];
    //保存到本地
    [UserDefault saveUserDefault:@"deviceToken" andValue:string1];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"%@",[error localizedDescription]);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    NSLog(@"Receive remote notification : %@",userInfo);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
