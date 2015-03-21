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

@interface TATitlePageViewController() <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *partyTableView;

@end

@implementation TATitlePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.partyTableView.delegate = self;
    self.partyTableView.dataSource = self;
    
    [self.partyTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];

    [[TANetworkController sharedInstance] getParties:^(BOOL finished) {
        [self.partyTableView reloadData];
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[TAPartyController sharedInstance] getParties].count;
}

// Setting party based on row clicked on on title page
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [TAPartyController sharedInstance].currentParty =
        [[[TAPartyController sharedInstance] getParties] objectAtIndex:indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    TAParty *party = [[[TAPartyController sharedInstance] getParties] objectAtIndex:indexPath.row];
    cell.textLabel.text = party.partyName;

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
