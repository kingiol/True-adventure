//
//  TAUtil.m
//  True-adventure
//
//  Created by Kingiol on 13-4-10.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "TAUtil.h"

@implementation TAUtil

+ (NSUInteger)getRandomNumberFrom:(NSUInteger)from To:(NSUInteger)to {
    return (NSUInteger)(from + (arc4random() % (to -from + 1)));
}

@end
