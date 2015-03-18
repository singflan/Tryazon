//
//  TALoginPresenter.m
//  TryazonApp
//
//  Created by Dustin Flanary on 3/17/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TALoginPresenter.h"

@implementation TALoginPresenter

+ (void)logInNeeded:(UIViewController<PFLogInViewControllerDelegate> *)viewController {
    PFUser *currentUser = [PFUser currentUser];
    if (!currentUser) {
        TALogInViewController *controller = [[TALogInViewController alloc] init];
        controller.delegate = viewController;
        controller.fields = (PFLogInFieldsUsernameAndPassword
                            | PFLogInFieldsPasswordForgotten
                            | PFLogInFieldsLogInButton
                            | PFLogInFieldsSignUpButton);
        [viewController presentViewController:controller animated:NO completion:nil];
    }
    else
    {
        NSLog(@"Nothing is happening");
        
    }

}


@end
