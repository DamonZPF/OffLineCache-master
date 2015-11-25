//
//  BaseModel.m
//  OffLineCache
//
//  Created by Duomai on 15/11/23.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>
@implementation BaseModel
-(instancetype)initWithDicionary:(NSDictionary*)dict{
    
    self = [super init];
    if (self) {
        
        unsigned int count = 0;
        objc_property_t * list = class_copyPropertyList([self class], &count);
        for (int i = 0; i < count; i++) {
            objc_property_t objc = list[i];
            NSString * propertyName = [[NSString alloc] initWithCString:property_getName(objc) encoding:NSUTF8StringEncoding];
            
            if ([propertyName isEqualToString:@"ID"]) {
                propertyName = @"id";
            }
            
            id value;
            if ([dict isKindOfClass:[NSDictionary class]]) {
                value = dict[propertyName];
            }
            
            if (value == [NSNull null]) {
                continue;
            }
            
            if (value) {
                if ([propertyName isEqualToString:@"id"]) {
                    [self setValue:value forKey:@"ID"];
                }else{
                 [self setValue:value forKey:propertyName];
                }
               
            }
            
        }
    
    }
    
    return self;
}


+(NSArray*)dataWithArray:(NSArray*)arrays{

    NSMutableArray * tempArray = [NSMutableArray array];
    
    for (id dict  in arrays) {
       [tempArray addObject: [[self alloc] initWithDicionary:dict]];
    }
    
    return tempArray;
}

@end
