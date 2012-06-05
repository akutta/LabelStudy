//
//  QuestionViewController.h
//  LabelStudy
//
//  Created by Andrew Kutta on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController {
    IBOutlet UIButton *backButton, *nextButton, *finishButton;
    NSUInteger question;
    
    IBOutlet UIButton *label0, *label1, *label2, *label3, *label4, *label5, *label6, *label7, *label8;
    IBOutlet UILabel *mainTitle, *questionLabel;
    IBOutlet UILabel *pile1, *pile2, *pile3;
    
    NSUInteger numPiles;
    IBOutlet UILabel *pileLabel1, *pileLabel2, *pileLabel3;
    
    NSMutableArray *imagesOnPile1, *imagesOnPile2, *imagesOnPile3;
    
    NSMutableArray *remainingQuestions;
    NSArray        *questionBank;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
            questions:(NSArray*)QuestionBank questionsToAsk:(NSMutableArray*)futureQuestions;
-(IBAction)lastQuestion:(id)sender;
-(IBAction)nextQuestion:(id)sender;
-(IBAction)finishQuiz:(id)sender;

@end
