//
//  TAPDFView.h
//  TryazonApp
//
//  Created by Dustin Flanary on 3/7/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TAPDFView : UIView

- (id)initWithFrame:(CGRect)theFrame data:(NSData*)data pageNum:(NSInteger)number ;

@end
