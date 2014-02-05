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
    
    [self triggerFilter];
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapped)];
    [self.view addGestureRecognizer:self.tapRecognizer];

    self.hours = [[DigitView alloc] initWithFrame:CGRectMake(75.0, 75.0, 75.0, 125.0)];
    [self.view addSubview:self.hours];
    self.hours2 = [[DigitView alloc] initWithFrame:CGRectMake(175.0, 75.0, 75.0, 125.0)];
    [self.view addSubview:self.hours2];
    
    self.minutes = [[DigitView alloc] initWithFrame:CGRectMake(75.0, 225.0, 75.0, 125.0)];
    [self.view addSubview:self.minutes];
    self.minutes2 = [[DigitView alloc] initWithFrame:CGRectMake(175.0, 225.0, 75.0, 125.0)];
    [self.view addSubview:self.minutes2];
    
    self.seconds = [[DigitView alloc] initWithFrame:CGRectMake(75.0, 375.0, 75.0, 125.0)];
    [self.view addSubview:self.seconds];
    self.seconds2 = [[DigitView alloc] initWithFrame:CGRectMake(175.0, 375.0, 75.0, 125.0)];
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
    
    [self.hours displayDigit:[[t_hour substringWithRange:NSMakeRange(0, 1)] intValue]];
    [self.hours2 displayDigit:[[t_hour substringWithRange:NSMakeRange(1, 1)] intValue]];
    
    [self.minutes displayDigit:[[t_minu substringWithRange:NSMakeRange(0, 1)] intValue]];
    [self.minutes2 displayDigit:[[t_minu substringWithRange:NSMakeRange(1, 1)] intValue]];
    
    [self.seconds displayDigit:[[t_seco substringWithRange:NSMakeRange(0, 1)] intValue]];
    [self.seconds2 displayDigit:[[t_seco substringWithRange:NSMakeRange(1, 1)] intValue]];
}

- (void)tapped
{
    self.filterActive = self.filterActive ? NO : YES;
    [self triggerFilter];
}

- (void)triggerFilter
{

    if (self.filterActive) {
        self.view.backgroundColor = [UIColor blackColor];
    } else {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"left.jpg"]];
    }
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
