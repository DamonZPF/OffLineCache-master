//
//  DataManager.m
//  OffLineCache
//
//  Created by Duomai on 15/11/24.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import "DataManager.h"
#import "FMDB.h"
static FMDatabase * _db;

@implementation DataManager

+(void)initialize{
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * filePath = [path stringByAppendingPathComponent:@"data.sqlite"];
    _db = [FMDatabase databaseWithPath:filePath];
    if (![_db open]) {
        [_db open];
    }
    NSLog(@"%@",filePath);
    [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS T_data (id integer PRIMARY KEY,datas blob NOT NULL, idStr text NOT NULL);"];
}

+(void)saveDataToDBWithArrays:(NSArray*)datas{

    for (NSDictionary * dict  in datas) {
        NSData * data = [NSKeyedArchiver archivedDataWithRootObject:dict];
        [_db executeUpdate:@"INSERT INTO T_data (datas, idStr) VALUES (?, ?);",data,dict[@"id"] ];
          NSLog(@"%@",dict);
    }
    
}

+(NSArray*)getDatasFromDB{

    NSMutableArray * contents = [NSMutableArray array];
    FMResultSet * set = [_db executeQuery:@"SELECT * FROM T_data"];
    while (set.next) {
        NSData * data = [set objectForColumnName:@"datas"];
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
       
        [contents addObject:dict];
    }
    return contents;
    
}

@end
