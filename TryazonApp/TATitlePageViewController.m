//
//  TATitlePageViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 2/21/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TATitlePageViewController.h"
#import <Parse/Parse.h>
#import "TALogInViewController.h"
#import "TALoginPresenter.h"
@interface TATitlePageViewController() <PFLogInViewControllerDelegate>


@property(nonatomic, strong)PFUser *currentUser;

@end

@implementation TATitlePageViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self resetUserLabel];
}

- (void)viewDidAppear:(BOOL)animated {
    [TALoginPresenter logInNeeded:self];
}

-(void)resetUserLabel {
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        self.currentUserLabel.text = currentUser.username;
    }
    else {
        self.currentUserLabel.text = @"No user logged in.";
    }
}

- (IBAction)logOutButton:(id)sender {
    
    [PFUser logOut];
    [self resetUserLabel];
    //[TALoginPresenter logInNeeded:self];
}

-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user{
    
    [logInController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
