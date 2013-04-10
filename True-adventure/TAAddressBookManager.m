//
//  TAAddressBookManager.m
//  True-adventure
//
//  Created by Kingiol on 13-4-10.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "TAAddressBookManager.h"

#import "TAAddressBookVo.h"

@implementation TAAddressBookManager

+ (id)shareInstance {
    static TAAddressBookManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TAAddressBookManager alloc] init];
    });
    return instance;
}

- (NSArray *)getAllContanctsArray {
    NSMutableArray *addressBookArray = [NSMutableArray array];
    ABAddressBookRef addressBook = NULL;

    if (IOSSystemVersion >= 6.0) {
        addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    }else {
        addressBook = ABAddressBookCreate();
    }
    
    CFArrayRef allPerson = ABAddressBookCopyArrayOfAllPeople(addressBook);
    CFIndex personCount = ABAddressBookGetPersonCount(addressBook);
    
    for (NSInteger i = 0; i < personCount; i++) {
        TAAddressBookVo *addressBookVo = [[TAAddressBookVo alloc] init];
        ABRecordRef person = CFArrayGetValueAtIndex(allPerson, i);
        CFStringRef firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
        CFStringRef lastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
        CFStringRef fullName = ABRecordCopyCompositeName(person);
        
        NSString *nameStr = (NSString *)firstName;
        NSString *lastNameStr = (NSString *)lastName;
        
        if ((id)fullName != nil) {
            nameStr = (NSString *)fullName;
        }else {
            if ((id)lastName != nil) {
                nameStr = [NSString stringWithFormat:@"%@ %@", nameStr, lastNameStr];
            }
        }
        
        addressBookVo.fullName = nameStr;
        addressBookVo.recordId = (NSInteger)ABRecordGetRecordID(person);
        
        ABPropertyType propertyTypes[] = {
            kABPersonPhoneProperty,
            kABPersonEmailProperty
        };
        
        NSInteger multiPropertysTotal = sizeof(propertyTypes) / sizeof(ABPropertyType);
        
        
        NSMutableArray *phoneArray = [NSMutableArray array];
        NSMutableArray *emailArray = [NSMutableArray array];
        
        for (NSInteger j = 0; j < multiPropertysTotal ; j++) {
            ABPropertyID propertyID = propertyTypes[j];
            ABMultiValueRef multiValue = ABRecordCopyValue(person, propertyID);
            NSInteger valuesCount = 0;
            if ((id)multiValue != nil) {
                valuesCount = ABMultiValueGetCount(multiValue);
            }
            
            if (valuesCount == 0) {
                CFRelease(multiValue);
                continue;
            }
            
            for (NSInteger k = 0; k < valuesCount; k++) {
                CFStringRef value = ABMultiValueCopyValueAtIndex(multiValue, k);
                switch (j) {
                    case 0: {   //  phone
                        
                        NSString *phoneNumber = [(NSString *)value telephoneWithReformat];
                        [phoneArray addObject:phoneNumber];
                        
                        break;
                    }
                    case 1: {   //  email
                        [emailArray addObject:(NSString *)value];
                        break;
                    }
                }
                CFRelease(value);
            }
            CFRelease(multiValue);
        }
        
        addressBookVo.phoneArray = [NSArray arrayWithArray:phoneArray];
        addressBookVo.emailArray = [NSArray arrayWithArray:emailArray];
        
        [addressBookArray addObject:addressBookVo];
        [addressBookVo release];
        
        if (fullName) CFRelease(fullName);
        if (lastName) CFRelease(lastName);
        if (firstName) CFRelease(firstName);
        
    }
    
    CFRelease(allPerson);
    CFRelease(addressBook);

    return addressBookArray;
}

@end
