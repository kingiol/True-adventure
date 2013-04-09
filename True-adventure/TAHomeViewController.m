//
//  TAHomeViewController.m
//  True-adventure
//
//  Created by Kingiol on 13-4-9.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "TAHomeViewController.h"

#import "TATrueViewController.h"
#import "TAAdventureViewController.h"

@interface TAHomeViewController ()

@end

@implementation TAHomeViewController

@synthesize tabBarController = _tabBarController;

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
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    self.tabBarController.view.frame = self.view.bounds;
    
    TATrueViewController *trueViewController = [[TATrueViewController alloc] init];
    trueViewController.tabBarItem.title = @"真心话";
    
    TAAdventureViewController *adventureViewController = [[TAAdventureViewController alloc] init];
    adventureViewController.tabBarItem.title = @"大冒险";
    
    NSArray *viewControllers = [NSArray arrayWithObjects:trueViewController, adventureViewController, nil];
    
    self.tabBarController.viewControllers = viewControllers;
    [trueViewController release];
    [adventureViewController release];
    
    [self.view addSubview:self.tabBarController.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tabBarController release];
    [super dealloc];
}

#pragma mark - UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
}

@end
