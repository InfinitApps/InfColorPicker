//==============================================================================
//
//  PickerSamplePhoneAppDelegate.m
//  PickerSamplePhone
//
//  Created by Troy Gaul on 8/12/10.
//
//  Copyright (c) 2011 InfinitApps LLC - http://infinitapps.com
//	Some rights reserved: http://opensource.org/licenses/MIT
//
//==============================================================================

#import "PickerSamplePhoneAppDelegate.h"

#import "PickerSamplePhoneViewController.h"

//==============================================================================

@implementation PickerSamplePhoneAppDelegate

//------------------------------------------------------------------------------

@synthesize window;
@synthesize viewController;

//------------------------------------------------------------------------------

- (BOOL) application: (UIApplication*) application
	didFinishLaunchingWithOptions: (NSDictionary*) launchOptions
{
    [ window addSubview: viewController.view ];
    [ window makeKeyAndVisible ];
	
    return YES;
}

//------------------------------------------------------------------------------

- (void) dealloc
{
	[ viewController release ];
	[ window release ];

	[ super dealloc ];
}

//------------------------------------------------------------------------------

@end

//==============================================================================
