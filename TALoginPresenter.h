//
//  TALoginPresenter.h
//  TryazonApp
//
//  Created by Dustin Flanary on 3/17/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "TALogInViewController.h"


@interface TALoginPresenter : NSObject

+ (void)logInNeeded:(UIViewController<PFLogInViewControllerDelegate> *)viewController;

+(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user;


@end
