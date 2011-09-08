//==============================================================================
//
//  PickerSamplePadAppDelegate.h
//  PickerSamplePad
//
//  Created by Troy Gaul on 8/17/10.
//
//  Copyright (c) 2011 InfinitApps LLC: http://infinitapps.com
//	Some rights reserved: http://opensource.org/licenses/MIT
//
//==============================================================================

#import <UIKit/UIKit.h>

@class PickerSamplePadViewController;

//------------------------------------------------------------------------------

@interface PickerSamplePadAppDelegate : NSObject< UIApplicationDelegate >

@property( nonatomic, retain ) IBOutlet UIWindow* window;
@property( nonatomic, retain ) IBOutlet PickerSamplePadViewController* viewController;

@end

//------------------------------------------------------------------------------
