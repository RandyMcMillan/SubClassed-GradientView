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

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()
@property (nonatomic, readonly) CGGradientRef	normalGradient;
@property (nonatomic, readonly) CGGradientRef	highlightGradient;
- (void)hesitateUpdate;	// Used to catch and fix problem where quick
						// taps don't get updated back to normal state
@end
#pragma mark -

@implementation ___FILEBASENAMEASIDENTIFIER___
@synthesize normalGradientColors;
@synthesize normalGradientLocations;
@synthesize highlightGradientColors;
@synthesize highlightGradientLocations;
@synthesize cornerRadius;
@synthesize strokeWeight, strokeColor;
@synthesize normalGradient, highlightGradient;
#pragma mark -
- (CGGradientRef)normalGradient
{
	if (normalGradient == NULL) {
		int		locCount = [normalGradientLocations count];
		CGFloat locations[locCount];

		for (int i = 0; i < [normalGradientLocations count]; i++) {
			NSNumber *location =
				[normalGradientLocations objectAtIndex:i];
			locations[i] = [location floatValue];
		}

		CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();

		normalGradient = CGGradientCreateWithColors(

#if __has_feature(objc_arc)
				space, (__bridge CFArrayRef)normalGradientColors, locations);

#else
				space, (CFArrayRef)normalGradientColors, locations);
#endif
		CGColorSpaceRelease(space);
	}

	return normalGradient;
}	/* normalGradient */

- (CGGradientRef)highlightGradient
{
	if (highlightGradient == NULL) {
		CGFloat locations[[highlightGradientLocations count]];

		for (int i = 0; i < [highlightGradientLocations count]; i++) {
			NSNumber *location =
				[highlightGradientLocations objectAtIndex:i];
			locations[i] = [location floatValue];
		}

		CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();

		highlightGradient =
			CGGradientCreateWithColors(

#if __has_feature(objc_arc)
				space, (__bridge CFArrayRef)highlightGradientColors, locations);

#else
				space, (CFArrayRef)highlightGradientColors, locations);
#endif

		CGColorSpaceRelease(space);
	}

	return highlightGradient;
}	/* highlightGradient */

#pragma mark -
- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];

	if (self) {
		[self setOpaque:NO];
		self.backgroundColor = [UIColor clearColor];
	}

	return self;
}

#pragma mark -
#pragma mark Appearances

