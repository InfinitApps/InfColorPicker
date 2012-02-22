//==============================================================================
//
//  InfColorBarPicker.m
//  InfColorPicker
//
//  Created by Troy Gaul on 8/9/10.
//
//  Copyright (c) 2011 InfinitApps LLC - http://infinitapps.com
//	Some rights reserved: http://opensource.org/licenses/MIT
//
//==============================================================================

#import "InfAlphaBarPicker.h"

#import "InfColorIndicatorView.h"
#import "InfHSBSupport.h"

//------------------------------------------------------------------------------

#define kContentInsetX 20

//==============================================================================

@implementation InfAlphaBarView

@synthesize color;

//------------------------------------------------------------------------------

static CGImageRef createContentImage()
{
	return createCheckerPatternImage();
}

//------------------------------------------------------------------------------

- (void) drawRect: (CGRect) rect
{
	CGImageRef image = createContentImage();
    UIColor *patternColor = [UIColor colorWithPatternImage:[UIImage imageWithCGImage:image]];

	
	if( image ) {
		CGContextRef context = UIGraphicsGetCurrentContext();
		
        [patternColor setFill];
        
        CGContextFillRect(context, self.bounds);
        
		CGImageRelease( image );
        
        float r,g,b,a;
        [color getRed:&r green:&g blue:&b alpha:&a];
        
        CGGradientRef myGradient;
        CGColorSpaceRef myColorspace = CGColorSpaceCreateDeviceRGB();
        size_t num_locations = 2;
        CGFloat locations[2] = { 0.0, 0.95 };
        CGFloat components[8] = { r ,g ,b , 0.f,  // Start color
            r,g,b, 1.f }; // End color
        
        myGradient = CGGradientCreateWithColorComponents (myColorspace, components,
                                                          locations, num_locations);
        
        
        CGPoint myStartPoint, myEndPoint;
        myStartPoint.x = 0;
        myStartPoint.y = 0;
        myEndPoint.x = self.frame.size.width;
        myEndPoint.y = 0;

        CGContextDrawLinearGradient(context, myGradient, myStartPoint
                                        , myEndPoint,
                                     kCGGradientDrawsAfterEndLocation);
        
	}
}

- (void)setColor:(UIColor *)newColor
{
    color = newColor;
    
    [self setNeedsDisplay];
    
}

//------------------------------------------------------------------------------

@end

//==============================================================================

@implementation InfAlphaBarPicker

//------------------------------------------------------------------------------

@synthesize value;

//------------------------------------------------------------------------------
#pragma mark	Lifetime
//------------------------------------------------------------------------------

- (void) dealloc
{
	[ indicator release ];
	
	[ super dealloc ];
}

//------------------------------------------------------------------------------
#pragma mark	Drawing
//------------------------------------------------------------------------------

- (void) layoutSubviews
{
	if( indicator == nil ) {
		CGFloat kIndicatorSize = 24.0f;
		indicator = [ [ InfColorIndicatorView alloc ] initWithFrame: CGRectMake( 0, 0, kIndicatorSize, kIndicatorSize ) ];
        indicator.fill = NO;
		[ self addSubview: indicator ];
	}
	
	indicator.color = [ UIColor colorWithHue: value saturation: 1.0f 
								  brightness: 1.0f alpha: 1.0f ];
	
	CGFloat indicatorLoc = kContentInsetX + ( self.value * ( self.bounds.size.width - 2 * kContentInsetX ) );
	indicator.center = CGPointMake( indicatorLoc, CGRectGetMidY( self.bounds ) );
    
}

//------------------------------------------------------------------------------
#pragma mark	Properties
//------------------------------------------------------------------------------

- (void) setValue: (float) newValue
{
	if( newValue != value ) {
		value = newValue;
		
		[ self sendActionsForControlEvents: UIControlEventValueChanged ];
		[ self setNeedsLayout ];
	}
}


//------------------------------------------------------------------------------
#pragma mark	Tracking
//------------------------------------------------------------------------------

- (void) trackIndicatorWithTouch: (UITouch*) touch 
{
	float percent = ( [ touch locationInView: self ].x - kContentInsetX ) 
				  / ( self.bounds.size.width - 2 * kContentInsetX );
	
	self.value = pin( 0.0f, percent, 1.0f );
}

//------------------------------------------------------------------------------

- (BOOL) beginTrackingWithTouch: (UITouch*) touch
					  withEvent: (UIEvent*) event
{
	[ self trackIndicatorWithTouch: touch ];
	
	return YES;
}

//------------------------------------------------------------------------------

- (BOOL) continueTrackingWithTouch: (UITouch*) touch 
						 withEvent: (UIEvent*) event
{
	[ self trackIndicatorWithTouch: touch ];
	
	return YES;
}

//------------------------------------------------------------------------------

@end

//==============================================================================
