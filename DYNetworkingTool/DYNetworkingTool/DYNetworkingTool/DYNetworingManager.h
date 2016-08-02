//
//  DYNetworingManager.h
//  DYNetworkingTool
//
//  Created by Yangdongwu on 16/8/2.
//  Copyright © 2016年 DovYoung. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef enum {
    RequestTypeGet,
    RequestTypePost,
} RequestType;

@interface DYNetworingManager : AFHTTPSessionManager

/**
 *  单例方法
 */
+ (instancetype)sharedManager;


- (void)requestWithType:(RequestType)type
              URLString:(NSString *)URLString
             parameters:(id)parameters
               progress:(void (^)(NSProgress * _Nonnull))downloadProgress
                success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

@end