- (void)useInitStyle
{
	NSMutableArray	*colors = [NSMutableArray arrayWithCapacity:3];
	UIColor			*color	= [UIColor colorWithRed:0.922 green:0.918 blue:0.929 alpha:1.000];

	[colors addObject:(id)[color CGColor]];
	color = [UIColor colorWithRed:0.922 green:0.918 blue:0.929 alpha:1.000];
	[colors addObject:(id)[color CGColor]];
	color = [UIColor colorWithRed:0.922 green:0.918 blue:0.929 alpha:1.000];
	[colors addObject:(id)[color CGColor]];
	self.normalGradientColors		= colors;
	self.normalGradientLocations	= [NSMutableArray arrayWithObjects:
		[NSNumber numberWithFloat:0.0f],
		[NSNumber numberWithFloat:0.5f],
		[NSNumber numberWithFloat:1.0f],
		nil];

	NSMutableArray *colors2 = [NSMutableArray arrayWithCapacity:3];
	color = [UIColor colorWithRed:0.922 green:0.918 blue:0.929 alpha:0.100];// creates subtle pressed gradient by exposing color underneath

	[colors2 addObject:(id)[color CGColor]];
	color = [UIColor colorWithRed:0.922 green:0.918 blue:0.929 alpha:1.000];
	[colors2 addObject:(id)[color CGColor]];
	color = [UIColor colorWithRed:0.922 green:0.918 blue:0.929 alpha:1.000];
	[colors2 addObject:(id)[color CGColor]];
	self.highlightGradientColors	= colors2;
	self.highlightGradientLocations = [NSMutableArray arrayWithObjects:
		[NSNumber numberWithFloat:0.0f],
		[NSNumber numberWithFloat:0.5f],
		[NSNumber numberWithFloat:1.0f],
		nil];

	self.cornerRadius	= 5.0f; //Try different radius values
	self.strokeColor	= [UIColor darkGrayColor];
	self.strokeWeight	= 0.1f;

	// For NavBars//Buttons//Etc
	// If you change class to UIButton (for example) these errors disappear
	[self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
	[self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
}	/* useInitStyle */

- (void)useInitStyleImage
{
	// for buttons/whatever
    [self setImage:[UIImage imageNamed:[[self class] resolveImageResource:@"___FILEBASENAME___.bundle/image1"]] forState:UIControlStateNormal];
	// [self setImage:[UIImage imageNamed:[[self class] resolveImageResource:@"___FILEBASENAME___.bundle/image1"]] forState:UIControlStateNormal];
}

#pragma mark useYouTubeUIBar

- (void)useSecondaryStyle
{
	NSMutableArray	*colors = [NSMutableArray arrayWithCapacity:3];
	UIColor			*color	= [UIColor clearColor];

	[colors addObject:(id)[color CGColor]];
	color = [UIColor colorWithRed:0.995 green:0.995 blue:0.995 alpha:1.0];
	[colors addObject:(id)[color CGColor]];
	color = [UIColor colorWithRed:0.956 green:0.956 blue:0.955 alpha:1.0];
	[colors addObject:(id)[color CGColor]];
	self.normalGradientColors		= colors;
	self.normalGradientLocations	= [NSMutableArray arrayWithObjects:
		[NSNumber numberWithFloat:0.0f],
		[NSNumber numberWithFloat:0.5f],
		[NSNumber numberWithFloat:1.0f],
		nil];

	NSMutableArray *colors2 = [NSMutableArray arrayWithCapacity:3];
	color = [UIColor colorWithRed:0.692 green:0.692 blue:0.691 alpha:1.0];
	[colors2 addObject:(id)[color CGColor]];
	color = [UIColor colorWithRed:0.995 green:0.995 blue:0.995 alpha:1.0];
	[colors2 addObject:(id)[color CGColor]];
	color = [UIColor colorWithRed:0.83 green:0.83 blue:0.83 alpha:1.0];
	[colors2 addObject:(id)[color CGColor]];
	self.highlightGradientColors	= colors2;
	self.highlightGradientLocations = [NSMutableArray arrayWithObjects:
		[NSNumber numberWithFloat:0.0f],
		[NSNumber numberWithFloat:0.5f],
		[NSNumber numberWithFloat:1.0f],
		nil];

	self.cornerRadius	= 5.0f;
	self.strokeColor	= [UIColor clearColor];
	self.strokeWeight	= 0.1f;
	// [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];//For NavBars//Buttons//etc
	// [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];//For NavBars//Buttons//etc
}	/* useSecondaryStyle */

- (void)useSecondaryStyleImage
{
	// for buttons/whatever
	// [self setImage:[UIImage imageNamed:[[self class] resolveImageResource:@"___FILEBASENAME___.bundle/image2"]] forState:UIControlStateNormal];
}

#pragma mark -
- (void)drawRect:(CGRect)rect
{
	self.backgroundColor = [UIColor clearColor];
	CGRect imageBounds =
		CGRectMake(0.0, 0.0, self.bounds.size.width - 0.5,
			self.bounds.size.height);

	CGGradientRef	gradient;
	CGContextRef	context = UIGraphicsGetCurrentContext();
	CGPoint			point2;

	CGFloat resolution = 0.5 *
		(self.bounds.size.width / imageBounds.size.width +
		self.bounds.size.height / imageBounds.size.height);

	CGFloat stroke = strokeWeight * resolution;

	if (stroke < 1.0) {
		stroke = ceil(stroke);
	} else {
		stroke = round(stroke);
	}

	stroke /= resolution;
	CGFloat				alignStroke = fmod(0.5 * stroke * resolution, 1.0);
	CGMutablePathRef	path		= CGPathCreateMutable();
	CGPoint				point		=
		CGPointMake((self.bounds.size.width - [self cornerRadius]),
			self.bounds.size.height - 0.5f);
	point.x =
		(round(resolution * point.x +
		alignStroke) - alignStroke) / resolution;
	point.y =
		(round(resolution * point.y +
		alignStroke) - alignStroke) / resolution;
	CGPathMoveToPoint(path, NULL, point.x, point.y);
	point =
		CGPointMake(self.bounds.size.width - 0.5f,
			(self.bounds.size.height - [self cornerRadius]));
	point.x =
		(round(resolution * point.x +
		alignStroke) - alignStroke) / resolution;
	point.y =
		(round(resolution * point.y +
		alignStroke) - alignStroke) / resolution;
	CGPoint controlPoint1 =
		CGPointMake((self.bounds.size.width - ([self cornerRadius] / 2.f)),
			self.bounds.size.height - 0.5f);
	controlPoint1.x =
		(round(resolution * controlPoint1.x +
		alignStroke) - alignStroke) / resolution;
	controlPoint1.y =
		(round(resolution * controlPoint1.y +
		alignStroke) - alignStroke) / resolution;
	CGPoint controlPoint2 =
		CGPointMake(self.bounds.size.width - 0.5f,
			(self.bounds.size.height - ([self cornerRadius] / 2.f)));
	controlPoint2.x =
		(round(resolution * controlPoint2.x +
		alignStroke) - alignStroke) / resolution;
	controlPoint2.y =
		(round(resolution * controlPoint2.y +
		alignStroke) - alignStroke) / resolution;
	CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y,
		controlPoint2.x, controlPoint2.y, point.x,
		point.y);
	point = CGPointMake(self.bounds.size.width - 0.5f,
			[self cornerRadius]);
	point.x =
		(round(resolution * point.x +
		alignStroke) - alignStroke) / resolution;
	point.y =
		(round(resolution * point.y +
		alignStroke) - alignStroke) / resolution;
	CGPathAddLineToPoint(path, NULL, point.x, point.y);
	point = CGPointMake((self.bounds.size.width - [self cornerRadius]),
			0.0);
	point.x =
		(round(resolution * point.x +
		alignStroke) - alignStroke) / resolution;
	point.y =
		(round(resolution * point.y +
		alignStroke) - alignStroke) / resolution;
	controlPoint1 =
		CGPointMake(self.bounds.size.width - 0.5f,
			([self cornerRadius] / 2.f));
	controlPoint1.x =
		(round(resolution * controlPoint1.x +
		alignStroke) - alignStroke) / resolution;
	controlPoint1.y =
		(round(resolution * controlPoint1.y +
		alignStroke) - alignStroke) / resolution;
	controlPoint2 =
		CGPointMake((self.bounds.size.width - ([self cornerRadius] / 2.f)),
			0.0);
	controlPoint2.x =
		(round(resolution * controlPoint2.x +
		alignStroke) - alignStroke) / resolution;
	controlPoint2.y =
		(round(resolution * controlPoint2.y +
		alignStroke) - alignStroke) / resolution;
	CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y,
		controlPoint2.x, controlPoint2.y, point.x,
		point.y);
	point	= CGPointMake([self cornerRadius], 0.0);
	point.x =
		(round(resolution * point.x +
		alignStroke) - alignStroke) / resolution;
	point.y =
		(round(resolution * point.y +
		alignStroke) - alignStroke) / resolution;
	CGPathAddLineToPoint(path, NULL, point.x, point.y);
	point	= CGPointMake(0.0, [self cornerRadius]);
	point.x =
		(round(resolution * point.x +
		alignStroke) - alignStroke) / resolution;
	point.y =
		(round(resolution * point.y +
		alignStroke) - alignStroke) / resolution;
	controlPoint1	= CGPointMake(([self cornerRadius] / 2.f), 0.0);
	controlPoint1.x =
		(round(resolution * controlPoint1.x +
		alignStroke) - alignStroke) / resolution;
	controlPoint1.y =
		(round(resolution * controlPoint1.y +
		alignStroke) - alignStroke) / resolution;
	controlPoint2	= CGPointMake(0.0, ([self cornerRadius] / 2.f));
	controlPoint2.x =
		(round(resolution * controlPoint2.x +
		alignStroke) - alignStroke) / resolution;
	controlPoint2.y =
		(round(resolution * controlPoint2.y +
		alignStroke) - alignStroke) / resolution;
	CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y,
		controlPoint2.x, controlPoint2.y, point.x,
		point.y);
	point =
		CGPointMake(0.0, (self.bounds.size.height - [self cornerRadius]));
	point.x =
		(round(resolution * point.x +
		alignStroke) - alignStroke) / resolution;
	point.y =
		(round(resolution * point.y +
		alignStroke) - alignStroke) / resolution;
	CGPathAddLineToPoint(path, NULL, point.x, point.y);
	point = CGPointMake([self cornerRadius],
			self.bounds.size.height - 0.5f);
	point.x =
		(round(resolution * point.x +
		alignStroke) - alignStroke) / resolution;
	point.y =
		(round(resolution * point.y +
		alignStroke) - alignStroke) / resolution;
	controlPoint1 =
		CGPointMake(0.0,
			(self.bounds.size.height - ([self cornerRadius] / 2.f)));
	controlPoint1.x =
		(round(resolution * controlPoint1.x +
		alignStroke) - alignStroke) / resolution;
	controlPoint1.y =
		(round(resolution * controlPoint1.y +
		alignStroke) - alignStroke) / resolution;
	controlPoint2 = CGPointMake(([self cornerRadius] / 2.f),
			self.bounds.size.height - 0.5f);
	controlPoint2.x =
		(round(resolution * controlPoint2.x +
		alignStroke) - alignStroke) / resolution;
	controlPoint2.y =
		(round(resolution * controlPoint2.y +
		alignStroke) - alignStroke) / resolution;
	CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y,
		controlPoint2.x, controlPoint2.y, point.x,
		point.y);
	point = CGPointMake((self.bounds.size.width - [self cornerRadius]),
			self.bounds.size.height - 0.5f);
	point.x =
		(round(resolution * point.x +
		alignStroke) - alignStroke) / resolution;
	point.y =
		(round(resolution * point.y +
		alignStroke) - alignStroke) / resolution;
	CGPathAddLineToPoint(path, NULL, point.x, point.y);
	CGPathCloseSubpath(path);

