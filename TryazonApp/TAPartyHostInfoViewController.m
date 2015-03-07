//
//  TAPartyHostInfoViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 3/3/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TAPartyHostInfoViewController.h"
#import "TAUserController.h"
#import "TAPDFView.h"


@interface TAPartyHostInfoViewController ()
@property (nonatomic, strong) PFFile *partyPDF;
@property (nonatomic, strong) NSData *partyPDFData;

@end

@implementation TAPartyHostInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[TAUserController sharedInstance] getPDFForCurrentUserCallback:^(PFFile *incomingPDF) {
        self.partyPDF = incomingPDF;
        self.partyPDFData = [self.partyPDF getData];
        //[[TAPDFView alloc] drawRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
//        TAPDFView *pdfView = [[TAPDFView alloc] initWithFrame:CGRectMake self.partyPDFData];
        NSInteger pageNums = 16;
        
        CGFloat yOrigin = 0;
        
        for (int i = 1; i <= pageNums; i++){
            TAPDFView *pdfView = [[TAPDFView alloc] initWithFrame:CGRectMake(0, yOrigin, self.view.frame.size.width, self.view.frame.size.height) data:self.partyPDFData pageNum:i];
            yOrigin = yOrigin + self.view.frame.size.height;
            [self.view addSubview:pdfView];
        }
    
        //create a scrollview to see them all
        
        
    }];

    //PFFile *partyPDF = anotherApplication[@"partypdf"];
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
