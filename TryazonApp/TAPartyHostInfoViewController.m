//
//  TAPartyHostInfoViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 3/3/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TAPartyHostInfoViewController.h"
#import "TAUserController.h"
#import "TALoginPresenter.h"
#import "TAPDFView.h"


@interface TAPartyHostInfoViewController () 
@property (nonatomic, strong) PFFile *partyPDF;
@property (nonatomic, strong) NSData *partyPDFData;
@property (strong, nonatomic) IBOutlet UIWebView *webViewForPDF;

@end

@implementation TAPartyHostInfoViewController
@synthesize loadingIndicator;

- (void)viewDidAppear:(BOOL)animated {
    [TALoginPresenter logInNeeded:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webViewForPDF.delegate = self;
    
    // Conceptually if (!event) { put label that says : Choose event on first page arrow to first tab}   
    
    [[TAUserController sharedInstance] getPDFForCurrentUserCallback:^(PFFile *incomingPDF) {
        self.partyPDF = incomingPDF;
        self.partyPDFData = [self.partyPDF getData];
        
        // Add & format the loading indicator
        [loadingIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [loadingIndicator setHidesWhenStopped:YES];
        [self.webViewForPDF addSubview:loadingIndicator];
       
        [self.webViewForPDF loadData:self.partyPDFData MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
        //self.webViewForPDF.setBuiltInZoomControls(true);
        self.webViewForPDF.scalesPageToFit = YES;
        [self.view addSubview:self.webViewForPDF];
        
    }];

}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [loadingIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [loadingIndicator stopAnimating];
    loadingIndicator.hidden = YES;
}

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user{
    
    [logInController dismissViewControllerAnimated:YES completion:^{
        
    }];
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
