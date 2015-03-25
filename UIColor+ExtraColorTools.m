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

+ (UIColor *) getLightTryazonColor {
    UIColor *tryazonColor = [[UIColor alloc] initWithRed:.14 green:.69 blue:.76 alpha:1];
    
    return tryazonColor;
}

+ (UIColor *) getDarkTryazonColor {
    UIColor *tryazonColor = [[UIColor alloc] initWithRed:.09 green:.47 blue:.51 alpha:1];
    
    return tryazonColor;
}

+ (UIColor *) getBrownTryazonColor {
    UIColor *tryazonColor = [[UIColor alloc] initWithRed:.33 green:.19 blue:.18 alpha:1];
    
    return tryazonColor;
}
@end
