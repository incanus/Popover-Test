//
//  ViewController.m
//  Popover Test
//
//  Created by Justin Miller on 10/20/11.
//  Copyright (c) 2011 Development Seed. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize popover;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.popover dismissPopoverAnimated:NO];
}

- (IBAction)buttonTapped:(id)sender
{
    UIViewController *vc = [[[UIViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    
    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)] autorelease];
    
    label.textAlignment = UITextAlignmentCenter;
    
    label.text = @"arrow: ...";
    
    [vc.view addSubview:label];
    
    self.popover = [[[UIPopoverController alloc] initWithContentViewController:vc] autorelease];
    
    self.popover.popoverContentSize = label.bounds.size;
    
    self.popover.delegate = self;
    
    [self.popover presentPopoverFromRect:CGRectMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds), 1, 1)
                                  inView:self.view
                permittedArrowDirections:UIPopoverArrowDirectionAny
                                animated:NO];
    
    /*
     * Here's the nut of it. The popoverArrowDirection docs say:
     *
     * The default value of this property is UIPopoverArrowDirectionUnknown. 
     * When you present the popover, the value changes to reflect the actual 
     * direction of the arrow being used by the popover. When the popover is 
     * subsequently dismissed, the value of this property returns to 
     * UIPopoverArrowDirectionUnknown.
     * 
     * However, in my testing, on iOS 5, the arrow direction is always unknown
     * after presentation (i.e., -1).
     *
     * What am I doing wrong here? 
     */
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void)
    {
        label.text = [NSString stringWithFormat:@"arrow: %i", self.popover.popoverArrowDirection];
        
        NSLog(@"popover: %@", self.popover);
        NSLog(@"arrow: %i", self.popover.popoverArrowDirection);
    });
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.popover = nil;
}

@end