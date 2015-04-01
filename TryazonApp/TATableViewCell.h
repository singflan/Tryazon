//
//  TATableViewCell.h
//  TryazonApp
//
//  Created by Dustin Flanary on 3/31/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TATableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *checklistItemLabel;
@property (nonatomic, weak) IBOutlet UIButton *checkmarkButton;

@end
