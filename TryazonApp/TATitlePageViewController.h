//
//  TATitlePageViewController.h
//  TryazonApp
//
//  Created by Dustin Flanary on 2/21/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TATitlePageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *signUpLogInButton;
@property (weak, nonatomic) IBOutlet UILabel *currentUserLabel;
@property (weak, nonatomic) IBOutlet UIButton *logOutButton;


- (IBAction)logInPressed:(id)sender;
//+ (void) logIn;

@end
