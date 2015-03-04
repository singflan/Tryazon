//
//  TASignUpViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 2/28/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TASignUpViewController.h"

@interface TASignUpViewController ()

@end

@implementation TASignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor cyanColor];
    
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Tryazon-logo2a.png"]];
    self.signUpView.logo = logoView; // logo can be any UIView
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
