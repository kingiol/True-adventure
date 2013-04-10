//
//  TAViewController.m
//  True-adventure
//
//  Created by Kingiol on 13-4-9.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "TAViewController.h"

#import "TAHomeViewController.h"

@interface TAViewController ()

@end

@implementation TAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.frame = CGRectMake(0., 0., 320., 25.);
    label.center = self.view.center;
    label.text = @"向上拖动进入系统";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18.f];
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    [label release];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
    [panGestureRecognizer release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint point = [gestureRecognizer translationInView:self.view];
    
    if (point.y < -150.f) {
        
        TAHomeViewController *controller = [[TAHomeViewController alloc] init];
        
//        [self.navigationController pushViewController:controller animated:YES];
        [self presentViewController:controller animated:YES completion:^{
            
        }];
        [self.view removeGestureRecognizer:gestureRecognizer];
    }
}

@end
