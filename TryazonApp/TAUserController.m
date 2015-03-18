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

- (void)getSurveyURLForCurrentUserCallback:(void (^)(NSString *))callback {
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
}

- (void)getPDFForCurrentUserCallback:(void (^)(PFFile *))callback {
    [[PFUser currentUser] fetchInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        [[object objectForKey:@"partyhosting"] fetchInBackgroundWithBlock:^(PFObject *object, NSError *error) {
            if (!error){
                PFFile *partyPDF = [object objectForKey:@"partypdf"];
                callback(partyPDF);
            }
            else {
                NSLog(@"You got an error retrieving the pdf file");
            }
        }];
        
    }];
}

//- (void)getNumberOfPDFPagesCallback:(void (^)(NSNumber *))callback {
//    [[PFUser currentUser] fetchInBackgroundWithBlock:^(PFObject *object, NSError *error) {
//        [[object objectForKey:@"partyhosting"] fetchInBackgroundWithBlock:^(PFObject *object, NSError *error) {
//            if (!error){
//                NSNumber *numOfPages = [object objectForKey:@"pdfnumberofpages"];
//                callback(numOfPages);
//            }
//            else {
//                NSLog(@"You got an error retrieving the pdf file");
//            }
//        }];
//        
//    }];
//}
@end
