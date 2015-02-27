//
//  TATitlePageViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 2/21/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TATitlePageViewController.h"
#import <ParseUI/ParseUI.h>

@implementation TATitlePageViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    PFUser *currentUser = [PFUser currentUser];
//    if (!currentUser) {
//        [self logIn];
//    } else {
//    
//    }

//    self.view.backgroundColor = [UIColor randomColor];
//    PFUser *currentUser = [PFUser currentUser];
//    
//
}

-(void)logIn {
        
    PFLogInViewController *logInController = [[PFLogInViewController alloc] init];
    logInController.delegate = self;
    [self presentViewController:logInController animated:YES completion:nil];
    
}

- (IBAction)logInPressed:(id)sender {
    
//    PFSignUpViewController *controller = [[PFSignUpViewController alloc] init];
//    controller.delegate = self; //am I supposed to put this code inside a PFSignUpViewController that I create?
//    [self presentViewController:controller animated:YES completion:nil];
//
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)myMethod {
//    PFUser *user = [PFUser user];
//    user.username = @"my name";
//    user.password = @"my pass";
//    user.email = @"email@example.com";
//    
//    // other fields can be set just like with PFObject
//    user[@"phone"] = @"415-392-0202";
//    
//    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (!error) {
//            // Hooray! Let them use the app now.
//        } else {
//            NSString *errorString = [error userInfo][@"error"];
//            // Show the errorString somewhere and let the user try again.
//        }
//    }];
//}


@end
