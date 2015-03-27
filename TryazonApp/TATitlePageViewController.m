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

    
    self.selectPartyLabel.textColor = [UIColor getLightTryazonColor];
    self.signUpButton.tintColor = [UIColor getDarkTryazonColor];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[TAPartyController sharedInstance] getParties].count;
}

// Setting party based on row clicked on on title page
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [TAPartyController sharedInstance].currentParty =
    [[[TAPartyController sharedInstance] getParties] objectAtIndex:indexPath.row];
    
    
    [self performSegueWithIdentifier:@"openTabBar" sender:self];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    TAParty *party = [[[TAPartyController sharedInstance] getParties] objectAtIndex:indexPath.row];
    cell.textLabel.text = party.partyName;
    cell.textLabel.textColor = [UIColor getBrownTryazonColor];
    
    return cell;
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