#pragma mark - if self.state

	// set init gradient

	/*
	 *    if (self.state == UIControlStateHighlighted) {
	 *        gradient = self.highlightGradient;
	 *
	 *    } else {
	 */
	gradient = self.normalGradient;

	/*
	 *   }
	 */

	CGContextAddPath(context, path);
	CGContextSaveGState(context);
	CGContextEOClip(context);
	point = CGPointMake((self.bounds.size.width / 2.0),
			self.bounds.size.height - 0.5f);
	point2 = CGPointMake((self.bounds.size.width / 2.0), 0.0);
	CGContextDrawLinearGradient(context, gradient, point, point2,
		(kCGGradientDrawsBeforeStartLocation |
		kCGGradientDrawsAfterEndLocation));
	CGContextRestoreGState(context);
	[strokeColor setStroke];
	CGContextSetLineWidth(context, stroke);
	CGContextSetLineCap(context, kCGLineCapSquare);
	CGContextAddPath(context, path);
	CGContextStrokePath(context);
	CGPathRelease(path);
}	/* drawRect */

#pragma mark -
#pragma mark Touch Handling
- (void)hesitateUpdate
{
	[self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesBegan:touches withEvent:event];
	[self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesCancelled:touches withEvent:event];
	[self setNeedsDisplay];
	[self	performSelector :@selector(hesitateUpdate) withObject:nil
			afterDelay		:0.1];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesMoved:touches withEvent:event];
	[self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesEnded:touches withEvent:event];
	[self setNeedsDisplay];
	[self	performSelector :@selector(hesitateUpdate) withObject:nil
			afterDelay		:0.1];
}

