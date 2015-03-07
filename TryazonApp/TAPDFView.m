//
//  TAPDFView.m
//  TryazonApp
//
//  Created by Dustin Flanary on 3/7/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "TAPDFView.h"

@interface TAPDFView ()

@property (nonatomic, strong) NSData *partyPDFData;
@property (nonatomic, assign) NSInteger pageNum;

@end

@implementation TAPDFView

- (id)initWithFrame:(CGRect)theFrame data:(NSData*)data pageNum:(NSInteger)number  {
    self = [super initWithFrame:theFrame];
    if (self) {
        self.partyPDFData = data;
        self.pageNum = number;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
 //An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // PDF might be transparent, assume white paper
    [[UIColor whiteColor] set];
    CGContextFillRect(ctx, rect);
    
    // Flip coordinates
    CGContextGetCTM(ctx);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -rect.size.height);
    
    // data is an NSData object we filled with the PDF data from file before
    CGDataProviderRef dataProvider = CGDataProviderCreateWithCFData((CFDataRef)self.partyPDFData);
    CGPDFDocumentRef pdf = CGPDFDocumentCreateWithProvider(dataProvider);
    CGDataProviderRelease(dataProvider);
    
    
    
    CGPDFPageRef page = CGPDFDocumentGetPage(pdf, self.pageNum);
    
    
    
    
    // get the rectangle of the cropped inside
    CGRect mediaRect = CGPDFPageGetBoxRect(page, kCGPDFCropBox);
    CGContextScaleCTM(ctx, rect.size.width / mediaRect.size.width,
                      rect.size.height / mediaRect.size.height);
    CGContextTranslateCTM(ctx, -mediaRect.origin.x, -mediaRect.origin.y);
    
    // draw it
    CGContextDrawPDFPage(ctx, page);
    CGPDFDocumentRelease(pdf);
}


@end
