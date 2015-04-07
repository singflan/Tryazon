//
//  TANetworkController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 3/20/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TANetworkController.h"
#import "TAParty.h"
#import "TAPartyController.h"
#import "TAChecklist.h"

@implementation TANetworkController

+ (TANetworkController *)sharedInstance {
    static TANetworkController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TANetworkController alloc] init];
        
       // [sharedInstance <#loadFromDefaults#>];
    });
    return sharedInstance;
}

- (void)getParties:(void (^)(BOOL finished))callback {
    PFQuery *query = [PFQuery queryWithClassName:@"Party"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            //NSLog(@"Successfully retrieved %ld parties.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                TAParty *party = [[TAParty alloc] initWithPFObject:object];
                [[TAPartyController sharedInstance] addParty:party];

            }
            BOOL mybool = YES;
            callback (mybool);
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void)getPDFForCurrentParty:(PFFile *)pdf Callback:(void (^)(NSData *))callback {
    
    [pdf getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        callback (data);
    }];
}

- (void)getChecklistForCurrentParty:(NSString *)checklistID Callback:(void (^)(TAChecklist *))callback {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Checklist"];
    [query getObjectInBackgroundWithId:checklistID block:^(PFObject *object, NSError *error) {
        TAChecklist *checklist = [[TAChecklist alloc] initWithPFObject:object];
        callback (checklist);
    }];
}

//- (void)getImageForCurrentParty:(PFFile *)image Callback:(void (^)(NSData *))callback {
//    [image getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
//        callback (data);
//    }];
//}
@end
