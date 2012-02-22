The InfiniApps Color Picker, known as InfColorPicker, is a view controller for use in iOS applications to allow the selection of a color from RGB space, but using an HSB representation of that color space to make selection of a color easier for a human.

![InfColorPicker Screenshot](http://files.droplr.com/files_production/acc_11383/BJfk?AWSAccessKeyId=AKIAJSVQN3Z4K7MT5U2A&Expires=1329883711&Signature=3tEJQv5h0FICr3C%2FmmC7snMAxx0%3D&response-content-disposition=inline%3B+filename%3D%22Screen+Shot+2012-02-21+at+8.06.53+PM.png%22)

InfColorPicker is distributed with an MIT license. It supports iPhone OS 3.x as well as iOS 4 and 5.

Usage
-----

The main component is the `InfColorPickerController` class, which can be instantiated and hosted in a few different ways, such as in a popover view controller for the iPad, pushed onto a navigation controller navigation stack, or presented modally on an iPhone.

The initial color can be set via the property `sourceColor`, which will be shown alongside the user-selected `resultColor` color, and these can be accessed and changed while the color picker is visible.

In order to receive the selected color(s) back from the controller, you have to have an object that implements one of the methods in the `InfColorPickerControllerDelegate` protocol.

Example
-------

	- (void) changeColor
	{
		InfColorPickerController* picker = [ InfColorPickerController colorPickerViewController ];
		
		picker.sourceColor = self.color;
		picker.delegate = self;
		
		[ picker presentModallyOverViewController: self ];
	}

	- (void) colorPickerControllerDidFinish: (InfColorPickerController*) picker
	{
		self.color = picker.resultColor;
		
		[ self dismissModalViewControllerAnimated: YES ];
	}

