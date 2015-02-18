//
//  SurveyDetailViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 2/17/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "SurveyDetailViewController.h"

@interface SurveyDetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *viewSurvey;

@end

@implementation SurveyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *fullURL = @"https://www.tryazon.com/gourmet-souffle-party-closing-survey/";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.viewSurvey loadRequest:requestObj];
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
