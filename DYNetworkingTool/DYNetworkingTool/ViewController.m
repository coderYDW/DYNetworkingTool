//
//  ViewController.m
//  DYNetworkingTool
//
//  Created by Yangdongwu on 16/8/2.
//  Copyright © 2016年 DovYoung. All rights reserved.
//

#import "ViewController.h"
#import "DYNetworingManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDictionary *parameters = @{@"name":@"xiaoqiang",@"age":@"18"};
    
    
    /**
     *  get请求
     */
    [[DYNetworingManager sharedManager] requestWithType:RequestTypeGet URLString:@"https://httpbin.org/get" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable response) {
        
        NSLog(@"get = %@ task = %@",response,task);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
    
    /**
     *  post请求
     */
    [[DYNetworingManager sharedManager] requestWithType:RequestTypePost URLString:@"https://httpbin.org/post" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable response) {
        
        NSLog(@"post = %@ task = %@",response,task);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
    
    //验证单例
    NSLog(@"%p",[DYNetworingManager sharedManager]);
    NSLog(@"%p",[DYNetworingManager sharedManager]);
    
    
}



@end
