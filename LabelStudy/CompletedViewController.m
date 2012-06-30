//
//  CompletedViewController.m
//  LabelStudy
//
//  Created by Andrew Kutta on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "CompletedViewController.h"
#import "ViewController.h"

@interface CompletedViewController ()

@end

@implementation CompletedViewController

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

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(IBAction)restart:(id)sender {
    NSLog(@"Restart");
    ViewController *nextView = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    [[self delegate] switchView:self.view toView:nextView.view newController:nextView];
}

-(AppDelegate*)delegate {
    static AppDelegate* del;
    if ( del == nil ) {
        del = [[UIApplication sharedApplication] delegate];
    }
    
    return del;
}

@end
