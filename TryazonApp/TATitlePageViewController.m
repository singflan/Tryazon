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

@interface TATitlePageViewController() <PFLogInViewControllerDelegate>


@property(nonatomic, strong)PFUser *currentUser;

@end

@implementation TATitlePageViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    if (![PFUser currentUser]) {
//        [self performSegueWithIdentifier:@"logInSegue" sender:self];
//    }
//    else
//    {
//       // NSLog(@"%@", currentUser.username)
//    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self resetUserLabel];
}


- (IBAction)logInPressed:(id)sender {
    
    TALogInViewController *controller = [[TALogInViewController alloc] init];
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
    
    

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
    //PFUser *currentUser = [PFUser currentUser];
    [self resetUserLabel];
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
