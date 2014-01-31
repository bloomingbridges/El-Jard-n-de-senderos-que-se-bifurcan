//
//  xxiivvPathView.m
//  Forking Paths
//
//  Created by Florian Brueckner on 31/01/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "ForkingView.h"

@implementation ForkingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *strokeColour;
    NSLog(self.inversed ? @"YES" : @"NO");
    if (self.inversed == YES) {
        strokeColour = [UIColor colorWithRed:1.0 green:0.0 blue:0.5 alpha:1.0];
    }
    else {
        strokeColour = [UIColor colorWithWhite:0.2 alpha:1.0];
    }
    CGContextSetFillColorWithColor(context, strokeColour.CGColor);
    CGContextFillRect(context, self.bounds);
}

@end
