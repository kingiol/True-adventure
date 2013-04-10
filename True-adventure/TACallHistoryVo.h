//
//  TACallHistoryVo.h
//  True-adventure
//
//  Created by Kingiol on 13-4-10.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TACallHistoryVo : NSObject

@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, assign) NSUInteger flag;  //4:被叫,5:主叫
@property (nonatomic, assign) NSUInteger duration;

@end
