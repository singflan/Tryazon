//
//  TANetworkController.h
//  TryazonApp
//
//  Created by Dustin Flanary on 3/20/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "TAChecklist.h"

@interface TANetworkController : NSObject

+ (TANetworkController *)sharedInstance;
- (void)getParties:(void (^)(BOOL finished))callback;
- (void)getPDFForCurrentParty:(PFFile *)pdf Callback:(void (^)(NSData *))callback;
- (void)getChecklistForCurrentParty:(NSString *)checklistID Callback:(void (^)(TAChecklist *))callback;
@end
