//
//  ViewController.h
//  LabelStudy
//
//  Created by Andrew Kutta on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UITextField* userID, *userAge;
    IBOutlet UILabel* instructionLabel;
    IBOutlet UISegmentedControl* isNavajo;
}

-(IBAction)beginStudy:(id)sender;
@end
