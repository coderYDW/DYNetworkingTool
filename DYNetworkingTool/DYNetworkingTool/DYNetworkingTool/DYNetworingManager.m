//
//  DYNetworingManager.m
//  DYNetworkingTool
//
//  Created by Yangdongwu on 16/8/2.
//  Copyright © 2016年 DovYoung. All rights reserved.
//

#import "DYNetworingManager.h"

@interface DYNetworingManager ()



@end


@implementation DYNetworingManager

+ (instancetype)sharedManager {

    static DYNetworingManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
    
}


- (void)requestWithType:(RequestType)type
              URLString:(NSString *)URLString
             parameters:(id)parameters
               progress:(void (^)(NSProgress *progress))downloadProgress
                success:(void (^)(NSURLSessionDataTask *, id ))success
                failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure
{
    
    void(^successBlock)(NSURLSessionDataTask *  task, id   responseObject) = ^(NSURLSessionDataTask *  task, id   responseObject) {
        
        success(task,responseObject);
        
    };
    
    void(^failureBlock)(NSURLSessionDataTask *  task, NSError *  error) = ^(NSURLSessionDataTask *  task, NSError *  error) {
        
        failure(task,error);
        
    };
    
    

    if (type == RequestTypeGet) {
        [self GET:URLString parameters:parameters progress:downloadProgress success:successBlock failure:failureBlock];
    }
    
    if (type == RequestTypePost) {
        [self POST:URLString parameters:parameters progress:downloadProgress success:successBlock failure:failureBlock];
    }
    

}

@end