//
//  DYNetworingManager.m
//  DYNetworkingTool
//
//  Created by Yangdongwu on 16/8/2.
//  Copyright © 2016年 DovYoung. All rights reserved.
//

#import "DYNetworkingManager.h"

@interface DYNetworkingManager ()

@property (nonatomic, assign) AFNetworkReachabilityStatus netStatus; //!< 网络检测

@end


@implementation DYNetworkingManager

+ (instancetype)sharedManager {

    static DYNetworkingManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
        manager.netStatus = AFNetworkReachabilityStatusReachableViaWiFi;
        [manager checkNetRequestChangeBlock:^(AFNetworkReachabilityStatus status) {
            manager.netStatus = status;
        }];
    });
    return manager;
    
}


- (void)requestWithType:(RequestType)type
              URLString:(NSString *)URLString
             parameters:(id)parameters
               progress:(void (^)(NSProgress *progress))downloadProgress
                success:(void (^)(NSURLSessionDataTask *task, id response))success
                failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    
    if (self.netStatus == AFNetworkReachabilityStatusNotReachable || self.netStatus == AFNetworkReachabilityStatusUnknown) {
        
        [self connectError];
        
        return;
        
    }
    
    void(^successBlock)(NSURLSessionDataTask *task, id responseObject) = ^(NSURLSessionDataTask *task, id responseObject) {
        success(task,responseObject);
    };
    
    void(^failureBlock)(NSURLSessionDataTask *task, NSError *error) = ^(NSURLSessionDataTask *task, NSError *error) {
        failure(task,error);
    };
    
    
    //设置网络返回的数据类型,如果解析不出来数据,要查看是不是数据类型不同,不同的话要进行格式设置
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    
    
    if (type == RequestTypeGet) {
        [self GET:URLString parameters:parameters progress:downloadProgress success:successBlock failure:failureBlock];
    } else if (type == RequestTypePost) {
        [self POST:URLString parameters:parameters progress:downloadProgress success:successBlock failure:failureBlock];
    }
    

}

- (void)checkNetRequestChangeBlock:(void(^)(AFNetworkReachabilityStatus status))netChange {
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        netChange(status);
        
    }];
    
    [manager startMonitoring];
    
}

- (void)connectError {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网络不可用,请检查网络" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    
    [alertView show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
}

@end
