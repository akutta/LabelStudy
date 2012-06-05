//
//  SurveyViewController.h
//  LabelStudy
//
//  Created by Andrew Kutta on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SurveyViewController : UIViewController {
    IBOutlet UILabel* question1, *question2, *question3, *question4;
    IBOutlet UISegmentedControl* answerQ1, *answerQ2, *answerQ3, *answerQ4;
}


-(IBAction)beginStudy:(id)sender;

@end
