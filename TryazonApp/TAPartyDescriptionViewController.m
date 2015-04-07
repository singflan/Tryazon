//
//  TAPartyDescriptionViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 4/6/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TAPartyDescriptionViewController.h"
#import "TAPartyController.h"
#import "TANetworkController.h"
#import "UIColor+ExtraColorTools.h"

@interface TAPartyDescriptionViewController ()
@property (weak, nonatomic) IBOutlet UILabel *partyTitleLabel;
@property (weak, nonatomic) TAParty *party;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UILabel *companyDescriptionLabel;

@end

@implementation TAPartyDescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([TAPartyController sharedInstance].currentParty) {
        self.party = [TAPartyController sharedInstance].currentParty;
        self.partyTitleLabel.text = _party.partyName;
        self.partyTitleLabel.textColor = [UIColor getBrownTryazonColor];
        self.partyTitleLabel.font = [UIFont fontWithName:@"AvenirNext-Bold" size:24];
        
        self.companyDescriptionLabel.text = _party.companyDescription;
        self.companyDescriptionLabel.textColor = [UIColor blackColor];
        
        self.companyDescriptionLabel.adjustsFontSizeToFitWidth = YES;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    if ([TAPartyController sharedInstance].currentParty) {
        self.party = [TAPartyController sharedInstance].currentParty;
        //self.failedToLoadLabel.text = @"";
        
        if (self.party.mainImageFile) {
            [[TANetworkController sharedInstance] getPDFForCurrentParty:self.party.mainImageFile Callback:^(NSData *imageData) {
                self.image = [[UIImage alloc] initWithData:imageData];//loadData:imageData MIMEType:@"image/jpeg"
                self.imageView.image = self.image;
                
                
                //[self.view addSubview:self.imageView];
            }];
        
        }
    }



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
