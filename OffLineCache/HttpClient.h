//
//  HttpClient.h
//  OffLineCache
//
//  Created by Duomai on 15/11/23.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  void (^RequestSuccessBlock) (id responseObject);
typedef  void (^RequestFailureBlock) (NSError * error);

@interface HttpClient : NSObject

+(void)getWithURL:(NSString*)url params:(NSDictionary*)params success:(RequestSuccessBlock)success failure:(RequestFailureBlock) failure;

@end
