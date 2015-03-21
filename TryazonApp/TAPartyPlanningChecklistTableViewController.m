//
//  TAPartyPlanningChecklistTableViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 3/17/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TAPartyPlanningChecklistTableViewController.h"
#import <Parse/Parse.h>

@interface TAPartyPlanningChecklistTableViewController ()
@property NSArray *checklistSection1;
@property NSArray *checklistSection2;
@property NSArray *checklistSection3;
@property NSArray *checklistSection4;

@end

@implementation TAPartyPlanningChecklistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Checklist"];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        self.checklistSection1 = object[@"prePartyPlanning"];
        self.checklistSection2 = object[@"weekOfParty"];
        self.checklistSection3 = object[@"dayOfParty"];
        self.checklistSection4 = object[@"afterParty"];
    
        [self.tableView reloadData];
    }];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.title = @"Party Planning Checklist";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return self.checklistSection1.count;
            break;
        case 1:
            return self.checklistSection2.count;
            break;
        case 2:
            return self.checklistSection3.count;
            break;
        case 3:
            return self.checklistSection4.count;
            break;
        default:
            break;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [self.checklistSection1 objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [self.checklistSection2 objectAtIndex:indexPath.row];
            break;
        case 2:
            cell.textLabel.text = [self.checklistSection3 objectAtIndex:indexPath.row];
            break;
        case 3:
            cell.textLabel.text = [self.checklistSection4 objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return @"Pre-Party Planning (1-2 weeks before party)";
    }
    else if(section == 1)
    {
        return @"Week of Party";
    }
    else if(section ==2)
    {
        return @"Day of Party";
    }
    else
    {
        return @"After the Party";
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
