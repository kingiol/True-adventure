//
//  TACallHistoryVo.m
//  True-adventure
//
//  Created by Kingiol on 13-4-10.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "TACallHistoryVo.h"

@implementation TACallHistoryVo

@synthesize address = _address;
@synthesize date = _date;
@synthesize flag = _flag;
@synthesize duration = _duration;

- (void)dealloc {
    [_address release];
    [_date release];
    
    [super dealloc];
}

@end
