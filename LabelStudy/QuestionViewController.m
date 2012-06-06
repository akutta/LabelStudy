//
//  QuestionViewController.m
//  LabelStudy
//
//  Created by Andrew Kutta on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//
//  If you dislike ugly code do not continue reading this.
//

#import "QuestionViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface QuestionViewController ()

@end

@implementation QuestionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
            questions:(NSArray*)QuestionBank questionsToAsk:(NSMutableArray*)futureQuestions
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        questionBank = QuestionBank;
        question = [[futureQuestions objectAtIndex:0] intValue];
        [futureQuestions removeObjectAtIndex:0];
        remainingQuestions = futureQuestions;
        
        //question = currentQuestion;
        NSLog(@"Current Question:  %i",question);
        imagesOnPile1 = [[NSMutableArray alloc] init];
        imagesOnPile2 = [[NSMutableArray alloc] init];
        imagesOnPile3 = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addBorder:(UILabel*)label width:(CGFloat)borderWidth radius:(CGFloat)cornerRadius {
    label.layer.borderWidth = borderWidth;
    label.layer.borderColor = [UIColor grayColor].CGColor;
    label.layer.cornerRadius = cornerRadius;
}

- (void)changeHiddenPile1:(BOOL)isHidden {
    pile1.hidden = isHidden;
    pileLabel1.hidden = isHidden;
    
    // Pile 1 Sub Squares
    pile1_1x1.hidden = isHidden;
    pile1_1x2.hidden = isHidden;
    pile1_1x3.hidden = isHidden;
    pile1_2x1.hidden = isHidden;
    pile1_2x2.hidden = isHidden;
    pile1_2x3.hidden = isHidden;
    pile1_3x1.hidden = isHidden;
    pile1_3x2.hidden = isHidden;
    pile1_3x3.hidden = isHidden;
}

- (void)changeHiddenPile2:(BOOL)isHidden {
    pile2.hidden = isHidden;
    pileLabel2.hidden = isHidden;
    
    // Pile 2 Sub Squares
    pile2_1x1.hidden = isHidden;
    pile2_1x2.hidden = isHidden;
    pile2_1x3.hidden = isHidden;
    pile2_2x1.hidden = isHidden;
    pile2_2x2.hidden = isHidden;
    pile2_2x3.hidden = isHidden;
    pile2_3x1.hidden = isHidden;
    pile2_3x2.hidden = isHidden;
    pile2_3x3.hidden = isHidden;
}

