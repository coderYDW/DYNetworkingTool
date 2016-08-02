//
//  DYNetworingOperation.m
//  DYNetworkingTool
//
//  Created by Yangdongwu on 16/8/2.
//  Copyright © 2016年 DovYoung. All rights reserved.
//

#import "DYNetworingOperation.h"

@implementation DYNetworingOperation

+ (void)requestOperationWithParameters:(NSDictionary *)parameters success:(void(^)(id response))success {

    NSString *URLString = @"https://httpbin.org/get";
    
    [[DYNetworingManager sharedManager] requestWithType:RequestTypeGet URLString:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id response) {
        
        success(response);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"error = %@",error);
        
    }];
    
    
}


@end
