//
//  AltViewController.m
//  Forking Paths
//
//  Created by Florian Brueckner on 31/01/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "AltViewController.h"
#import "DigitView.h"

@interface AltViewController ()

@end

@implementation AltViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.patternLayer = [CALayer layer];
    self.patternLayer.frame = CGRectMake(0.0, 0.0, 320, [UIScreen mainScreen].bounds.size.height);
    self.patternLayer.backgroundColor = [UIColor blackColor].CGColor;
    [self.patternLayer setDelegate:self];
    [self.view.layer addSublayer:self.patternLayer];
    [self.patternLayer setNeedsDisplay];
    
    [self triggerFilter];
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapped)];
    [self.view addGestureRecognizer:self.tapRecognizer];
    
    float modifier = ([UIScreen mainScreen].bounds.size.height == 568.0) ? 50.0 : 0.0;

    self.hours = [[DigitView alloc] initWithFrame:CGRectMake(75.0, 25.0 + modifier, 75.0, 125.0)];
    [self.view addSubview:self.hours];
    self.hours2 = [[DigitView alloc] initWithFrame:CGRectMake(175.0, 25.0 + modifier, 75.0, 125.0)];
    [self.view addSubview:self.hours2];
    
    self.minutes = [[DigitView alloc] initWithFrame:CGRectMake(75.0, 175.0 + modifier, 75.0, 125.0)];
    [self.view addSubview:self.minutes];
    self.minutes2 = [[DigitView alloc] initWithFrame:CGRectMake(175.0, 175.0 + modifier, 75.0, 125.0)];
    [self.view addSubview:self.minutes2];
    
    self.seconds = [[DigitView alloc] initWithFrame:CGRectMake(75.0, 325.0 + modifier, 75.0, 125.0)];
    [self.view addSubview:self.seconds];
    self.seconds2 = [[DigitView alloc] initWithFrame:CGRectMake(175.0, 325.0 + modifier, 75.0, 125.0)];
    [self.view addSubview:self.seconds2];
    
    [self timerAdvanced];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAdvanced) userInfo:Nil repeats:YES];
}

- (void)timerAdvanced
{
    NSDate *currentTime = [NSDate date];
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"HH"]; // @"hh-mm"
    NSString *t_hour = [dateFormatter stringFromDate: currentTime];
    [dateFormatter setDateFormat:@"mm"]; // @"hh-mm"
    NSString *t_minu = [dateFormatter stringFromDate: currentTime];
	[dateFormatter setDateFormat:@"ss"]; // @"hh-mm"
	NSString *t_seco = [dateFormatter stringFromDate: currentTime];
    
//    NSLog([dateFormatter stringFromDate: currentTime]);
    
    [self.hours displayDigit:[[t_hour substringWithRange:NSMakeRange(0, 1)] intValue] withFilter:self.filterActive];
    [self.hours2 displayDigit:[[t_hour substringWithRange:NSMakeRange(1, 1)] intValue] withFilter:self.filterActive];
    
    [self.minutes displayDigit:[[t_minu substringWithRange:NSMakeRange(0, 1)] intValue] withFilter:self.filterActive];
    [self.minutes2 displayDigit:[[t_minu substringWithRange:NSMakeRange(1, 1)] intValue] withFilter:self.filterActive];
    
    [self.seconds displayDigit:[[t_seco substringWithRange:NSMakeRange(0, 1)] intValue] withFilter:self.filterActive];
    [self.seconds2 displayDigit:[[t_seco substringWithRange:NSMakeRange(1, 1)] intValue] withFilter:self.filterActive];
}

- (void)tapped
{
    self.filterActive = self.filterActive ? NO : YES;
    [self.hours    reset:self.filterActive];
    [self.hours2   reset:self.filterActive];
    [self.minutes  reset:self.filterActive];
    [self.minutes2 reset:self.filterActive];
    [self.seconds  reset:self.filterActive];
    [self.seconds2 reset:self.filterActive];
    [self triggerFilter];
    [self timerAdvanced];
}

- (void)triggerFilter
{
    if (self.filterActive) {
        [self.patternLayer setHidden:YES];
        [self.patternLayer setNeedsDisplay];
    } else {
        [self.patternLayer setHidden:NO];
        [self.patternLayer setNeedsDisplay];
    }
}

void LeftPattern (void *info, CGContextRef ctx) {
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(ctx, 1.5);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 0.0, 12.5);
    CGContextAddLineToPoint(ctx, 12.5, 0.0);
    CGContextStrokePath(ctx);
//    CGContextClosePath(ctx);
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 12.5, 25.0);
    CGContextAddLineToPoint(ctx, 25.0, 12.5);
    CGContextStrokePath(ctx);
//    CGContextClosePath(ctx);
}

- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)ctx {
    static const CGPatternCallbacks callbacks = { 0, &LeftPattern, NULL };
    CGContextSaveGState(ctx);
    CGColorSpaceRef patternSpace = CGColorSpaceCreatePattern(NULL);
    CGContextSetFillColorSpace(ctx, patternSpace);
    CGColorSpaceRelease(patternSpace);
    CGPatternRef pattern = CGPatternCreate(NULL, self.patternLayer.bounds, CGAffineTransformIdentity, 25, 25, kCGPatternTilingNoDistortion, true, &callbacks);
    CGFloat alpha = 1.0;
    CGContextSetFillPattern(ctx, pattern, &alpha);
    CGPatternRelease(pattern);
    CGContextFillRect(ctx, self.view.bounds);
    CGContextRestoreGState(ctx);
}

//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
