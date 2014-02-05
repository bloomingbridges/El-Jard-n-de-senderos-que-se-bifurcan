//
//  xxiivvPathView.h
//  Forking Paths
//
//  Created by Florian Brueckner on 31/01/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ForkingView : UIView

    @property (retain) CAShapeLayer *pathLayer;
    @property BOOL inversed;

    - (void)turn;
@end
