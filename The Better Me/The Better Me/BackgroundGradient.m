//
//  BackgroundGradient.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/6/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "BackgroundGradient.h"

@implementation BackgroundGradient

-(void)setBackgroundGradientWithFrame:(CGRect)frame
                             andLayer:(CALayer *)layer {
    // Create the colors
    UIColor *topColor = [UIColor colorWithRed:130.0/255.0 green:28.0/255.0 blue:204.0/255.0 alpha:1.0];
    UIColor *bottomColor = [UIColor colorWithRed:178.0/255.0 green:46.0/255.0 blue:176.0/255.0 alpha:1.0];
    
    // Create the gradient
    CAGradientLayer *theViewGradient = [CAGradientLayer layer];
    theViewGradient.colors = [NSArray arrayWithObjects: (id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    theViewGradient.frame = frame;
    
    //Add gradient to view
    [layer insertSublayer:theViewGradient atIndex:0];
}

@end
