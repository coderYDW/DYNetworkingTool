# DYNetworkingTool
网络工具类

1. DYNetworkingTool 
网络中间层的封装
2. DYNetworkingOperation 
网络业务封装用来进行独立的网络业务请求,可以根据项目的需求写多个网络业务类,用于不同的网络业务请求

```
//网络业务层的使用方法,这里的Operation可以换成具体的业务名字,用于区分不同的网络业务
+ (void)requestOperationWithParameters:(NSDictionary *)parameters success:(void(^)(id response))success failure:(void(^)(NSError *error))failure {
    
    //将业务层的URLString放在这里
    NSString *URLString = @"https://httpbin.org/get";
    
    [[DYNetworingManager sharedManager] requestWithType:kRequestType URLString:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id response) {
        
        success(response);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        failure(error);
        
    }];
    
}
```