- (void)changeHiddenPile3:(BOOL)isHidden {
    pile3.hidden = isHidden;
    pileLabel3.hidden = isHidden;
    
    // Pile 3 Sub Squares
    pile3_1x1.hidden = isHidden;
    pile3_1x2.hidden = isHidden;
    pile3_1x3.hidden = isHidden;
    pile3_2x1.hidden = isHidden;
    pile3_2x2.hidden = isHidden;
    pile3_2x3.hidden = isHidden;
    pile3_3x1.hidden = isHidden;
    pile3_3x2.hidden = isHidden;
    pile3_3x3.hidden = isHidden;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [questionLabel setNumberOfLines:3];
    [pileLabel1 setNumberOfLines:2];
    [pileLabel2 setNumberOfLines:2];
    [pileLabel3 setNumberOfLines:2];
    
    [self addBorder:mainTitle width:3.0f radius:0.0f];
    [self addBorder:pile1 width:3.0f radius:0.0f];   
    [self addBorder:pile2 width:3.0f radius:0.0f];
    [self addBorder:pile3 width:3.0f radius:0.0f];
    
    // Pile 1 Sub Squares
    [self addBorder:pile1_1x1 width:1.0f radius:0.0f];
    [self addBorder:pile1_1x2 width:1.0f radius:0.0f];
    [self addBorder:pile1_1x3 width:1.0f radius:0.0f];
    [self addBorder:pile1_2x1 width:1.0f radius:0.0f];
    [self addBorder:pile1_2x2 width:1.0f radius:0.0f];
    [self addBorder:pile1_2x3 width:1.0f radius:0.0f];
    [self addBorder:pile1_3x1 width:1.0f radius:0.0f];
    [self addBorder:pile1_3x2 width:1.0f radius:0.0f];
    [self addBorder:pile1_3x3 width:1.0f radius:0.0f];
    
    
    // Pile 2 Sub Squares
    [self addBorder:pile2_1x1 width:1.0f radius:0.0f];
    [self addBorder:pile2_1x2 width:1.0f radius:0.0f];
    [self addBorder:pile2_1x3 width:1.0f radius:0.0f];
    [self addBorder:pile2_2x1 width:1.0f radius:0.0f];
    [self addBorder:pile2_2x2 width:1.0f radius:0.0f];
    [self addBorder:pile2_2x3 width:1.0f radius:0.0f];
    [self addBorder:pile2_3x1 width:1.0f radius:0.0f];
    [self addBorder:pile2_3x2 width:1.0f radius:0.0f];
    [self addBorder:pile2_3x3 width:1.0f radius:0.0f];
    
    
    // Pile 3 Sub Squares
    [self addBorder:pile3_1x1 width:1.0f radius:0.0f];
    [self addBorder:pile3_1x2 width:1.0f radius:0.0f];
    [self addBorder:pile3_1x3 width:1.0f radius:0.0f];
    [self addBorder:pile3_2x1 width:1.0f radius:0.0f];
    [self addBorder:pile3_2x2 width:1.0f radius:0.0f];
    [self addBorder:pile3_2x3 width:1.0f radius:0.0f];
    [self addBorder:pile3_3x1 width:1.0f radius:0.0f];
    [self addBorder:pile3_3x2 width:1.0f radius:0.0f];
    [self addBorder:pile3_3x3 width:1.0f radius:0.0f];
    
    largeFrame = label0.frame;
    CGFloat scale = 68.0f / MAX(label0.frame.size.width,label0.frame.size.height);
    smallFrame = CGRectMake(0.0, 0.0, label0.frame.size.width * scale, label0.frame.size.height * scale);
    

    if ([self delegate].isNavajo) {
        label8.hidden = true;
        label4.hidden = true;
    }
    
    
    numPiles = 2;
    
    switch (question) {
        case 1:
            backButton.hidden = true;
            questionLabel.text = @"On this page you’ll see each of the labels.  Look at each of them.  Then, click on the label that you think will be most effective in convince you to not start smoking.";
            
            [self changeHiddenPile1:TRUE];
            [self changeHiddenPile3:TRUE];
            break;
        case 2:
            backButton.hidden = true;
            questionLabel.text = @"On this page you’ll see each of the labels.  Look at each of them.  Then, click on the label that you think is most effective in convincing YOU to try to quit smoking.";
            
            
            [self changeHiddenPile1:TRUE];
            [self changeHiddenPile3:TRUE];
            break;
        case 3:
            questionLabel.text = @"Please sort the warning labels into two piles, those meant for someone like you and those for a different kind of person.";
            pileLabel1.text = @"Someone Like You";
            pileLabel3.text = @"Different Kind of Person";
            break;
            
        case 4:
            questionLabel.text = @"Please sort the warning labels into three piles, those mostly for 'someone your age', for 'someone who is younger', and for 'someone who is older'.";
            pileLabel1.text = @"Someone Who is Younger";
            pileLabel2.text = @"Someone Your Age";
            pileLabel3.text = @"Someone Who is Older";
            numPiles = 3;
            break;

        case 5:
            questionLabel.text = @"Please sort the warning labels into two piles, those that make you 'think about quitting' and those that 'do not'.";
            pileLabel1.text = @"Quitting";
            pileLabel3.text = @"Not Quitting";
            break;
            
        case 6:
            questionLabel.text = @"Please sort the warning labels into two piles, those that make you think about 'calling' 1-800-QUIT-NOW and those that do 'not'.";
            pileLabel1.text = @"Calling";
            pileLabel3.text = @"Not Calling";
            break;
        
        case 7:
            questionLabel.text = @"Please sort the warning labels into two piles, those that make you want to 'avoid smoking' and those that do 'not'.";
            pileLabel1.text = @"Avoid Smoking";
            pileLabel3.text = @"Not Avoid Smoking";
            break;
            
        case 8:
            questionLabel.text = @"Please sort the warning labels into two piles, those that would 'make people look down on you because you smoke', and those that would 'not'.";
            pileLabel1.text = @"Make People Look Down on You";
            pileLabel3.text = @"Would Not Look Down on You";
            break;
            
        case 9:
            questionLabel.text = @"Please sort the warning labels into two piles, those that would make you 'think about banning smoking in your home or car', and those that would 'not'.";
            pileLabel1.text = @"Would Make You Think";
            pileLabel3.text = @"Would Not Make You Think";
            break;
        
        default:
            break;
    }
    
    if ( question == [[questionBank lastObject] intValue] ) {
        nextButton.hidden = true;
        finishButton.hidden = false;
    }
     
    if ( numPiles == 2 ) {
        [self changeHiddenPile2:TRUE];
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
    NSInteger index = [questionBank indexOfObject:[NSNumber numberWithInt:question]];
    NSInteger numberToInsert = [[questionBank objectAtIndex:(index-1)] intValue];
    [remainingQuestions insertObject:[NSNumber numberWithInt:numberToInsert] atIndex:0];
    QuestionViewController *nextView = [[QuestionViewController alloc] initWithNibName:@"QuestionViewController" bundle:nil 
                                                                             questions:questionBank questionsToAsk:remainingQuestions];
    [[self delegate] switchView:self.view toView:nextView.view newController:nextView]; 
}

-(void)processFeedback {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [[NSString alloc] initWithFormat:@"%@_%i.txt", [self delegate].userId,question];
    NSString *buffer = [[NSString alloc] initWithFormat:@"%@:\n", questionLabel.text];
    //NSLog(@"Question:\n\t%@",questionLabel.text);
    //NSLog(@"\t%@:",pileLabel1.text);
    buffer = [buffer stringByAppendingFormat:@"\t%@:\n",pileLabel1.text];
    for (NSString* obj in imagesOnPile1) {
        //NSLog(@"\t\t%@",obj);
        buffer = [buffer stringByAppendingFormat:@"\t\t%@\n",obj];
    }
    
    if (numPiles == 3 ) {
        //NSLog(@"\t%@:",pileLabel2.text);
        buffer = [buffer stringByAppendingFormat:@"\t%@:\n",pileLabel2.text];
        for (NSString* obj in imagesOnPile2) {
            //NSLog(@"\t\t%@",obj);
            buffer = [buffer stringByAppendingFormat:@"\t\t%@\n",obj];
        }
        
        //NSLog(@"\t%@:",pileLabel3.text);
        buffer = [buffer stringByAppendingFormat:@"\t%@:\n",pileLabel3.text];
        for (NSString* obj in imagesOnPile3) {
            //NSLog(@"\t\t%@",obj);
            buffer = [buffer stringByAppendingFormat:@"\t\t%@\n",obj];
        }
    } else {
        //NSLog(@"\t%@:",pileLabel3.text);
        buffer = [buffer stringByAppendingFormat:@"\t%@:\n",pileLabel3.text];
        for (NSString* obj in imagesOnPile2) {
            //NSLog(@"\t\t%@",obj);
            buffer = [buffer stringByAppendingFormat:@"\t\t%@\n",obj];
        }        
    }
    
    //NSLog(@"%@\n%@",[[NSString alloc] initWithFormat:@"%@/%@/%@",documentsDirectory,[self delegate].userId, fileName] ,buffer);
    
    [buffer writeToFile:[[NSString alloc] initWithFormat:@"%@/%@/%@",documentsDirectory,[self delegate].userId, fileName] 
             atomically:YES 
               encoding:NSStringEncodingConversionAllowLossy 
                  error:nil];
    
    // Requires an Internet Connection
    // Issue is that we can't expect to have an internet connection for the study that is being performed
    // [[self delegate].dbInterface uploadFile:fileName dir:documentsDirectory userID:[self delegate].userId];
}

-(IBAction)nextQuestion:(id)sender
{
    [self processFeedback];
    QuestionViewController *nextView = [[QuestionViewController alloc] initWithNibName:@"QuestionViewController" bundle:nil 
                                        questions:questionBank questionsToAsk:remainingQuestions];
    [[self delegate] switchView:self.view toView:nextView.view newController:nextView]; 
}

-(IBAction)finishQuiz:(id)sender
{
    [self processFeedback];
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

-(void)removeFromPile:(NSMutableArray*)pile string:(NSString*)key {
    if ( [pile containsObject:key] ) {
        [pile removeObjectIdenticalTo:key];
    }
}


-(BOOL)highlight:(UILabel*)pile objectPoint:(CGPoint)point highlightColor:(UIColor*)color {
    if ( [self withinPile:pile.frame objectPoint:point] == TRUE ) {
        pile.backgroundColor = color;
        return TRUE;
    } else {
        pile.backgroundColor = nil;
        return FALSE;
    }
}

-(CGPoint)getCenter:(CGRect)frame {
    return CGPointMake(frame.origin.x + frame.size.width/2, 
                        frame.origin.y + frame.size.height/2);
}

-(CGPoint)checkHighlight:(CGPoint)point {
    CGPoint retValue = CGPointZero;
    if ( [self highlight:pile1_1x1 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile1_1x1.frame];
    }
    if ([self highlight:pile1_1x2 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile1_1x2.frame];
    }
    if ([self highlight:pile1_1x3 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile1_1x3.frame];
    }
    if ([self highlight:pile1_2x1 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile1_2x1.frame];
    }
    if ([self highlight:pile1_2x2 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile1_2x2.frame];
    }
    if ([self highlight:pile1_2x3 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile1_2x3.frame];
    }
    if ([self highlight:pile1_3x1 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile1_3x1.frame];
    }
    if ([self highlight:pile1_3x2 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile1_3x2.frame];
    }
    if ([self highlight:pile1_3x3 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile1_3x3.frame];
    }
    
    if ([self highlight:pile2_1x1 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile2_1x1.frame];
    }
    if ([self highlight:pile2_1x2 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile2_1x2.frame];
    }
    if ([self highlight:pile2_1x3 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile2_1x3.frame];
    }
    if ([self highlight:pile2_2x1 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile2_2x1.frame];
    }
    if ([self highlight:pile2_2x2 objectPoint:point highlightColor:[UIColor blueColor]] ) {
        retValue = [self getCenter:pile2_2x2.frame];
    }
    if ([self highlight:pile2_2x3 objectPoint:point highlightColor:[UIColor blueColor]] ){
        retValue = [self getCenter:pile2_2x3.frame];
    }
    if ([self highlight:pile2_3x1 objectPoint:point highlightColor:[UIColor blueColor]] ){
        retValue = [self getCenter:pile2_3x1.frame];
    }
    if ([self highlight:pile2_3x2 objectPoint:point highlightColor:[UIColor blueColor]] ){
        retValue = [self getCenter:pile2_3x2.frame];
    }
    if ([self highlight:pile2_3x3 objectPoint:point highlightColor:[UIColor blueColor]] ){
        retValue = [self getCenter:pile2_3x3.frame];
    }

    
    if ([self highlight:pile3_1x1 objectPoint:point highlightColor:[UIColor blueColor]]) {
        retValue = [self getCenter:pile3_1x1.frame];
    }
    if ([self highlight:pile3_1x2 objectPoint:point highlightColor:[UIColor blueColor]] ){
        retValue = [self getCenter:pile3_1x2.frame];
    }
    if ([self highlight:pile3_1x3 objectPoint:point highlightColor:[UIColor blueColor]]) {
        retValue = [self getCenter:pile3_1x3.frame];
    }
    if ([self highlight:pile3_2x1 objectPoint:point highlightColor:[UIColor blueColor]] ){
        retValue = [self getCenter:pile3_2x1.frame];
    }
    if ([self highlight:pile3_2x2 objectPoint:point highlightColor:[UIColor blueColor]] ){
        retValue = [self getCenter:pile3_2x2.frame];
    }
    if ([self highlight:pile3_2x3 objectPoint:point highlightColor:[UIColor blueColor]] ){
        retValue = [self getCenter:pile3_2x3.frame];
    }
    if ([self highlight:pile3_3x1 objectPoint:point highlightColor:[UIColor blueColor]]) {
        retValue = [self getCenter:pile3_3x1.frame];
    }
    if ([self highlight:pile3_3x2 objectPoint:point highlightColor:[UIColor blueColor]]) {
        retValue = [self getCenter:pile3_3x2.frame];
    }
    if ([self highlight:pile3_3x3 objectPoint:point highlightColor:[UIColor blueColor]]) {
        retValue = [self getCenter:pile3_3x3.frame];
    }
    
    return retValue;
}


- (IBAction)imageReleased:(id)sender withEvent:(UIEvent*) event{
    
    [self.view bringSubviewToFront:(UIView*)sender];
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    UIControl *control = sender;
    
    NSUInteger pileNumber = 0;
    
    if ( [self withinPile:pile1.frame objectPoint:point] == TRUE ) {
        //NSLog(@"Released Within Pile 1!");
        pileNumber = 1;
        //control.center = CGPointMake(pile1.frame.origin.x + pile1.frame.size.width/2, 
                                    // pile1.frame.origin.y + pile1.frame.size.height/2);
    }
    
    // Special Case if 3 piles
    if (numPiles == 3 ) {
        if ( [self withinPile:pile2.frame objectPoint:point] == TRUE ) {
            //NSLog(@"Released Within Pile 2!");
            //control.center = CGPointMake(pile2.frame.origin.x + pile2.frame.size.width/2, 
                   //                      pile2.frame.origin.y + pile2.frame.size.height/2);
            pileNumber = 2;
        }
        
        if ( [self withinPile:pile3.frame objectPoint:point] == TRUE ) {
            //NSLog(@"Released Within Pile 3!");
            //control.center = CGPointMake(pile3.frame.origin.x + pile3.frame.size.width/2, 
                 //                        pile3.frame.origin.y + pile3.frame.size.height/2);
            pileNumber = 3;
        }
    } else {
        if ( [self withinPile:pile3.frame objectPoint:point] == TRUE ) {
            //NSLog(@"Released Within Pile 2!");
            //control.center = CGPointMake(pile3.frame.origin.x + pile3.frame.size.width/2, 
               //                          pile3.frame.origin.y + pile3.frame.size.height/2);
            pileNumber = 2;
        }
    }
    
    NSString* labelText = ((UIButton*)sender).titleLabel.text;
    
    switch (pileNumber) {
        case 0:
            [self removeFromPile:imagesOnPile1 string:labelText];
            [self removeFromPile:imagesOnPile2 string:labelText];
            [self removeFromPile:imagesOnPile3 string:labelText];
            break;
        case 1:
            [self removeFromPile:imagesOnPile2 string:labelText];
            [self removeFromPile:imagesOnPile3 string:labelText];
            [imagesOnPile1 addObject:labelText];
            break;
        case 2:
            [self removeFromPile:imagesOnPile1 string:labelText];
            [self removeFromPile:imagesOnPile3 string:labelText];
            [imagesOnPile2 addObject:labelText];
            break;
        case 3:
            [self removeFromPile:imagesOnPile1 string:labelText];
            [self removeFromPile:imagesOnPile2 string:labelText];
            [imagesOnPile3 addObject:labelText];
            break;
    }
    
    // Ugly ignore this too
    CGPoint retVal = [self checkHighlight:point];
    [self checkHighlight:(CGPointZero)];
    if ( retVal.x != CGPointZero.x && retVal.y != CGPointZero.y ) {
        // Subview is highlights.  Snap to that point
        control.center = retVal;
    }
    pile1.backgroundColor = nil;
    pile2.backgroundColor = nil;
    pile3.backgroundColor = nil;
}

- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event
{
    
    // Special Case of only Selecting an Image
    if ( question < 3 ) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains
        (NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSString *fileName = [[NSString alloc] initWithFormat:@"%@_%i.txt", [self delegate].userId,question];
        NSString* selectedLabel = ((UIButton*)sender).titleLabel.text;
        [selectedLabel writeToFile:[[NSString alloc] initWithFormat:@"%@/%@/%@",documentsDirectory,[self delegate].userId, fileName] 
                 atomically:YES 
                   encoding:NSStringEncodingConversionAllowLossy 
                      error:nil];

        QuestionViewController *nextView = [[QuestionViewController alloc] initWithNibName:@"QuestionViewController" bundle:nil 
                                                                                 questions:questionBank questionsToAsk:remainingQuestions];
        [[self delegate] switchView:self.view toView:nextView.view newController:nextView]; 
        
        
        return;
    }
    
    [self.view bringSubviewToFront:(UIView*)sender];
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    UIControl *control = sender;
    control.center = point;
    BOOL bInPile = false;
    
    if ( [self highlight:pile1 objectPoint:point highlightColor:[UIColor darkGrayColor]] ) {
        bInPile = true;
    }
    
    // Special Case if 3 piles
    if (numPiles == 3 ) {
        if ( [self highlight:pile2 objectPoint:point highlightColor:[UIColor darkGrayColor]] ) {
            bInPile = true;
        }
        if ( [self highlight:pile3 objectPoint:point highlightColor:[UIColor darkGrayColor]] ) {
            bInPile = true;
        }
    } else {
        if ( [self highlight:pile3 objectPoint:point highlightColor:[UIColor darkGrayColor]] ) {
            bInPile = true;
        }
    }
    
    [self checkHighlight:point];
    
    if (bInPile) {
        ((UIButton*)sender).frame = [self getSmallFrame:((UIButton*)sender).frame];
    } else {
        ((UIButton*)sender).frame = [self getLargeFrame:((UIButton*)sender).frame];
    }
}

-(CGRect) getSmallFrame:(CGRect)curFrame {
    return CGRectMake(curFrame.origin.x, curFrame.origin.y,smallFrame.size.width, smallFrame.size.height);
}


-(CGRect) getLargeFrame:(CGRect)curFrame {
    return CGRectMake(curFrame.origin.x, curFrame.origin.y,largeFrame.size.width, largeFrame.size.height);
}

@end
