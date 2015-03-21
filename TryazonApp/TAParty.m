//
//  TAParty.m
//  TryazonApp
//
//  Created by Dustin Flanary on 3/20/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TAParty.h"

@implementation TAParty

- (id)initWithPFObject:(PFObject *)object {
    self.partyName = object[@"partyName"];
    self.companyName = object[@"companyName1"];
    self.partySurveyURL = object[@"surveyurl"];
    self.partyDate = object[@"partydate"];
    PFObject *checklistPointer = object[@"checklistArrays"];
    self.checklistPointerID = checklistPointer.objectId;
    self.pdfFile = object[@"partypdf"];
    
    NSLog(@"%@", self.checklistPointerID);
    
    return self;
}

@end
