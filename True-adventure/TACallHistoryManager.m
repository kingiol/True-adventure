//
//  TACallHistoryManager.m
//  True-adventure
//
//  Created by Kingiol on 13-4-10.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "TACallHistoryManager.h"

#import "TACallHistoryVo.h"
#import "FMDB/FMDatabase.h"

@implementation TACallHistoryManager

+ (id)shareInstance {
    static TACallHistoryManager *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TACallHistoryManager alloc] init];
    });
    return instance;
}

- (NSArray *)getAllCalls {
    
    NSMutableArray *allCalls = [NSMutableArray array];
    
    FMDatabase *db = [FMDatabase databaseWithPath:CallHistoryDBPath];
    if (db && [db open]) {
        FMResultSet *rs = [db executeQuery:@"select address, date, flags, duration from call order by date"];
        while ([rs next]) {
            TACallHistoryVo *vo = [[TACallHistoryVo alloc] init];
            
            NSInteger dateNum = [rs intForColumn:@"date"];
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateNum];
            NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
            [df setDateFormat:@"YYYY-MM-dd HH:mm"];
            NSString *dateStr = [df stringFromDate:date];
            vo.date = dateStr;
            
            vo.address = [rs stringForColumn:@"address"];
            vo.flag = [rs intForColumn:@"flags"];
            vo.duration = [rs intForColumn:@"duration"];
            
            [allCalls addObject:vo];
        }
        [rs close];
    }
    [db close];
    
    return [NSArray arrayWithArray:allCalls];
}

@end
