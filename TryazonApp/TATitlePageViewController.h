//
//  TATitlePageViewController.h
//  TryazonApp
//
//  Created by Dustin Flanary on 2/21/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TATitlePageViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *signUpLogInButton;
@property (strong, nonatomic) IBOutlet UILabel *currentUserLabel;
@property (strong, nonatomic) IBOutlet UIButton *logOutButton;

- (IBAction)logInPressed:(id)sender;
//+ (void) logIn;

@end
