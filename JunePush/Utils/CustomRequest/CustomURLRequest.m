//
//  CustomURLRequest.m
//  Insurance
//
//  Created by June on 16/1/29.
//  Copyright © 2016年 June. All rights reserved.
//

#import "CustomURLRequest.h"
#import "UserDefault.h"
#import <objc/runtime.h>

const static char *kAssociatedConection = "AssociatedConection";

@implementation ObserverTask
- (void)setDelegate:(id<ConnectionDelegate>)delegate {
    if(delegate == _delegate) {
        return;
    }
    if(_delegate) {
        [self cleanObjcAssociate];
    }
    _delegate = delegate;
    
    if(_delegate) {
        NSMutableArray *connections = objc_getAssociatedObject(_delegate, kAssociatedConection);
        
        if(!connections || ![connections isKindOfClass:[NSMutableArray class]]) {
            connections = [[NSMutableArray alloc] initWithCapacity:1];
            
            objc_setAssociatedObject(_delegate, kAssociatedConection, connections, OBJC_ASSOCIATION_RETAIN);
            
        }
        
        @synchronized(connections) {
            [connections addObject:self];
        }
    }
}

- (void)cleanObjcAssociate {
    @synchronized(self) {
        if(_delegate) {
            NSMutableArray *connections = objc_getAssociatedObject(_delegate, kAssociatedConection);
            
            if(connections && [connections isKindOfClass:[NSMutableArray class]]) {
                @synchronized(connections) {
                    [connections removeObject:self];
                }
            }
        }
    }
}

- (void)dealloc{
    if (_task) {
        [_task cancel];
    }
    _delegate = nil;
}
@end

@implementation CustomURLRequest
- (NSURLSessionDataTask *)connectWithHttps:(NSString *)urlString
              andMethods:(RequestMethods)methods
          bodyDictionary:(NSDictionary *)bodyDic{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    serializer.timeoutInterval = kTimeOutInterval;
    UIApplication *application = [UIApplication sharedApplication];
    application.networkActivityIndicatorVisible = YES;
    
    if (!([urlString isEqualToString:REGISTER] &&
          [urlString isEqualToString:LOGIN])) {
        [serializer setValue:@"abc"
          forHTTPHeaderField:@"user_token"];
        sessionManager.requestSerializer = serializer;
    }
    
    void (^successBlock)(NSURLSessionDataTask *task,id aData) =
    ^(NSURLSessionDataTask *task,id aData){
        application.networkActivityIndicatorVisible = NO;
        if ([aData[@"code"] integerValue] == 200) {
            if (_delegate && [_delegate respondsToSelector:@selector(onSuccess:andTask:)]) {
                [_delegate onSuccess:aData[@"data"] andTask:task];
            }
        }
        else{
            if (_delegate && [_delegate respondsToSelector:@selector(onError:)]) {
                [_delegate onError:aData[@"info"]];
            }
        }
    };
    
    void (^failureBlock)(NSURLSessionDataTask *task,NSError *aError) =
    ^(NSURLSessionDataTask *task,NSError *aError){
        application.networkActivityIndicatorVisible = NO;
        if (_delegate && [_delegate respondsToSelector:@selector(onError:)]) {
            [_delegate onError:[aError localizedDescription]];
        }
    };
    
    if (methods == POST) {
        return  [sessionManager POST:urlString
                          parameters:bodyDic
                           progress:nil
                            success:^(NSURLSessionDataTask *task,id aData){
                                successBlock(task,aData);
                            }
                             failure:^(NSURLSessionDataTask *task,NSError *aError){
                                 failureBlock(task,aError);
                             }
                 ];
    }
    else if (methods == PUT){
        return  [sessionManager PUT:urlString
                         parameters:bodyDic
                            success:^(NSURLSessionDataTask *task,id aData){
                                successBlock(task,aData);
                            }
                            failure:^(NSURLSessionDataTask *task,NSError *aError){
                                failureBlock(task,aError);
                            }];
    }
    else if (methods == DELETE){
        return [sessionManager DELETE:urlString
                           parameters:bodyDic
                              success:^(NSURLSessionDataTask *task,id aData){
                                  successBlock(task,aData);
                              }
                              failure:^(NSURLSessionDataTask *task,NSError *aError){
                                  failureBlock(task,aError);
                              }];
    }
    else{
        return  [sessionManager GET:urlString
                          parameters:bodyDic
                            progress:nil
                             success:^(NSURLSessionDataTask *task,id aData){
                                 successBlock(task,aData);
                             }
                             failure:^(NSURLSessionDataTask *task,NSError *aError){
                                 failureBlock(task,aError);
                             }];
    }
    
    return nil;
}

- (void)dealloc {
    _delegate = nil;
}

+ (void)connectWithURL:(NSString *)url
        bodyDictionary:(NSDictionary *)dic
               methods:(RequestMethods)methods
              delegate:(id<ConnectionDelegate>)delegate{
    CustomURLRequest *request = [CustomURLRequest new];
    request.delegate = delegate;
    ObserverTask *observer = [ObserverTask new];
    observer.delegate = delegate;
    observer.task = [request connectWithHttps:url andMethods:methods bodyDictionary:dic];
}

@end