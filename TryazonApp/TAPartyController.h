//
//  TAPartyController.h
//  TryazonApp
//
//  Created by Dustin Flanary on 3/3/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TAParty.h"

@interface TAPartyController : NSObject

@property (strong, nonatomic) TAParty *currentParty;

+ (TAPartyController *)sharedInstance;
- (NSArray *)getParties;
- (void)addParty: (TAParty *)party;

@end
