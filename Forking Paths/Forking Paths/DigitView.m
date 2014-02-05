//
//  DigitView.m
//  Forking Paths
//
//  Created by Florian Brueckner on 31/01/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "DigitView.h"
#import "ForkingView.h"

@interface DigitView ()
    @property (nonatomic, retain) NSMutableArray *cells;
@end

@implementation DigitView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        int x, y;
        self.cells = [NSMutableArray arrayWithCapacity:15];
        for (int i = 0; i<=14; i++) {
            x = (i % 3) * 25.0;
            y = (i / 3) * 25.0;
            ForkingView *cell = [[ForkingView alloc] initWithFrame:CGRectMake(x, y, 25.0, 25.0)];
            [self.cells addObject:cell];
            [self addSubview:cell];
        }
        [self setOpaque:NO];
        [self displayDigit:-1 withFilter:NO];
    }
    return self;
}

- (void)displayDigit:(int)digit withFilter:(BOOL)filter
{
    NSArray *blueprint = [DigitView fetchDigitBlueprintFor:digit];
//    NSLog(@"Displaying digit %i", digit);
//    NSLog(@"BLUEPRINT for %i: %@", digit, blueprint);
    BOOL supposedValue;
    for (int i=0; i<=14; i++) {
        supposedValue = [[blueprint objectAtIndex:i] boolValue];
        if (supposedValue != [[self.cells objectAtIndex:i] inversed]) {
            if (filter == YES) { [[self.cells objectAtIndex:i] replace:supposedValue]; }
            else { [[self.cells objectAtIndex:i] turn]; }
        }
    }
}

- (void)reset:(BOOL)filtered
{
    for (ForkingView* cell in self.cells) {
        [cell clearAndRestore:filtered];
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
            
//        case -1:
//            return @[@YES, @NO,  @YES,
//                     @YES, @NO,  @YES,
//                     @NO,  @YES, @NO,
//                     @YES, @NO,  @YES,
//                     @YES, @NO,  @YES];
//            break;
            
        case 0:
            return @[@YES, @YES, @YES,
                     @YES, @NO , @YES,
                     @YES, @NO , @YES,
                     @YES, @NO , @YES,
                     @YES, @YES, @YES];
            break;
            
        case 1:
            return @[@NO,  @YES,  @NO,
                     @YES, @YES,  @NO,
                     @NO,  @YES,  @NO,
                     @NO,  @YES,  @NO,
                     @YES,  @YES, @YES];
            break;
            
        case 2:
            return @[@YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @YES, @YES, @YES,
                     @YES, @NO,  @NO,
                     @YES, @YES, @YES];
            break;
            
        case 3:
            return @[@YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @YES, @YES, @YES];
            break;
            
        case 4:
            return @[@YES, @NO,  @YES,
                     @YES, @NO,  @YES,
                     @YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @NO,  @NO,  @YES];
            break;
            
        case 5:
            return @[@YES, @YES, @YES,
                     @YES,  @NO, @NO,
                     @YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @YES, @YES, @YES];
            break;
            
        case 6:
            return @[@YES, @NO,  @NO,
                     @YES, @NO,  @NO,
                     @YES, @YES, @YES,
                     @YES, @NO,  @YES,
                     @YES, @YES, @YES];
            break;
            
        case 7:
            return @[@YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @NO,  @NO,  @YES,
                     @NO,  @NO,  @YES,
                     @NO,  @NO,  @YES];
            break;
            
        case 8:
            return @[@YES, @YES, @YES,
                     @YES, @NO,  @YES,
                     @YES, @YES, @YES,
                     @YES, @NO,  @YES,
                     @YES, @YES, @YES];
            break;
            
        case 9:
            return @[@YES, @YES, @YES,
                     @YES, @NO,  @YES,
                     @YES, @YES, @YES,
                     @NO,  @NO,  @YES,
                     @NO,  @NO,  @YES];
            break;
            
        default:
            return blueprint;
            break;
    }

}

@end
