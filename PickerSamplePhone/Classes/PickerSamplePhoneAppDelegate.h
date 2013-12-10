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

@property( nonatomic, strong ) IBOutlet UIWindow* window;
@property( nonatomic, strong ) IBOutlet PickerSamplePhoneViewController* viewController;

@end

//------------------------------------------------------------------------------
