//
//  SurveyDetailViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 2/17/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "SurveyDetailViewController.h"
#import "TAUserController.h"

@interface SurveyDetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *viewSurvey;
@property (nonatomic, strong) NSString *surveyURL;

@end

@implementation SurveyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    NSString *surveyURL = [[TAUserController sharedInstance] getSurveyURLForCurrentUser];
    
  //  NSString *fullURL = @"https://www.tryazon.com/gourmet-souffle-party-closing-survey/";
    NSURL *url = [NSURL URLWithString:surveyURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.viewSurvey loadRequest:requestObj];
    
    
//    NSURL *URL = [NSURL URLWithString:@"http://example.com"];
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:URL];
//    [manager GET:@"/resources" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        [resources addObjectsFromArray:responseObject[@"resources"]];
//        
//        [manager SUBSCRIBE:@"/resources" usingBlock:^(NSArray *operations, NSError *error) {
//            for (AFJSONPatchOperation *operation in operations) {
//                switch (operation.type) {
//                    case AFJSONAddOperationType:
//                        [resources addObject:operation.value];
//                        break;
//                    default:
//                        break;
//                }
//            }
//        } error:nil];
//    } failure:nil];
    
    
}


//add a way to add photos from device

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
