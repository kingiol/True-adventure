//
//  TAAdventureViewController.m
//  True-adventure
//
//  Created by Kingiol on 13-4-9.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "TAAdventureViewController.h"

#import "TAAddressBookManager.h"
#import "TAAddressBookVo.h"
#import "TAUtil.h"
#import "TACallHistoryManager.h"
#import "TACallHistoryVo.h"

#import "CTMessage/CDStructures.h"
#import "CTMessage/CTMessageCenter.h"
#import "CTMessage/CTMessagePart.h"
#import "CTMessage/CTMessageAddress-Protocol.h"
#import "CTMessage/CTMessage.h"

@interface TAAdventureViewController ()

@end

@implementation TAAdventureViewController

@synthesize addressBookManager = _addressBookManager;
@synthesize callHistoryManager = _callHistoryManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _addressBookManager = [TAAddressBookManager shareInstance];
        _callHistoryManager = [TACallHistoryManager shareInstance];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(UIButton *)sender {
    NSInteger btnTag = sender.tag;
    
    NSArray *allContancts = [self.addressBookManager getAllContanctsArray];
    
    NSString *phoneStr = [self getAvaliablePhoneNumberFromContancts:allContancts];
    if (phoneStr.length == 0) return;
    
    if (btnTag == 1) {  //通讯录中拨打电话
        NSString *phoneUrl = [NSString stringWithFormat:@"tel:%@", phoneStr];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneUrl]];
    }else if (btnTag == 2) {    //通讯录中发送短信
        NSLog(@"随机发送短信");
        [[CTMessageCenter sharedMessageCenter] sendSMSWithText:@"message text body" serviceCenter:nil toAddress:phoneStr];
    }else if (btnTag == 3) {    //通话记录中拨打电话
        NSArray *allCallHistorys = [self.callHistoryManager getAllCalls];
        NSUInteger callCount = [allCallHistorys count];
        if (callCount == 0) return;
        
        NSUInteger index = [TAUtil getRandomNumberFrom:0 To:callCount];
        
        TACallHistoryVo *vo = [allCallHistorys objectAtIndex:index];
        NSString *phoneString = vo.address;
        NSString *phoneUrl = [NSString stringWithFormat:@"tel:%@", phoneString];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneUrl]];
    }
}

- (NSString *)getAvaliablePhoneNumberFromContancts:(NSArray *)allContancts {
    NSUInteger contanctsCount = [allContancts count];
    if (contanctsCount == 0) {
        return @"";
    }
    
    NSUInteger index = [TAUtil getRandomNumberFrom:0 To: contanctsCount - 1];
    TAAddressBookVo *vo = [allContancts objectAtIndex:index];
    NSUInteger phoneCount = [vo.phoneArray count];
    if (phoneCount == 0) {
        return [self getAvaliablePhoneNumberFromContancts:allContancts];
    }
    
    NSUInteger phoneIndex = [TAUtil getRandomNumberFrom:0 To:phoneCount - 1];
    NSString *phoneStr = [vo.phoneArray objectAtIndex:phoneIndex];
    if ([phoneStr length] <= 0) {
        return [self getAvaliablePhoneNumberFromContancts:allContancts];
    }
    return phoneStr;
}

- (void)dealloc {
    [_addressBookManager release];
    
    [super dealloc];
}
@end
