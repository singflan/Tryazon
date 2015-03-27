//
//  SurveyDetailViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 2/17/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "SurveyDetailViewController.h"
#import "TAPartyController.h"

@interface SurveyDetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *viewSurvey;
@property (nonatomic, strong) NSString *surveyURL;
@property (weak, nonatomic) IBOutlet UILabel *failedToLoadLabel;
@property (nonatomic) TAParty *party;

@end

@implementation SurveyDetailViewController
@synthesize activityIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    activityIndicator.hidden = YES;
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator setHidesWhenStopped:YES];

    if ([TAPartyController sharedInstance].currentParty) {
        self.party = [TAPartyController sharedInstance].currentParty;
    // Do any additional setup after loading the view.
        self.viewSurvey.delegate = self;
        self.failedToLoadLabel.text = @"";
    
        if (!self.party.partySurveyURL) {
            _failedToLoadLabel.text = @"This party has no survey available at this time";
            
        } else{
            activityIndicator.hidden = NO;
            [activityIndicator startAnimating];
        
            NSURL *url = [NSURL URLWithString:_party.partySurveyURL];
            NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
            [self.viewSurvey loadRequest:requestObj];
            
            [activityIndicator stopAnimating];
            
            //[self.viewSurvey addSubview:activityIndicator];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma spinner
- (void)webViewDidStartLoad:(UIWebView *)searchWebView {
    
    [activityIndicator startAnimating];
}

- (void)webView:(UIWebView *)searchWebView didFailLoadWithError:(NSError *)error {
    
    [activityIndicator stopAnimating];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)searchWebView {
    
    [activityIndicator stopAnimating];
    activityIndicator.hidden = YES;
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
