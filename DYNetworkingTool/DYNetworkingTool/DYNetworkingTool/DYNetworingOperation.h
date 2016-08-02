//
//  DYNetworingOperation.h
//  DYNetworkingTool
//
//  Created by Yangdongwu on 16/8/2.
//  Copyright © 2016年 DovYoung. All rights reserved.
//

#import "DYNetworingManager.h"

@interface DYNetworingOperation : DYNetworingManager

+ (void)requestOperationWithParameters:(NSDictionary *)parameters success:(void(^)(id response))success;

@end
