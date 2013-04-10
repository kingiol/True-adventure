//
//  TAAddressBookManager.h
//  True-adventure
//
//  Created by Kingiol on 13-4-10.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TAAddressBookManager : NSObject

+ (id)shareInstance;

- (NSArray *)getAllContanctsArray;

@end
