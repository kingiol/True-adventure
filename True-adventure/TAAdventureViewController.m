//
//  TAAdventureViewController.m
//  True-adventure
//
//  Created by Kingiol on 13-4-9.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "TAAdventureViewController.h"

@interface TAAdventureViewController ()

@end

@implementation TAAdventureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    if (btnTag == 1) {  //随机拨打电话
        NSLog(@"1");
    }else if (btnTag == 2) {    //随机发送短信
        NSLog(@"2");
    }
}
- (void)dealloc {
    [super dealloc];
}
@end
