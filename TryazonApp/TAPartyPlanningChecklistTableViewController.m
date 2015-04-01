//
//  TAPartyPlanningChecklistTableViewController.m
//  TryazonApp
//
//  Created by Dustin Flanary on 3/17/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TAPartyPlanningChecklistTableViewController.h"
#import <Parse/Parse.h>
#import "TAParty.h"
#import "TAPartyController.h"
#import "TANetworkController.h"
#import "TATableViewCell.h"
#import "UIColor+ExtraColorTools.h"

@interface TAPartyPlanningChecklistTableViewController ()
@property TAParty *currentParty;
@property (strong, nonatomic) TAChecklist *checklist;
@property (strong, nonatomic) UIButton *checkButton;
@property BOOL *checkBoxSelected;
@property (nonatomic, strong) TATableViewCell *prototypeCell;

@end

@implementation TAPartyPlanningChecklistTableViewController
static NSString *TACellIdentifier = @"TATableCell1";


- (void)viewDidLoad {
    [super viewDidLoad];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangePreferredContentSize:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
    [self.tableView registerClass:[TATableViewCell class] forCellReuseIdentifier:TACellIdentifier];
    
    [self.tableView setEditing:YES];
    self.tableView.allowsSelectionDuringEditing = YES;
    //[self.tableView]
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    //self.tableView.allowsSelection = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.title = @"Party Prep Checklist";
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.currentParty = [TAPartyController sharedInstance].currentParty;
    [[TANetworkController sharedInstance] getChecklistForCurrentParty:self.currentParty.checklistPointerID Callback:^(TAChecklist * checklist) {
        
        self.checklist = checklist;
    
        
        [self.tableView reloadData];
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
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
            return self.checklist.prePartyPlanning.count;
            break;
        case 1:
            return self.checklist.weekOfParty.count;
            break;
        case 2:
            return self.checklist.dayOfParty.count;
            break;
        case 3:
            return self.checklist.afterParty.count;
            break;
        default:
            break;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TACellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [self.checklist.prePartyPlanning objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [self.checklist.weekOfParty objectAtIndex:indexPath.row];
            break;
        case 2:
            cell.textLabel.text = [self.checklist.dayOfParty objectAtIndex:indexPath.row];
            break;
        case 3:
            cell.textLabel.text = [self.checklist.afterParty objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"AvenirNext" size:13.5];
    
//    [self configureCell:cell forRowAtIndexPath:indexPath];
    [cell.contentView sizeToFit];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[TATableViewCell class]])
    {
        TATableViewCell *textCell = (TATableViewCell *)cell;
        //textCell.checklistItemLabel.text = [NSString stringWithFormat:@"Line %ld",(long)indexPath.row+1];
        //textCell.checklistItemLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
        //textCell.backgroundColor = [UIColor getDarkTryazonColor];
        //textCell.checklistItemLabel.text = [self.sourceData objectAtIndex:indexPath.row];
        
        textCell.checklistItemLabel.numberOfLines=0;
        textCell.checklistItemLabel.lineBreakMode = NSLineBreakByWordWrapping;
        textCell.checklistItemLabel.sizeToFit;
        
        //textCell.checklistItemLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        //[textCell.checklistItemLabel sizeToFit];
        
        
//        switch (indexPath.section) {
//            case 0:
//                textCell.checklistItemLabel.text = [self.checklist.prePartyPlanning objectAtIndex:indexPath.row];
//                break;
//            case 1:
//                textCell.checklistItemLabel.text = [self.checklist.weekOfParty objectAtIndex:indexPath.row];
//                break;
//            case 2:
//                textCell.checklistItemLabel.text = [self.checklist.dayOfParty objectAtIndex:indexPath.row];
//                break;
//            case 3:
//                textCell.checklistItemLabel.text = [self.checklist.afterParty objectAtIndex:indexPath.row];
//                break;
//            default:
//                textCell.checklistItemLabel.text = [self.checklist.prePartyPlanning objectAtIndex:indexPath.row];
//                break;
//        }
        //textCell.checklistItemLabel.text = [self.checklist.prePartyPlanning objectAtIndex:indexPath.row];

        textCell.checklistItemLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//   [self configureCell:self.prototypeCell forRowAtIndexPath:indexPath];
//    [self.prototypeCell layoutIfNeeded];
//    
//    CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    return size.height+1;
//   // return 200;
//}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
                                           
    header.contentView.backgroundColor = [UIColor getLightTryazonColor];
    header.textLabel.numberOfLines = 0;
    header.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    //header.textLabel.sizeToFit;
}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGFloat result;
//    TATableViewCell *textCell = [[TATableViewCell alloc]init];
//    switch (indexPath.section) {
//                        case 0:
//                            textCell.checklistItemLabel.text = [self.checklist.prePartyPlanning objectAtIndex:indexPath.row];
//                            break;
//                        case 1:
//                            textCell.checklistItemLabel.text = [self.checklist.weekOfParty objectAtIndex:indexPath.row];
//                            break;
//                        case 2:
//                            textCell.checklistItemLabel.text  = [self.checklist.dayOfParty objectAtIndex:indexPath.row];
//                            break;
//                        case 3:
//                            textCell.checklistItemLabel.text  = [self.checklist.afterParty objectAtIndex:indexPath.row];
//                            break;
//                        default:
//                            break;
//                    }
//    [textCell layoutIfNeeded];
//
//    CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    return size.height+1;
//   // return result;
//}

- (TATableViewCell *)prototypeCell
{
    if (!_prototypeCell)
    {
        _prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:TACellIdentifier];
    }
    return _prototypeCell;
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    // Create a dictionary with a key that is the
//    //party & unique Parse objectID
//    // completedItems:[indexPath, indexPath
//    NSDictionary *selectedItems = [[NSMutableDictionary alloc] init];
//    [selectedItems setValue:self.currentParty forKey:@"party"];
//    [selectedItems setValue:[NSArray arrayWithObjects:[NSIndexPath ] forKey:@"completedItems"];
//    
//    
//}
//
//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSDictionary *selectedItems = [[NSMutableDictionary alloc] initWithDictionary:<#(NSDictionary *)#>//??
//    [selectedItems]
//}

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

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryCheckmark;
    //return UITableViewCellEditingStyleNone;
}

- (void)dealloc
{
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)didChangePreferredContentSize:(NSNotification *)notification
{
   // [self.tableView reloadData];
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
