//==============================================================================
//
//  PickerSampleTableViewController.h
//  PickerSamplePad
//
//  Created by Troy Gaul on 9/7/11.
//
//  Copyright (c) 2011 InfinitApps LLC - http://infinitapps.com
//	Some rights reserved: http://opensource.org/licenses/MIT
//
//==============================================================================

#import <UIKit/UIKit.h>

#import "InfColorPicker.h"

@interface PickerSampleTableViewController : UITableViewController< InfColorPickerControllerDelegate >
{
	UIColor* colors[ 3 ];
	int pickingColorIndex;
}

@end
