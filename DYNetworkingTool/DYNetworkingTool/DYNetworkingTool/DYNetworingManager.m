//
//  DYNetworingManager.m
//  DYNetworkingTool
//
//  Created by Yangdongwu on 16/8/2.
//  Copyright © 2016年 DovYoung. All rights reserved.
//

#import "DYNetworingManager.h"



@implementation DYNetworingManager

+ (instancetype)sharedManager {

    static DYNetworingManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
    
}


- (void)requestWithType:(RequestType)type
              URLString:(NSString *)URLString
             parameters:(id)parameters
               progress:(void (^)(NSProgress * _Nonnull))downloadProgress
                success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure
{

    if (type == RequestTypeGet) {
        
        [self GET:URLString parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            success(task,responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            failure(task,error);
            
        }];

    }
    
    if (type == RequestTypePost) {
        [self POST:URLString parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            success(task,responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            failure(task,error);
            
        }];
    }
    

}

@end
