//
//  SurveyDetailViewController.h
//  TryazonApp
//
//  Created by Dustin Flanary on 2/17/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SurveyDetailViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
