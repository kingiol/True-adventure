//
//  TAAddressBookVo.m
//  True-adventure
//
//  Created by Kingiol on 13-4-10.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "TAAddressBookVo.h"

@implementation TAAddressBookVo

@synthesize fullName = _fullName;
@synthesize recordId = _recordId;
@synthesize phoneArray = _phoneArray;
@synthesize emailArray = _emailArray;
@synthesize image = _image;

- (void)dealloc {
    [_fullName release];
    [_phoneArray release];
    [_emailArray release];
    [_image release];

    [super dealloc];
}

@end
