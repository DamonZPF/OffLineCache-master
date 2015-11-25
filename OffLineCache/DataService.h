//
//  DataService.h
//  OffLineCache
//
//  Created by Duomai on 15/11/24.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^responseResultBlock) (id result ,NSError * error);
@interface DataService : NSObject
+(void)getWithURL:(NSString*)url params:(NSDictionary*)params reslult:(responseResultBlock)result;
@end
