//
//  TAParty.h
//  TryazonApp
//
//  Created by Dustin Flanary on 3/20/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TAChecklist.h"
#import <Parse/Parse.h>

@interface TAParty : NSObject

@property (strong, nonatomic) NSString *partyName;
@property (strong, nonatomic) NSString *companyName;
@property (strong, nonatomic) NSString *partySurveyURL;
@property (strong) NSDate * partyDate;
@property (strong, nonatomic) NSString *checklistPointerID;
@property (strong, nonatomic) TAChecklist *checklist;
@property (strong, nonatomic) PFFile *pdfFile;

- (id)initWithPFObject:(PFObject *)object;

@end
