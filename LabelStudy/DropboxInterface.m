//
//  DropboxInterface.m
//  LabelStudy
//
//  Created by Andrew Kutta on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DropboxInterface.h"
#import <DropboxSDK/DropboxSDK.h>


//#define kDBAppKey @"l20yc2w3q5ala1g"
#define kDBAppKey @"eln8t6s48ncqzce"
//#define kDBAppSecret @"rgksxexn6dsd0y1"
#define kDBAppSecret @"f0sm26zy5kazajt"


@implementation DropboxInterface 

- (DBRestClient *)restClient {
    if (!restClient) {
        restClient = [[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
        restClient.delegate = self;
    }
    return restClient;
}

-(void)unlinkAccount {
    [[DBSession sharedSession] unlinkAll];
}

-(void)linkAccount:(UIWindow*)window {
    
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:window.rootViewController];
    }
}

// Should be called from AppDelegate
-(void)initializeDropbox:(UIWindow*)window {
    
    errorCounter = 0;
    uploadCounter = 0;
    maxUploads = 0;
    numUsers = 0;
    
    DBSession* dbSession = [[DBSession alloc]  initWithAppKey:kDBAppKey
                                                    appSecret:kDBAppSecret
                                                         root:kDBRootAppFolder]; // either kDBRootAppFolder or kDBRootDropbox
    [DBSession setSharedSession:dbSession];
    
    [self linkAccount:window];
}

-(void)uploadFile:(NSString*)fileName dir:(NSString*)documentsDir userID:(NSString*)usrID {
    NSString *destDir = [[NSString alloc] initWithFormat:@"/%@/",usrID];
    [[self restClient] uploadFile:fileName toPath:destDir
                    withParentRev:nil fromPath:[documentsDir stringByAppendingFormat:@"/%@",fileName]];
}



- (NSArray *) getFilesInDirectory: (NSString *) categoryDirectory  {
    // Get the file names
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:categoryDirectory error:&error];
    if ( files == nil ) {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
        return nil;
    }
    return files;
}


-(void)uploadAllFiles {
    numUsers = 0;
    uploadCounter = 0;
    maxUploads = 0;
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSArray* directories = [self getFilesInDirectory:documentsDirectory];
    
    for ( NSString* directory in directories ) {
        NSArray* files = [self getFilesInDirectory:[documentsDirectory stringByAppendingFormat:@"/%@/",directory]];
        numUsers += 1;
        for ( NSString* file in files ) {
            NSLog(@"/%@/%@",directory,file);
            uploadCounter += 1;
            maxUploads +=1;
            [self uploadFile:file dir:[documentsDirectory stringByAppendingFormat:@"/%@/",directory] userID:directory];
        }
    }
}

- (void)alertFinished {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Finished"
                                                    message:[[NSString alloc] initWithFormat:@"Dropbox Upload Finished Uploading %i Users (%i Files) with %i Errors!",numUsers,maxUploads, errorCounter]
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)restClient:(DBRestClient*)client uploadedFile:(NSString*)destPath
              from:(NSString*)srcPath metadata:(DBMetadata*)metadata {
    uploadCounter -= 1;
    NSLog(@"File uploaded successfully to path: %@", metadata.path);
    
    if ( uploadCounter == 0 ) {
        [self alertFinished];
    }

}

- (void)restClient:(DBRestClient*)client uploadFileFailedWithError:(NSError*)error {
    uploadCounter -= 1;
    errorCounter += 1;
    NSLog(@"File upload failed with error - %@", error);
    
    if ( uploadCounter == 0 ) {
        [self alertFinished];
    }
}

@end
