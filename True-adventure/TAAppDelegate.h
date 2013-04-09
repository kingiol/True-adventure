//
//  TAAppDelegate.h
//  True-adventure
//
//  Created by Kingiol on 13-4-9.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TAViewController;

@interface TAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) TAViewController *viewController;

@property (nonatomic, retain) UINavigationController *rootNavigationController;

@end
