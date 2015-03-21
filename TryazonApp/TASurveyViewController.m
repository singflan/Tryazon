//
//  TASurveyControllerViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 2/14/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TASurveyViewController.h"
#import "TALoginPresenter.h"
#import "TALogInViewController.h"
#import <Parse/Parse.h>

@interface TASurveyViewController ()



@end

@implementation TASurveyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
   // [TALoginPresenter logInNeeded:self];
}

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user{
    [logInController dismissViewControllerAnimated:YES completion:^{
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
