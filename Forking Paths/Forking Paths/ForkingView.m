//
//  xxiivvPathView.m
//  Forking Paths
//
//  Created by Florian Brueckner on 31/01/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "ForkingView.h"

@implementation ForkingView

@synthesize inversed;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setOpaque:NO];
        [self clearsContextBeforeDrawing];
    }
    return self;
}

- (void)turn
{
    self.inversed = (self.inversed == YES) ? NO : YES;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *strokeColour;
//    NSLog(self.inversed ? @"\\" : @"//");
    if (self.inversed == YES) {
        strokeColour = [UIColor colorWithRed:1.0 green:0.0 blue:0.5 alpha:1.0];
    }
    else {
        strokeColour = [UIColor colorWithWhite:1.0 alpha:0.0];
    }
    CGContextSetFillColorWithColor(context, strokeColour.CGColor);
    CGContextFillRect(context, self.bounds);
}

@end
