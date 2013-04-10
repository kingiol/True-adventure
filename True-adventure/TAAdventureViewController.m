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

@interface TAAdventureViewController ()

@end

@implementation TAAdventureViewController

@synthesize addressBookManager = _addressBookManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _addressBookManager = [TAAddressBookManager shareInstance];
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
    
    if (btnTag == 1) {  //随机拨打电话
        NSString *phoneUrl = [NSString stringWithFormat:@"tel:%@", phoneStr];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneUrl]];
    }else if (btnTag == 2) {    //随机发送短信
        NSLog(@"2");
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
