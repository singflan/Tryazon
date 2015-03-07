//
//  TAUserController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 2/21/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TAUserController.h"

@implementation TAUserController



+ (TAUserController *)sharedInstance {
    static TAUserController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TAUserController alloc] init];
        
    });
    return sharedInstance;
}


- (void)getSurveyURLForCurrentUsercallback:(void (^)(NSString *))callback{
    [[PFUser currentUser] fetchInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        [[object objectForKey:@"partyhosting"] fetchInBackgroundWithBlock:^(PFObject *object, NSError *error) {
            if (!error){
                NSString *partyURL = [object objectForKey:@"surveyurl"];
                callback(partyURL);
            }
            else {
                NSLog(@"You got an error retrieving the URL");
            }
        }];
        
    }];
    
    //[[PFUser currentUser] fetchInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        
      //  PFUser *user = [PFUser currentUser];
    
        
        
        

    //NSString *partyURL = party[@"surveyurl"];
    //return self.partyURL;
//    PFUser *user = [PFUser currentUser];
//    [user fetch];
    
    
}

- (PFFile *)getPDFForCurrentUser {
    PFUser *user = [PFUser currentUser];
    PFObject *party = user[@"partyhosting"];
    //PFFile *partyPDF = party[@"partypdf"];
    
    return nil;
}

@end
