//
//  AppDelegate.h
//  LabelStudy
//
//  Created by Andrew Kutta on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DropboxSDK/DropboxSDK.h>
#import "DropboxInterface.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSString* userID;
    NSInteger userAge;
    BOOL isNavajo, isSmoker;
    DBSession* dbSession;
    
    DropboxInterface *dbInterface;
}

-(void)switchView:(UIView *)view1 toView:(UIView*)view2 newController:(id)controller;

@property (nonatomic, retain) NSString* userId;
@property (nonatomic) NSInteger userAge;
@property (nonatomic) BOOL isNavajo;
@property (nonatomic) BOOL isSmoker;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (nonatomic, retain) DropboxInterface* dbInterface;

@end
