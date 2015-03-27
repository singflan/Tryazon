//
//  TAPartyHostInfoViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 3/3/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TAPartyHostInfoViewController.h"
#import "TAPDFView.h"
#import "TAPartyController.h"
#import "TANetworkController.h"

@interface TAPartyHostInfoViewController ()
@property (nonatomic, strong) TAParty *currentParty;
//@property (nonatomic, strong) PFFile *partyPDF;
@property (nonatomic, strong) NSData *partyPDFData;
@property (strong, nonatomic) IBOutlet UIWebView *webViewForPDF;
@property (weak, nonatomic) IBOutlet UILabel *failedToLoadLabel;

@end

@implementation TAPartyHostInfoViewController
@synthesize loadingIndicator;

- (void)viewDidAppear:(BOOL)animated {
    //[TALoginPresenter logInNeeded:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    if ([TAPartyController sharedInstance].currentParty) {
        loadingIndicator.hidden = YES;
        self.webViewForPDF.delegate = self;
        self.currentParty = [TAPartyController sharedInstance].currentParty;
        
        if (!self.currentParty.pdfFile) {
            _failedToLoadLabel.text = @"This party has no PDF available at this time";
            
        } else{
            loadingIndicator.hidden = NO;
            [loadingIndicator startAnimating];
    
            [[TANetworkController sharedInstance] getPDFForCurrentParty:self.currentParty.pdfFile Callback:^(NSData *pdfData) {
                self.failedToLoadLabel.text = @"";
                [loadingIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
                [loadingIndicator setHidesWhenStopped:YES];
            
                [self.webViewForPDF addSubview:loadingIndicator];
            
                [self.webViewForPDF loadData:pdfData MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
            //self.webViewForPDF.setBuiltInZoomControls(true);
                self.webViewForPDF.scalesPageToFit = YES;
                [self.view addSubview:self.webViewForPDF];
            }];
        }
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [loadingIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [loadingIndicator stopAnimating];
    loadingIndicator.hidden = YES;
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
