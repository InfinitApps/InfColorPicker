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

@property (strong, nonatomic) UIColor* sourceColor;
@property (strong, nonatomic) UIColor* resultColor;

@property (weak, nonatomic) id <InfColorPickerControllerDelegate> delegate;

// IB outlets:

@property (strong, nonatomic) IBOutlet InfColorBarView* barView;
@property (strong, nonatomic) IBOutlet InfColorSquareView* squareView;
@property (strong, nonatomic) IBOutlet InfColorBarPicker* barPicker;
@property (strong, nonatomic) IBOutlet InfColorSquarePicker* squarePicker;
@property (strong, nonatomic) IBOutlet UIView* sourceColorView;
@property (strong, nonatomic) IBOutlet UIView* resultColorView;
@property (strong, nonatomic) IBOutlet UINavigationController* navController;

@end

//------------------------------------------------------------------------------

@protocol InfColorPickerControllerDelegate

@optional

- (void) colorPickerControllerDidFinish: (InfColorPickerController*) controller;
	// This is only called when the color picker is presented modally.

- (void) colorPickerControllerDidChangeColor: (InfColorPickerController*) controller;

@end

//------------------------------------------------------------------------------
