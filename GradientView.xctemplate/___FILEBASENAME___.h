//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>

@interface ___FILEBASENAMEASIDENTIFIER___ : UIView // Subclass buttons/navbars/etc
{
    // These two arrays define the gradient that will be used
    // when the button is in UIControlStateNormal
    NSArray *normalGradientColors;      // Colors
    NSArray *normalGradientLocations;   // Relative locations

    // These two arrays define the gradient that will be used
    // when the button is in UIControlStateHighlighted
    NSArray *highlightGradientColors;       // Colors
    NSArray *highlightGradientLocations;    // Relative locations

    // This defines the corner radius of the button
    CGFloat cornerRadius;

    // This defines the size and color of the stroke
    CGFloat strokeWeight;
    UIColor *strokeColor;

    @private
    CGGradientRef   normalGradient;
    CGGradientRef   highlightGradient;
}
@property (nonatomic, retain) NSArray   *normalGradientColors;
@property (nonatomic, retain) NSArray   *normalGradientLocations;
@property (nonatomic, retain) NSArray   *highlightGradientColors;
@property (nonatomic, retain) NSArray   *highlightGradientLocations;
@property (nonatomic) CGFloat           cornerRadius;
@property (nonatomic) CGFloat           strokeWeight;
@property (nonatomic, retain) UIColor   *strokeColor;

- (void)useInitStyle;
- (void)useSecondaryStyle;

@end
