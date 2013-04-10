//
//  TACallHistoryManager.h
//  True-adventure
//
//  Created by Kingiol on 13-4-10.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TACallHistoryManager : NSObject

+ (id)shareInstance;

- (NSArray *)getAllCalls;

@end
