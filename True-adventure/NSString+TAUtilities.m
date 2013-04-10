//
//  NSString+TAUtilities.m
//  True-adventure
//
//  Created by Kingiol on 13-4-10.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "NSString+TAUtilities.h"

@implementation NSString (TAUtilities)

- (BOOL)containsString:(NSString *)str {
    NSRange range = [[self lowercaseString] rangeOfString:[str lowercaseString]];
    return range.location != NSNotFound;
}

- (NSString *)telephoneWithReformat {
    
    if ([self containsString:@"-"]) {
        self = [self stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
    
    if ([self containsString:@" "]) {
        self = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    
    if ([self containsString:@"("]) {
        self = [self stringByReplacingOccurrencesOfString:@"(" withString:@""];
    }
    
    if ([self containsString:@")"]) {
        self = [self stringByReplacingOccurrencesOfString:@")" withString:@""];
    }
    
    return self;
}

@end
