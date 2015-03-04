//
//  TAUserController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 2/21/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TAUserController.h"

@implementation TAUserController

PFUser *user = [PFUser currentUser];
PFRelation *relation = [user relationForKey:@"parties"];
[relation addObject:party];
[user saveInBackground];

@end
