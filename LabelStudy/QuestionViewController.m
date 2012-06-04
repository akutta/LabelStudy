//
//  QuestionViewController.m
//  LabelStudy
//
//  Created by Andrew Kutta on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface QuestionViewController ()

@end

@implementation QuestionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil question:(NSUInteger)currentQuestion
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"Current Question:  %i",currentQuestion);
        question = currentQuestion;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [questionLabel setNumberOfLines:3];
    [pileLabel1 setNumberOfLines:2];
    [pileLabel2 setNumberOfLines:2];
    [pileLabel3 setNumberOfLines:2];
    
    mainTitle.layer.borderColor = [UIColor grayColor].CGColor;
    mainTitle.layer.borderWidth = 3.0;
    
    numPiles = 2;
    
    switch (question) {
        case 1:
            backButton.hidden = true;
            questionLabel.text = @"Please sort the warning labels into two piles, those meant for someone like you and those for a different kind of person.";
            pileLabel1.text = @"Someone Like You";
            pileLabel2.text = @"Different Kind of Person";
            break;
            
        case 2:
            questionLabel.text = @"Please sort the warning labels into three piles, those mostly for 'someone your age', for 'someone who is younger', and for 'someone who is older'.";
            pileLabel1.text = @"Someone your Age";
            pileLabel2.text = @"Someone who is Younger";
            pileLabel3.text = @"Someone who is Older";
            numPiles = 3;
            break;

        case 3:
            questionLabel.text = @"Please sort the warning labels into two piles, those that make you 'think about quitting' and those that 'do not'.";
            pileLabel1.text = @"Quitting";
            pileLabel2.text = @"Not Quitting";
            break;
            
        case 4:
            questionLabel.text = @"Please sort the warning labels into two piles, those that make you think about 'calling' 1-800-QUIT-NOW and those that do 'not'.";
            pileLabel1.text = @"Calling";
            pileLabel2.text = @"Not Calling";
            break;
            
        case 5:
            questionLabel.text = @"Please sort the warning labels into two piles, those that make you want to 'avoid smoking' and those that do 'not'.";
            pileLabel1.text = @"Avoid Smoking";
            pileLabel2.text = @"Not Avoid Smoking";
            break;
            
        case 6:
            questionLabel.text = @"Please sort the warning labels into two piles, those that would 'make people look down on you because you smoke', and those that would 'not'.";
            pileLabel1.text = @"Make People Look Down on you because you Smoke";
            pileLabel2.text = @"Would Not Look Down On you because you Smoke";
            break;
            
        case 7:
            nextButton.hidden = true;
            questionLabel.text = @"Please sort the warning labels into two piles, those that would make you 'think about banning smoking in your home or car', and those that would 'not'.";
            pileLabel1.text = @"Would make you think";
            pileLabel2.text = @"Would not make you think";
            break;
        
        default:
            break;
    }
    
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

-(IBAction)lastQuestion:(id)sender
{
    QuestionViewController *nextView = [[QuestionViewController alloc] initWithNibName:@"QuestionViewController" bundle:nil question:(question - 1)];
    [[self delegate] switchView:self.view toView:nextView.view newController:nextView]; 
}

-(IBAction)nextQuestion:(id)sender
{
    QuestionViewController *nextView = [[QuestionViewController alloc] initWithNibName:@"QuestionViewController" bundle:nil question:(question + 1)];
    [[self delegate] switchView:self.view toView:nextView.view newController:nextView]; 
}

-(AppDelegate*)delegate {
    static AppDelegate* del;
    if ( del == nil ) {
        del = [[UIApplication sharedApplication] delegate];
    }
    
    return del;
}

- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event
{
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    UIControl *control = sender;
    control.center = point;
}



@end
