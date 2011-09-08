//==============================================================================
//
//  PickerSampleTableViewController.m
//  PickerSamplePad
//
//  Created by Troy Gaul on 9/7/11.
//
//  Copyright (c) 2011 InfinitApps LLC: http://infinitapps.com
//	Some rights reserved: http://opensource.org/licenses/MIT
//
//==============================================================================

#import "PickerSampleTableViewController.h"

//==============================================================================

@implementation PickerSampleTableViewController

//------------------------------------------------------------------------------

- (void) dealloc
{
	[ colors[ 0 ] release ];
	[ colors[ 1 ] release ];
	[ colors[ 2 ] release ];
	
	[ super dealloc ];
}

//------------------------------------------------------------------------------
#pragma mark - View lifecycle
//------------------------------------------------------------------------------

- (void) viewDidLoad
{
	[ super viewDidLoad ];

	if( colors[ 0 ] == nil ) {
		colors[ 0 ] = [ [ UIColor blackColor ] retain ];
		colors[ 1 ] = [ [ UIColor redColor ] retain ];
		colors[ 2 ] = [ [ UIColor greenColor ] retain ];
	}
	
	self.contentSizeForViewInPopover = [ InfColorPickerController idealSizeForViewInPopover ];
}

//------------------------------------------------------------------------------

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
	return YES;
}

//------------------------------------------------------------------------------
#pragma mark - Table view data source
//------------------------------------------------------------------------------

- (NSInteger) numberOfSectionsInTableView: (UITableView*) tableView
{
	return 1;
}

//------------------------------------------------------------------------------

- (NSInteger) tableView: (UITableView*) tableView numberOfRowsInSection: (NSInteger) section
{
	return 3;
}

//------------------------------------------------------------------------------

- (UITableViewCell*) tableView: (UITableView*) tableView cellForRowAtIndexPath: (NSIndexPath*) indexPath
{
	static NSString* CellIdentifier = @"Cell";
	
	UITableViewCell* cell = [ tableView dequeueReusableCellWithIdentifier: CellIdentifier ];
	if( cell == nil ) {
		cell = [ [ [ UITableViewCell alloc ] initWithStyle: UITableViewCellStyleDefault 
										   reuseIdentifier: CellIdentifier ] autorelease ];
	}
	
	// Configure the cell:
	
	if( indexPath.row <= 3 )	// just a sanity test
		cell.textLabel.textColor = colors[ indexPath.row ];
	
	cell.textLabel.text = [ NSString stringWithFormat: @"Color # %d", indexPath.row + 1 ];
	
	return cell;
}

//------------------------------------------------------------------------------
#pragma mark - Table view delegate
//------------------------------------------------------------------------------

- (void) tableView: (UITableView*) tableView didSelectRowAtIndexPath: (NSIndexPath*) indexPath
{
	UITableViewCell* cell = [ self.tableView cellForRowAtIndexPath: indexPath ];
	
	pickingColorIndex = indexPath.row;
	
	InfColorPickerController* picker = [ InfColorPickerController colorPickerViewController ];
	
	picker.sourceColor = colors[ pickingColorIndex ];
	picker.delegate = self;
	picker.navigationItem.title = cell.textLabel.text;
	
	[ self.navigationController pushViewController: picker animated: YES ];
}

//------------------------------------------------------------------------------
#pragma mark - InfColorPickerControllerDelegate
//------------------------------------------------------------------------------

- (void) colorPickerControllerDidChangeColor: (InfColorPickerController*) controller
{
	NSUInteger indexes[ 2 ] = { 0, pickingColorIndex };
	NSIndexPath* indexPath = [ NSIndexPath indexPathWithIndexes: indexes length: 2 ];
	UITableViewCell* cell = [ self.tableView cellForRowAtIndexPath: indexPath ];
	
	[ colors[ pickingColorIndex ] release ];
	colors[ pickingColorIndex ] = [ controller.resultColor retain ];
	
	cell.textLabel.textColor = controller.resultColor;
}

//------------------------------------------------------------------------------

@end

//==============================================================================
