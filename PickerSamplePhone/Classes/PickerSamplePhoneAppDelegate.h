//==============================================================================
//
//  PickerSamplePhoneAppDelegate.h
//  PickerSamplePhone
//
//  Created by Troy Gaul on 8/12/10.
//
//  Copyright (c) 2011 InfinitApps LLC - http://infinitapps.com
//	Some rights reserved: http://opensource.org/licenses/MIT
//
//==============================================================================

#import <UIKit/UIKit.h>

@class PickerSamplePhoneViewController;

//------------------------------------------------------------------------------

@interface PickerSamplePhoneAppDelegate : NSObject< UIApplicationDelegate >

@property( nonatomic, retain ) IBOutlet UIWindow* window;
@property( nonatomic, retain ) IBOutlet PickerSamplePhoneViewController* viewController;

@end

//------------------------------------------------------------------------------
