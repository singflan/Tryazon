//
//  TALogInViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 2/26/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//


#import "TALogInViewController.h"
#import "TASignUpViewController.h"

@interface TALogInViewController() <PFSignUpViewControllerDelegate>

@end

@implementation TALogInViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    self.logInView.usernameField.placeholder = @"Email Address";
    self.logInView.passwordField.placeholder = @"Password/PIN";
    
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Tryazon-logo2a.png"]];
    self.logInView.logo = logoView; // logo can be any UIView
    
    self.signUpController = [[TASignUpViewController alloc] init];
    self.signUpController.delegate = self;

    self.signUpController.fields = (PFSignUpFieldsUsernameAndPassword
                               | PFSignUpFieldsSignUpButton
                               | PFSignUpFieldsDismissButton);
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //self.logInView.logInButton.frame = CGRectMake(...); // Set a different frame.
}





@end