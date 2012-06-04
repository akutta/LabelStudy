//
//  QuestionViewController.h
//  LabelStudy
//
//  Created by Andrew Kutta on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController {
    IBOutlet UIButton *backButton, *nextButton;
    NSUInteger question;
    
    IBOutlet UIButton *label0, *label1, *label2, *label3, *label4, *label5, *label6, *label7, *label8;
    
    IBOutlet UILabel *mainTitle, *questionLabel;
    
    
    NSUInteger numPiles;
    IBOutlet UILabel *pileLabel1, *pileLabel2, *pileLabel3;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil question:(NSUInteger)currentQuestion;
-(IBAction)lastQuestion:(id)sender;
-(IBAction)nextQuestion:(id)sender;

@end
