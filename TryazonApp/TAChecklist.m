//
//  TAChecklist.m
//  TryazonApp
//
//  Created by Dustin Flanary on 3/20/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TAChecklist.h"

@implementation TAChecklist

- (id)initWithPFObject: (PFObject *)object {
    self.prePartyPlanning = object[@"prePartyPlanning"];
    self.weekOfParty = object[@"weekOfParty"];
    
    self.dayOfParty = object[@"dayOfParty"];
    
    self.afterParty = object[@"afterParty"];
    
    return self;
}


@end

