//
//  UIColor+ExtraColorTools.m
//  TryazonApp
//
//  Created by Dustin Flanary on 2/21/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "UIColor+ExtraColorTools.h"

@implementation UIColor (ExtraColorTools)

+ (UIColor *) randomColor {
    
    CGFloat redColor = ((CGFloat)arc4random() / RAND_MAX);
    CGFloat blueColor = ((CGFloat)arc4random() / RAND_MAX);
    CGFloat greenColor = ((CGFloat)arc4random() / RAND_MAX);
    
    UIColor *color = [[UIColor alloc] initWithRed:redColor green:greenColor blue:blueColor alpha:1];
    
    return color;
}

+ (UIColor *) getTryazonColor {
    UIColor *tryazonColor = [[UIColor alloc] initWithRed:.53 green:.65 blue:.77 alpha:1];
    
    return tryazonColor;
}

@end
