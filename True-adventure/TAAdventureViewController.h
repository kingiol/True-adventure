//
//  TAAdventureViewController.h
//  True-adventure
//
//  Created by Kingiol on 13-4-9.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TAAddressBookManager;
@class TACallHistoryManager;

@interface TAAdventureViewController : UIViewController

@property (nonatomic, retain) TAAddressBookManager *addressBookManager;
@property (nonatomic, retain) TACallHistoryManager *callHistoryManager;

- (IBAction)btnClick:(UIButton *)sender;

@end
