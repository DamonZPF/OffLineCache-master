//
//  BaseModel.h
//  OffLineCache
//
//  Created by Duomai on 15/11/23.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
-(instancetype)initWithDicionary:(NSDictionary*)dict;

+(NSArray*)dataWithArray:(NSArray*)arrays;
@end
