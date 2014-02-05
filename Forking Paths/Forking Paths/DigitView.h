//
//  DigitView.h
//  Forking Paths
//
//  Created by Florian Brueckner on 31/01/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DigitView : UIView

    - (void)displayDigit:(int)digit withFilter:(BOOL)filter;
    - (void)reset:(BOOL)filtered;

@end

