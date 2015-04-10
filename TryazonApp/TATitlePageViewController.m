//
//  TATitlePageViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 2/21/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TATitlePageViewController.h"
#import "TANetworkController.h"
#import "TAPartyController.h"
#import "UIColor+ExtraColorTools.h"
#import "TAPartyPlanningChecklistTableViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TATitlePageViewController() <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *selectPartyLabel;
@property (strong, nonatomic) IBOutlet UITableView *partyTableView;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

@end

@implementation TATitlePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.partyTableView.delegate = self;
    self.partyTableView.dataSource = self;
    
    
    [self.partyTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    //[self.partyTableView registerClass:nil forHeaderFooterViewReuseIdentifier:@"PartyHeader"];
   // self.partyTableView

    [[TANetworkController sharedInstance] getParties:^(BOOL finished) {
        [self.partyTableView reloadData];
    }];

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.selectPartyLabel.textColor = [UIColor getDarkTryazonColor];
    self.selectPartyLabel.font = [UIFont fontWithName:@"AvenirNext-Bold" size:16];

    
    // Button design
    self.signUpButton.tintColor = [UIColor whiteColor];
    self.signUpButton.backgroundColor = [UIColor getLightTryazonColor];
    
    //self.signUpButton.layer.cornerRadius = 9;
    self.signUpButton.clipsToBounds = YES;
    
    // Table view design
    self.partyTableView.layer.borderWidth = 2;
    self.partyTableView.layer.borderColor = [UIColor getLightTryazonColor].CGColor;
    self.partyTableView.backgroundView = nil;
    self.partyTableView.backgroundColor = [UIColor getLightTryazonColor];
    self.partyTableView.bounces = NO;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[TAPartyController sharedInstance] getParties] count]+1;
}

// Setting party based on row clicked on on title page
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger row = [indexPath row];
    if (row == [[[TAPartyController sharedInstance] getParties] count]) {
        [self performSegueWithIdentifier:@"signUpSegue" sender:self];
    }else {
        [TAPartyController sharedInstance].currentParty =
        [[[TAPartyController sharedInstance] getParties] objectAtIndex:indexPath.row];

        [self performSegueWithIdentifier:@"openTabBar" sender:self];

    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSUInteger row = [indexPath row];
    if (row == [[[TAPartyController sharedInstance] getParties] count]) {
        cell.textLabel.text = @"New to Tryazon? Sign up now!";
        
    } else {
        TAParty *party = [[[TAPartyController sharedInstance] getParties] objectAtIndex:indexPath.row];
        cell.textLabel.text = party.partyName;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    if (row == [[[TAPartyController sharedInstance] getParties] count]) {
        cell.textLabel.textColor = [UIColor getDarkTryazonColor];
    } else {
        cell.textLabel.textColor = [UIColor getBrownTryazonColor];
    }
    cell.textLabel.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:16];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"signUpWeb"]) {
//       // NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        //NSDate *object = self.objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
//    }
//}

@end
