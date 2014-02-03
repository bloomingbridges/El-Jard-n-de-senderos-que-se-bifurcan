//
//  DigitView.m
//  Forking Paths
//
//  Created by Florian Brueckner on 31/01/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "DigitView.h"
#import "ForkingView.h"

@implementation DigitView

NSMutableArray *cells;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        int x, y;
        cells = [NSMutableArray arrayWithCapacity:15];
        for (int i = 0; i<=14; i++) {
            x = (i % 3) * 25.0;
            y = (i / 3) * 25.0;
            ForkingView *cell = [[ForkingView alloc] initWithFrame:CGRectMake(x, y, 25.0, 25.0)];
            [cells addObject:cell];
            [self addSubview:cell];
        }
        [self setOpaque:NO];
    }
    return self;
}

- (void)displayDigit:(int)digit
{
    NSArray *blueprint = [DigitView fetchDigitBlueprintFor:digit];
    NSLog(@"BLUEPRINT for %i: %@", digit, blueprint);
    BOOL supposedValue;
    for (int i=0; i<=14; i++) {
        supposedValue = [[blueprint objectAtIndex:i] boolValue];
        NSLog(@"NEEDS BE %@", (supposedValue == YES) ? @"YES" : @"NO");
        if (supposedValue != [[cells objectAtIndex:i] inversed]) {
            NSLog(@"Supposedly different..");
            [[cells objectAtIndex:i] turn];
        }
    }
}

+ (NSArray*)fetchDigitBlueprintFor:(int)digit
{
    NSArray *blueprint = @[@NO,@NO,@NO,
                           @NO,@NO,@NO,
                           @NO,@NO,@NO,
                           @NO,@NO,@NO,
                           @NO,@NO,@NO];
    
    switch (digit) {
            
        case 0:
            return @[@YES, @YES, @YES,
                     @YES, @NO , @YES,
                     @YES, @NO , @YES,
                     @YES, @NO , @YES,
                     @YES, @YES, @YES];
            break;
            
        case 1:
            return @[@NO, @YES, @NO,
                     @NO, @YES, @NO,
                     @NO, @YES, @NO,
                     @NO, @YES, @NO,
                     @NO, @YES, @NO];
            
        case 2:
            return @[@YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @YES, @YES, @YES,
                     @YES, @NO,  @NO,
                     @YES, @YES, @YES];
            
        case 3:
            return @[@YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @YES, @YES, @YES];
            
        case 4:
            return @[@YES, @NO,  @YES,
                     @YES, @NO,  @YES,
                     @YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @NO,  @NO,  @YES];
            
        case 5:
            return @[@YES, @YES, @YES,
                     @YES,  @NO, @NO,
                     @YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @YES, @YES, @YES];
            
        case 6:
            return @[@YES, @NO,  @NO,
                     @YES, @NO,  @NO,
                     @YES, @YES, @YES,
                     @YES, @NO,  @YES,
                     @YES, @YES, @YES];
            
        case 7:
            return @[@YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @NO,  @NO,  @YES,
                     @NO,  @NO,  @YES,
                     @NO,  @NO,  @YES];
            
        case 8:
            return @[@YES, @YES, @YES,
                     @YES, @NO,  @YES,
                     @YES, @YES, @YES,
                     @YES, @NO,  @YES,
                     @YES, @YES, @YES];
            
        case 9:
            return @[@YES, @YES, @YES,
                     @YES, @NO,  @YES,
                     @YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @NO,  @NO,  @YES];
            
        default:
            return blueprint;
            break;
    }

}

@end
