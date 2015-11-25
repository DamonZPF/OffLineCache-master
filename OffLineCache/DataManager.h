//
//  DataManager.h
//  OffLineCache
//
//  Created by Duomai on 15/11/24.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+(void)saveDataToDBWithArrays:(NSArray*)datas;
+(NSArray*)getDatasFromDB;
@end
