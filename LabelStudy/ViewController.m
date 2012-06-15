//
//  ViewController.m
//  LabelStudy
//
//  Created by Andrew Kutta on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SurveyViewController.h"

@interface ViewController ()
    -(AppDelegate*)delegate;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [instructionLabel setNumberOfLines:2];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(IBAction)beginStudy:(id)sender
{
    if ( [userID.text length] == 0 ) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No User Id Entered"
                                                        message:@"You must enter your User ID to continue." 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    if ( ![userID.text compare:@"hcrlreauth"] ) {
        NSLog(@"Unlinking and Reauthorizing Dropbox");
        [[self delegate].dbInterface unlinkAccount];
        [[self delegate].dbInterface linkAccount:[self delegate].window];
        userID.text = @"";
        userAge.text = @"";
        return;
    }
    
    if ( ![userID.text compare:@"hcrlwashu"] ) {
        NSLog(@"Uploading Stored Data to Dropbox");
        userID.text = @"";
        userAge.text = @"";
        [[self delegate].dbInterface uploadAllFiles];
        return;
    }
    
    if ( ![userID.text compare:@"hcrldel"] ) {
        NSLog(@"Deleting Local Files");
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        BOOL success = [[NSFileManager defaultManager] removeItemAtPath:documentsDirectory error:nil];
        if ( success == YES ) {
            NSLog(@"Successfully Deleted Local Files");
        }
        userID.text = @"";
        userAge.text = @"";
        return;
    }
    
    

    if ( [userAge.text length] == 0 ) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No User Age Entered"
                                                        message:@"You must enter your Age to continue." 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSError *error;
    
    
    if (![[NSFileManager defaultManager] createDirectoryAtPath:[documentsDirectory stringByAppendingFormat:@"/%@",userID.text]
                                   withIntermediateDirectories:NO
                                                    attributes:nil
                                                         error:&error])
    {
        //NSLog(@"Create directory error: %@", error);
    }
    
    [[self delegate] setUserAge:[userAge.text intValue]];
    [[self delegate] setUserId:userID.text];
    //NSLog(@"%@ is %i years old",[self delegate].userId, [self delegate].userAge);
    
    if ( isNavajo.selectedSegmentIndex == 0 ) {
        //NSLog(@"Is Not a Navajo");
        [[self delegate] setIsNavajo:NO];
    } else {
        //NSLog(@"Is a Navajo");
        [[self delegate] setIsNavajo:YES];
    }
    
    //QuestionViewController *nextView = [[QuestionViewController alloc] initWithNibName:@"QuestionViewController" bundle:nil question:1];
    SurveyViewController *nextView = [[SurveyViewController alloc] initWithNibName:@"SurveyViewController" bundle:nil];
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
