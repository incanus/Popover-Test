//
//  AppDelegate.m
//  Popover Test
//
//  Created by Justin Miller on 10/20/11.
//  Copyright (c) 2011 Development Seed. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    
    self.window.rootViewController = self.viewController;
    
    [self.window makeKeyAndVisible];

    return YES;
}

@end