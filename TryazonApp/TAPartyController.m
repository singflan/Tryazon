//
//  TAPartyController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 3/3/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TAPartyController.h"

@interface TAPartyController ()

@property (nonatomic, strong) NSArray *parties;

@end

@implementation TAPartyController

+ (TAPartyController *)sharedInstance {
    static TAPartyController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TAPartyController alloc] init];
        
        //[sharedInstance <#loadFromDefaults#>];
    });
    return sharedInstance;
}

- (NSArray *)getParties {
    return self.parties;
}

- (void)addParty: (TAParty *)party {
    
    if (self.parties == nil) self.parties = [NSArray new];
    
    NSMutableArray *mutableParties = self.parties.mutableCopy;
    [mutableParties addObject:party];
    self.parties = mutableParties;
}

@end
