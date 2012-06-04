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
    mainTitle.layer.borderWidth = 3.0f;
    
    pile1.layer.borderWidth = 3.0f;
    pile1.layer.borderColor = [UIColor grayColor].CGColor;
    pile1.layer.cornerRadius = 10.0f;
    
    pile2.layer.borderWidth = 3.0f;
    pile2.layer.borderColor = [UIColor grayColor].CGColor;
    pile2.layer.cornerRadius = 10.0f;
    
    pile3.layer.borderWidth = 3.0f;
    pile3.layer.borderColor = [UIColor grayColor].CGColor;
    pile3.layer.cornerRadius = 10.0f;
    
    numPiles = 2;
    
    switch (question) {
        case 1:
            backButton.hidden = true;
            questionLabel.text = @"Please sort the warning labels into two piles, those meant for someone like you and those for a different kind of person.";
            pileLabel1.text = @"Someone Like You";
            pileLabel3.text = @"Different Kind of Person";
            break;
            
        case 2:
            questionLabel.text = @"Please sort the warning labels into three piles, those mostly for 'someone your age', for 'someone who is younger', and for 'someone who is older'.";
            pileLabel1.text = @"Someone Who is Younger";
            pileLabel2.text = @"Someone Your Age";
            pileLabel3.text = @"Someone Who is Older";
            numPiles = 3;
            break;

        case 3:
            questionLabel.text = @"Please sort the warning labels into two piles, those that make you 'think about quitting' and those that 'do not'.";
            pileLabel1.text = @"Quitting";
            pileLabel3.text = @"Not Quitting";
            break;
            
        case 4:
            questionLabel.text = @"Please sort the warning labels into two piles, those that make you think about 'calling' 1-800-QUIT-NOW and those that do 'not'.";
            pileLabel1.text = @"Calling";
            pileLabel3.text = @"Not Calling";
            break;
            
        case 5:
            questionLabel.text = @"Please sort the warning labels into two piles, those that make you want to 'avoid smoking' and those that do 'not'.";
            pileLabel1.text = @"Avoid Smoking";
            pileLabel3.text = @"Not Avoid Smoking";
            break;
            
        case 6:
            questionLabel.text = @"Please sort the warning labels into two piles, those that would 'make people look down on you because you smoke', and those that would 'not'.";
            pileLabel1.text = @"Make People Look Down on You";
            pileLabel3.text = @"Would Not Look Down on You";
            break;
            
        case 7:
            nextButton.hidden = true;
            questionLabel.text = @"Please sort the warning labels into two piles, those that would make you 'think about banning smoking in your home or car', and those that would 'not'.";
            pileLabel1.text = @"Would Make You Think";
            pileLabel3.text = @"Would Not Make You Think";
            break;
        
        default:
            break;
    }
    
    if ( numPiles == 2 ) {
        pileLabel2.hidden = true;
        pile2.hidden = true;
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

- (BOOL) withinRange:(CGFloat)point minValue:(CGFloat)min maxValue:(CGFloat)max {
    if ( point > min )
        if ( point < max ) 
            return TRUE;
    return FALSE;
}

- (BOOL) withinPile:(CGRect)bounds objectPoint:(CGPoint)point {
    if ( [self withinRange:point.x minValue:bounds.origin.x maxValue:(bounds.origin.x+bounds.size.width)] )
        if ( [self withinRange:point.y minValue:bounds.origin.y maxValue:(bounds.origin.y+bounds.size.height)] ) 
            return TRUE;
    
    return FALSE;
}

- (IBAction)imageReleased:(id)sender withEvent:(UIEvent*) event{
    
    [self.view bringSubviewToFront:(UIView*)sender];
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    UIControl *control = sender;
    
    if ( [self withinPile:pile1.frame objectPoint:point] == TRUE ) {
        //NSLog(@"Released Within Pile 1!");
        control.center = CGPointMake(pile1.frame.origin.x + pile1.frame.size.width/2, 
                                     pile1.frame.origin.y + pile1.frame.size.height/2);
    }
    
    // Special Case if 3 piles
    if (numPiles == 3 ) {
        if ( [self withinPile:pile2.frame objectPoint:point] == TRUE ) {
            //NSLog(@"Released Within Pile 2!");
            control.center = CGPointMake(pile2.frame.origin.x + pile2.frame.size.width/2, 
                                         pile2.frame.origin.y + pile2.frame.size.height/2);
        }
        
        if ( [self withinPile:pile3.frame objectPoint:point] == TRUE ) {
            //NSLog(@"Released Within Pile 3!");
            control.center = CGPointMake(pile3.frame.origin.x + pile3.frame.size.width/2, 
                                         pile3.frame.origin.y + pile3.frame.size.height/2);
        }
    } else {
        if ( [self withinPile:pile3.frame objectPoint:point] == TRUE ) {
            //NSLog(@"Released Within Pile 2!");
            control.center = CGPointMake(pile3.frame.origin.x + pile3.frame.size.width/2, 
                                         pile3.frame.origin.y + pile3.frame.size.height/2);
        }
    }
}

- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event
{
    [self.view bringSubviewToFront:(UIView*)sender];
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    UIControl *control = sender;
    control.center = point;
    
    
    if ( [self withinPile:pile1.frame objectPoint:point] == TRUE ) {
        //NSLog(@"Within Pile 1!");
        pile1.backgroundColor = [UIColor darkGrayColor];
    } else {
        pile1.backgroundColor = nil;
    }
    
    // Special Case if 3 piles
    if (numPiles == 3 ) {
        if ( [self withinPile:pile2.frame objectPoint:point] == TRUE ) {
            //NSLog(@"Within Pile 2!");
            pile2.backgroundColor = [UIColor darkGrayColor];
        } else {
            pile2.backgroundColor = nil;
        }
        
        if ( [self withinPile:pile3.frame objectPoint:point] == TRUE ) {
            //NSLog(@"Within Pile 3!");
            pile3.backgroundColor = [UIColor darkGrayColor];
        } else {
            pile3.backgroundColor = nil;
        }
        
    } else {
        if ( [self withinPile:pile3.frame objectPoint:point] == TRUE ) {
            //NSLog(@"Within Pile 2!");
            pile3.backgroundColor = [UIColor darkGrayColor];
        } else {
            pile3.backgroundColor = nil;
        }
    }
}



@end
