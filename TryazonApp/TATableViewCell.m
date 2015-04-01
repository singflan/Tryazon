//
//  TATableViewCell.m
//  TryazonApp
//
//  Created by Dustin Flanary on 3/31/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TATableViewCell.h"
#import "UIColor+ExtraColorTools.h"

@implementation TATableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    //self.checklistItemLabel.textColor = [UIColor getBrownTryazonColor];
}

@end
