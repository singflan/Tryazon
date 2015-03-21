//
//  TAChecklist.h
//  TryazonApp
//
//  Created by Dustin Flanary on 3/20/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface TAChecklist : NSObject

@property (strong, nonatomic) NSArray *prePartyPlanning;
@property (strong, nonatomic) NSArray *weekOfParty;
@property (strong, nonatomic) NSArray *dayOfParty;
@property (strong, nonatomic) NSArray *afterParty;
- (id)initWithPFObject: (PFObject *)object;


@end
