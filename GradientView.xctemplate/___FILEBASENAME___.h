/*
 *   The MIT License
 *
 *   Copyright (c) 2012 Randy McMillan
 *
 *   Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 *   The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 *   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
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

//@interface ___FILEBASENAMEASIDENTIFIER___ : UIView // Subclass buttons/navbars/etc
@interface ___FILEBASENAMEASIDENTIFIER___ : UIButton // Subclass buttons/navbars/etc
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
- (void)useInitStyleImage;
- (void)useSecondaryStyle;
- (void)useSecondaryStyleImage;

@end
