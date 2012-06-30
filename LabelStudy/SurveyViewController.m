//
//  SurveyViewController.m
//  LabelStudy
//
//  Created by Andrew Kutta on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "SurveyViewController.h"
#import "QuestionViewController.h"

@interface SurveyViewController ()

@end

@implementation SurveyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(IBAction)beginStudy:(id)sender
{   
    NSMutableArray *questionBank = [[NSMutableArray alloc] initWithCapacity:7];
    if ( [self delegate].userAge < 18 ) {
        if ( answerQ1.selectedSegmentIndex == 0 ) {
            [[self delegate] setIsSmoker:TRUE];
            
            [questionBank addObject:[NSNumber numberWithInt:2]];
            [questionBank addObject:[NSNumber numberWithInt:3]];
            [questionBank addObject:[NSNumber numberWithInt:4]];
            [questionBank addObject:[NSNumber numberWithInt:5]];
            [questionBank addObject:[NSNumber numberWithInt:8]];
            if ( answerQ4.selectedSegmentIndex > 1 ) {
                [questionBank addObject:[NSNumber numberWithInt:9]];
            }
        } else {
            [[self delegate] setIsSmoker:FALSE];
            [questionBank addObject:[NSNumber numberWithInt:1]];
            [questionBank addObject:[NSNumber numberWithInt:3]];
            [questionBank addObject:[NSNumber numberWithInt:4]];
            [questionBank addObject:[NSNumber numberWithInt:7]];
            if ( answerQ4.selectedSegmentIndex > 1 ) {
                [questionBank addObject:[NSNumber numberWithInt:9]];
            }
        }
    } else {
        if ( answerQ1.selectedSegmentIndex == 0 ) {
            [[self delegate] setIsSmoker:TRUE];
            [questionBank addObject:[NSNumber numberWithInt:2]];
            [questionBank addObject:[NSNumber numberWithInt:3]];
            [questionBank addObject:[NSNumber numberWithInt:4]];
            [questionBank addObject:[NSNumber numberWithInt:5]];
            [questionBank addObject:[NSNumber numberWithInt:8]];
            if ( [self delegate].userAge < 25 )  {
                if ( answerQ4.selectedSegmentIndex > 1 ) {
                    [questionBank addObject:[NSNumber numberWithInt:9]];
                }
            }
        } else {
            [[self delegate] setIsSmoker:FALSE];
            [questionBank addObject:[NSNumber numberWithInt:1]];
            [questionBank addObject:[NSNumber numberWithInt:3]];
            [questionBank addObject:[NSNumber numberWithInt:4]];
            if ( answerQ4.selectedSegmentIndex > 1 && [self delegate].userAge < 25 ) {
                [questionBank addObject:[NSNumber numberWithInt:9]];
            }
        }
    }
    
    NSLog(@"IsSmoker:  %@",([self delegate].isSmoker ? @"YES" : @"NO"));   
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [[NSString alloc] initWithFormat:@"%@.txt", [self delegate].userId];
    NSString *buffer = [[NSString alloc] initWithFormat:@"Smoker:\t%@\n", ([self delegate].isSmoker ? @"YES" : @"NO")];
    buffer = [buffer stringByAppendingFormat:@"Age:\t%i\n",[self delegate].userAge];
    buffer = [buffer stringByAppendingFormat:@"View Cadavar, Lungs, Heart:\t%@\n",([self delegate].isNavajo ? @"NO" : @"YES")];
    
    [buffer writeToFile:[[NSString alloc] initWithFormat:@"%@/%@/%@",documentsDirectory,[self delegate].userId, fileName] 
             atomically:YES 
               encoding:NSStringEncodingConversionAllowLossy 
                  error:nil];
    
    QuestionViewController *nextView = [[QuestionViewController alloc] initWithNibName:@"QuestionViewController" bundle:nil 
                                                                             questions:[questionBank copy] questionsToAsk:questionBank];
    [[self delegate] switchView:self.view toView:nextView.view newController:nextView]; 
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [question4 setNumberOfLines:3];
        
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

-(AppDelegate*)delegate {
    static AppDelegate* del;
    if ( del == nil ) {
        del = [[UIApplication sharedApplication] delegate];
    }
    
    return del;
}


@end
