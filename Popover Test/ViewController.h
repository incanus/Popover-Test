//
//  ViewController.h
//  Popover Test
//
//  Created by Justin Miller on 10/20/11.
//  Copyright (c) 2011 Development Seed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPopoverControllerDelegate>

@property (nonatomic, retain) UIPopoverController *popover;

- (IBAction)buttonTapped:(id)sender;

@end