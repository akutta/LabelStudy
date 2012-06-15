//
//  DropboxInterface.h
//  LabelStudy
//
//  Created by Andrew Kutta on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DropboxSDK/DropboxSDK.h>

@interface DropboxInterface : NSObject  <DBRestClientDelegate>{
    DBRestClient *restClient;
    NSInteger uploadCounter, maxUploads, numUsers;
    NSInteger errorCounter;
}

-(void)initializeDropbox:(UIWindow*)window;
-(void)uploadFile:(NSString*)fileName dir:(NSString*)documentsDir userID:(NSString*)usrID;
-(void)uploadAllFiles;
-(void)unlinkAccount;
-(void)linkAccount:(UIWindow*)window;
@end
