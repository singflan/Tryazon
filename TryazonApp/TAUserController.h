//
//  TAUserController.h
//  TryazonApp
//
//  Created by Dustin Flanary on 2/21/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>


@interface TAUserController : NSObject

+ (TAUserController *)sharedInstance;

- (void)getSurveyURLForCurrentUserCallback:(void (^)(NSString *))callback;
- (void)getPDFForCurrentUserCallback:(void (^)(PFFile *))callback;


@end