#pragma mark -
#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)encoder
{
	[super encodeWithCoder:encoder];
	[encoder encodeObject:[self normalGradientColors] forKey:
	@"normalGradientColors"];
	[encoder encodeObject:[self normalGradientLocations] forKey:
	@"normalGradientLocations"];
	[encoder encodeObject:[self highlightGradientColors] forKey:
	@"highlightGradientColors"];
	[encoder encodeObject:[self highlightGradientLocations] forKey:
	@"highlightGradientLocations"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
	if (self = [super initWithCoder:decoder]) {
		[self setNormalGradientColors:[decoder decodeObjectForKey:
		@"normalGradientColors"]];
		[self setNormalGradientLocations:[decoder decodeObjectForKey:
		@"normalGradientLocations"]];
		[self setHighlightGradientColors:[decoder decodeObjectForKey:
		@"highlightGradientColors"]];
		[self setHighlightGradientLocations:[decoder decodeObjectForKey
		:@"highlightGradientLocations"]];
		self.strokeColor =
			[UIColor colorWithRed:0.076 green:0.103 blue:0.195 alpha:1.0];
		self.strokeWeight = 0.0;

		if (self.normalGradientColors == nil) {
			[self useInitStyle];
		}

		[self setOpaque:NO];
		self.backgroundColor =
			[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
	}

	return self;
}	/* initWithCoder */

#pragma mark - resolveImageResource

+ (NSString *)resolveImageResource:(NSString *)resource
{
	NSString	*systemVersion	= [[UIDevice currentDevice] systemVersion];
	BOOL		isLessThaniOS4	=
		([systemVersion compare:@"4.0" options:NSNumericSearch] ==
		NSOrderedAscending);

	if (isLessThaniOS4) {
		return [NSString stringWithFormat:@"%@.png", resource];
	} else {
		if (([[UIScreen mainScreen] respondsToSelector:@selector(scale)]
			== YES) && ([[UIScreen mainScreen] scale] == 2.00)) {
			return [NSString stringWithFormat:@"%@@2x.png", resource];
		}
	}

	return resource;	// if all else fails
}						/* resolveImageResource */

#pragma mark -

- (void)dealloc
{
#if __has_feature(objc_arc)
		normalGradientColors		= nil;
		normalGradientLocations		= nil;
		highlightGradientLocations	= nil;
		strokeColor = nil;

#else
		[normalGradientColors release];
		[normalGradientLocations release];
		[highlightGradientColors release];
		[highlightGradientLocations release];
		[strokeColor release];
#endif

	if (normalGradient != NULL) {
		CGGradientRelease(normalGradient);
	}

	if (highlightGradient != NULL) {
		CGGradientRelease(highlightGradient);
	}

#if __has_feature(objc_arc)
#else
		[super dealloc];
#endif
}	/* dealloc */

@end
