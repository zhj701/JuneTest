//
//  CustomURLRequest.h
//  Insurance
//
//  Created by June on 16/1/29.
//  Copyright © 2016年 June. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kTimeOutInterval                60

@protocol ConnectionDelegate <NSObject>
@optional - (void)onSuccess:(id)data andTask:(NSURLSessionDataTask *)task;
@optional - (void)onError:(NSString *)errorString;
@optional - (void)onOverdueToken;

typedef enum {
    POST = 101,
    GET,
    PUT,
    DELETE
}RequestMethods;
@end

@interface ObserverTask : NSObject
@property (nonatomic,strong) NSURLSessionDataTask *task;
@property (nonatomic, weak) id<ConnectionDelegate> delegate;
@end

@interface CustomURLRequest : NSObject
@property (nonatomic, weak) id<ConnectionDelegate> delegate;
+ (void)connectWithURL:(NSString *)url
        bodyDictionary:(NSDictionary *)dic
               methods:(RequestMethods)methods
              delegate:(id<ConnectionDelegate>)delegate;

@end
