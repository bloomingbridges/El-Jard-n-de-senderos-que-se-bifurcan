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
        self.inversed = YES;
        self.pathLayer = [CAShapeLayer layer];
        [self.pathLayer setFrame:CGRectMake(0.0, 0.0, 25.0, 25.0)];
        [self.pathLayer setBackgroundColor:[UIColor blackColor].CGColor];
        [self.pathLayer setFillColor:[UIColor clearColor].CGColor];
        [self.pathLayer setStrokeColor:[UIColor whiteColor].CGColor];
        [self.pathLayer setLineWidth:1.5];
        [self.pathLayer setLineCap:kCALineCapRound];
        [self.pathLayer setShouldRasterize:YES];
        [self.pathLayer setMinificationFilter:kCAFilterNearest];
        [self.pathLayer setMagnificationFilter:kCAFilterNearest];
        [self.pathLayer setPath:[self createPath:NO]];
        [self.layer addSublayer:self.pathLayer];
        [self setOpaque:NO];
    }
    return self;
}

- (CGPathRef)createPath:(BOOL)inversed
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGMutablePathRef path2 = CGPathCreateMutable();
    
    if (inversed == YES) {
        CGPathMoveToPoint(path, NULL, 0.0, 12.5);
        CGPathAddLineToPoint(path, NULL, 12.5, 25.0);
        CGPathMoveToPoint(path2, NULL, 12.5, 0.0);
        CGPathAddLineToPoint(path2, NULL, 25.0, 12.5);
    }
    else {
        CGPathMoveToPoint(path, NULL, 0.0, 12.5);
        CGPathAddLineToPoint(path, NULL, 12.5, 0.0);
        CGPathMoveToPoint(path2, NULL, 12.5, 25.0);
        CGPathAddLineToPoint(path2, NULL, 25.0, 12.5);
    }
    
    CGPathAddPath(path, NULL, path2);
    CGPathCloseSubpath(path2);
    return path;
}

- (void)turn
{
    self.inversed = (self.inversed == YES) ? NO : YES;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.autoreverses = NO;
    animation.removedOnCompletion = NO;
    animation.fillMode = (self.inversed == YES) ? kCAFillModeForwards : kCAFillModeBackwards;
    animation.fromValue = (id) [self createPath:!self.inversed];
    animation.toValue = (id) [self createPath:self.inversed];
    [self.pathLayer addAnimation:animation forKey:@"animatePath"];
    
    [self setNeedsDisplay];
}

- (void)replace:(BOOL)direction
{
    self.inversed = direction;
    if (self.inversed == YES) {
        [self.pathLayer setHidden:NO];
        [self.pathLayer setPath:[self createPath:YES]];
    } else {
        [self.pathLayer setPath:[self createPath:NO]];
        [self.pathLayer setHidden:YES];
    }
    
//    [self.pathLayer removeAnimationForKey:@"animatePath"];
    [self setNeedsDisplay];
}

- (void)clearAndRestore:(BOOL)restore
{
    self.inversed = NO;
    [self.pathLayer setPath:[self createPath:restore]];
    [self.pathLayer setHidden:restore];
}

- (void)drawRect:(CGRect)rect
{
    #if DEBUG
//    NSLog(self.inversed ? @"\\" : @"//");
    if (self.inversed == YES) {
        [self.pathLayer setBackgroundColor:[UIColor colorWithRed:1.0 green:0.0 blue:0.5 alpha:1.0].CGColor];
    } else {
        [self.pathLayer setBackgroundColor:[UIColor blackColor].CGColor];
    }
    #endif
}

@end
