//==============================================================================
//
//  InfColorPickerController.h
//  InfColorPicker
//
//  Created by Troy Gaul on 7 Aug 2010.
//
//  Copyright (c) 2011 InfinitApps LLC: http://infinitapps.com
//	Some rights reserved: http://opensource.org/licenses/MIT
//
//==============================================================================

#import <UIKit/UIKit.h>

@class InfColorBarView;
@class InfColorSquareView;
@class InfColorBarPicker;
@class InfColorSquarePicker;

@protocol InfColorPickerControllerDelegate;

//------------------------------------------------------------------------------

@interface InfColorPickerController : UIViewController {
	float hue;
	float saturation;
	float brightness;
}

// Public API:

+ (InfColorPickerController*) colorPickerViewController;
+ (CGSize) idealSizeForViewInPopover;

- (void) presentModallyOverViewController: (UIViewController*) controller;

@property (nonatomic) UIColor* sourceColor;
@property (nonatomic) UIColor* resultColor;

@property (weak, nonatomic) id <InfColorPickerControllerDelegate> delegate;

// IB outlets:

@property (nonatomic) IBOutlet InfColorBarView* barView;
@property (nonatomic) IBOutlet InfColorSquareView* squareView;
@property (nonatomic) IBOutlet InfColorBarPicker* barPicker;
@property (nonatomic) IBOutlet InfColorSquarePicker* squarePicker;
@property (nonatomic) IBOutlet UIView* sourceColorView;
@property (nonatomic) IBOutlet UIView* resultColorView;
@property (nonatomic) IBOutlet UINavigationController* navController;

@end

//------------------------------------------------------------------------------

@protocol InfColorPickerControllerDelegate

@optional

- (void) colorPickerControllerDidFinish: (InfColorPickerController*) controller;
	// This is only called when the color picker is presented modally.

- (void) colorPickerControllerDidChangeColor: (InfColorPickerController*) controller;

@end

//------------------------------------------------------------------------------
