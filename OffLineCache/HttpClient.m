//
//  HttpClient.m
//  OffLineCache
//
//  Created by Duomai on 15/11/23.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import "HttpClient.h"
#import "AFNetworking.h"
@implementation HttpClient
+(void)getWithURL:(NSString*)url params:(NSDictionary*)params success:(RequestSuccessBlock)success failure:(RequestFailureBlock) failure{

    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(error);
        
    }];
}
@end
