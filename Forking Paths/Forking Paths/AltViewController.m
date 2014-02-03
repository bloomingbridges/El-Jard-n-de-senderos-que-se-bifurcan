//
//  AltViewController.m
//  Forking Paths
//
//  Created by Florian Brueckner on 31/01/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "AltViewController.h"
#import "DigitView.h"
#import "ForkingView.h"

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
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"left.jpg"]];

    DigitView *hours = [[DigitView alloc] initWithFrame:CGRectMake(75.0, 75.0, 75.0, 125.0)];
    [self.view addSubview:hours];
    [hours displayDigit:0];
    DigitView *hours2 = [[DigitView alloc] initWithFrame:CGRectMake(175.0, 75.0, 75.0, 125.0)];
    [self.view addSubview:hours2];
    [hours2 displayDigit:0];
    
    DigitView *minutes = [[DigitView alloc] initWithFrame:CGRectMake(75.0, 225.0, 75.0, 125.0)];
    [self.view addSubview:minutes];
    [minutes displayDigit:0];
    DigitView *minutes2 = [[DigitView alloc] initWithFrame:CGRectMake(175.0, 225.0, 75.0, 125.0)];
    [self.view addSubview:minutes2];
    [minutes2 displayDigit:0];
    
    DigitView *seconds = [[DigitView alloc] initWithFrame:CGRectMake(75.0, 375.0, 75.0, 125.0)];
    [self.view addSubview:seconds];
    [seconds displayDigit:0];
    DigitView *seconds2 = [[DigitView alloc] initWithFrame:CGRectMake(175.0, 375.0, 75.0, 125.0)];
    [self.view addSubview:seconds2];
    [seconds2 displayDigit:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
