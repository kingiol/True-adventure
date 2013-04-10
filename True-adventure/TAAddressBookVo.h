//
//  TAAddressBookVo.h
//  True-adventure
//
//  Created by Kingiol on 13-4-10.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TAAddressBookVo : NSObject

@property (nonatomic, copy) NSString *fullName;
@property (nonatomic, assign) NSInteger recordId;
@property (nonatomic, retain) NSArray *phoneArray;
@property (nonatomic, retain) NSArray *emailArray;
@property (nonatomic, retain) UIImage *image;

@end
