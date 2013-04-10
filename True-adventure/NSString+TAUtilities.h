//
//  NSString+TAUtilities.h
//  True-adventure
//
//  Created by Kingiol on 13-4-10.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TAUtilities)

- (BOOL)containsString:(NSString *)str;
- (NSString *)telephoneWithReformat;

@end
