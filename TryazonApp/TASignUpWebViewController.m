//
//  TASignUpWebViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 3/26/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TASignUpWebViewController.h"

@interface TASignUpWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *signUpWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@end

@implementation TASignUpWebViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.indicator setHidesWhenStopped:YES];
    [self.signUpWebView addSubview:_indicator];
    
    self.signUpWebView.delegate = self;
    
    [_indicator startAnimating];
    NSURL *url = [NSURL URLWithString:@"https://www.tryazon.com/host-sign-up-form/"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.signUpWebView loadRequest:requestObj];
    
   // [self.signUpWebView addSubview:_indicator];
    [_indicator stopAnimating];

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
