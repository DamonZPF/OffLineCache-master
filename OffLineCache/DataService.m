//
//  DataService.m
//  OffLineCache
//
//  Created by Duomai on 15/11/24.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import "DataService.h"
#import "HttpClient.h"
#import "DataModel.h"
#import "DataManager.h"

@implementation DataService
+(void)getWithURL:(NSString*)url params:(NSDictionary*)params reslult:(responseResultBlock)result{
    
    NSArray * datas = [DataManager getDatasFromDB];
    if (datas.count) {
        NSArray * contents = [DataModel dataWithArray:datas];
        result(contents,nil);
    }else{
        
        [HttpClient getWithURL:url params:params success:^(id responseObject) {
            NSArray * contents = [DataModel dataWithArray:responseObject[@"data"][@"list"]];
            [DataManager saveDataToDBWithArrays:responseObject[@"data"][@"list"]];
            
           // NSLog(@"___%@",responseObject);
            result(contents,nil);
        } failure:^(NSError *error) {
            result(nil,error);
        }];
    }
   
}
@end
