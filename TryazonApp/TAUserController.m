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


- (NSString *)getSurveyURLForCurrentUser {
    [[PFUser currentUser] fetchInBackgroundWithBlock:^(PFObject *object, NSError *error) {
    
    }];
    
    PFUser *user = [PFUser currentUser];
    [user fetch];
    PFObject *party = user[@"partyhosting"];
    NSString *partyURL = party[@"surveyurl"];
    
    return partyURL;
}

- (PFFile *)getPDFForCurrentUser {
    PFUser *user = [PFUser currentUser];
    PFObject *party = user[@"partyhosting"];
    //PFFile *partyPDF = party[@"partypdf"];
    
    return nil;
}

@end
