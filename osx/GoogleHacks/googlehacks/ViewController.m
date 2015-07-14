//
//  ViewController.m
//  GoogleHacks
//
//  Created by Randy McMillan on 7/9/15.
//  Copyright (c) 2015 Randy McMillan. All rights reserved.
//
// http://en.osdn.jp/projects/sfnet_ghh/

// https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Strings/Articles/CreatingStrings.html#//apple_ref/doc/uid/20000148-CJBCJHHI

#import "ViewController.h"
#import "MyViewController.h"
#import "MyCustomAnimator.h"
#import "DataObjects.h"
#include "Constants.h"

@implementation ViewController

<<<<<<< HEAD
@synthesize searchTextField, url, urls, ws;
@synthesize searchString, ReturnSearchString;
=======
@synthesize data_object;
@synthesize searchTextField, urls, ws;
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...

#pragma mark ViewController viewDidLoad

- (void)viewDidLoad
{
<<<<<<< HEAD
	NSLog(@"%@", NSStringFromSelector(_cmd));

	[super viewDidLoad];
	self.title = @"Presenting ViewController";
	self.ReturnSearchString = [[ReturnSearchString alloc]init];
	self.urls	= [NSMutableArray arrayWithCapacity:100];
	self.ws		= [NSWorkspace sharedWorkspace];
}

=======
	[super viewDidLoad];
	self.title = @"Presenting ViewController";
	[self.data_object = [DataObjects alloc] init];
	[self.data_object loadValues:nil];
	self.urls = [NSMutableArray arrayWithCapacity:100];
	self.ws = [NSWorkspace sharedWorkspace];
}

- (void)setRepresentedObject:(id)representedObject
{
	[super setRepresentedObject:representedObject];
}

>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
#pragma mark ViewController figureOutTheLogicHere
- (NSString *)returnSearchString:(NSMutableString *)searchString
{
<<<<<<< HEAD
	NSLog(@"%@", NSStringFromSelector(_cmd));
	self.searchString = (NSMutableString *)[[self.searchTextField stringValue] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
	NSLog(@"%@", self.searchString);
	return self.searchString;
=======
	[self assembleTypesString];
	NSLog(@"%@", self.data_object.types_str);

	if ([self.data_object.types_str isEqualToString:@""]) {} else {}

	self.data_object.search_str = [self returnSearchField];
	searchString = [BASE_URL stringByAppendingString:@"q="];
	NSLog(@"%@", searchString);
	searchString = [searchString stringByAppendingString:[self returnSearchField]];
	NSLog(@"%@", searchString);

	return searchString;
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
}

- (IBAction)enterFromSearchField:(id)sender
{
<<<<<<< HEAD
	NSLog(@"%@", NSStringFromSelector(_cmd));
	[self enterFromButton:(id)sender];
}

- (IBAction)enterFromButton:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	// [self openURL:[NSURL URLWithString:[self returnSearchString:nil]] inBackground:YES];
}

- (void)openURL:(NSMutableString *)mutableString inBackground:(BOOL)background
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

    
	
    mutableString = [self.ReturnSearchString returnSearchString:mutableString];
	NSLog(@"url = %@", mutableString);
}

=======
	NSLog(@"searchTextField = %@", [[self.searchTextField stringValue] stringByReplacingOccurrencesOfString:@" " withString:@"%20"]);
	[self openURLFromButton:(id)sender];
}

- (NSString *)returnSearchField
{
	NSString *returnSearchField = nil;

	returnSearchField = [[self.searchTextField stringValue] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
	NSLog(@"returnSearchField = %@", returnSearchField);

	return returnSearchField;
}

- (NSURL *)modifyURL:(NSString *)modString
{
	NSLog(@"%@", modString);// null
	NSURL *modifiedURL = [NSURL URLWithString:modString];

	return modifiedURL;
}

#pragma mark ViewController handle password logic

- (IBAction)openURLFromButton:(id)sender
{
	[self openURL:[NSURL URLWithString:[self returnSearchString:nil]] inBackground:YES];
}

- (void)openURL:(NSURL *)url inBackground:(BOOL)background
{
    
    
#pragma mark ViewController openPasswordQueries open
    NSLog(@"[self.data_object.passWordLinkArray count] =  %lx",[self.data_object.passWordLinkArray count]);

    

    /*
	if (background) {
		NSArray *urls = [NSArray arrayWithObject:url];
		[self.ws openURLs:urls withAppBundleIdentifier:nil options:NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifiers:nil];
	} else {
		[[NSWorkspace sharedWorkspace] openURL:url];
	}
*/
    
	//[self openPasswordQueries];
	// gotta remove objects and revuild every time
	//NSLog(@"self.urls count = %ld", [self.urls count]);

	//[[NSWorkspace sharedWorkspace] openURLs:[self.urls arrayByAddingObjectsFromArray:self.data_object.passWordLinkArray] withAppBundleIdentifier:nil options:NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifiers:nil];

	// for (int i = 0; i < [self.data_object.passWordLinkArray count]; i++) {
	//   [[NSWorkspace sharedWorkspace] openURLs:[NSURL URLWithString:self.data_object.passWordLinkArray[i]] withAppBundleIdentifier:nil options:NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifiers:nil];
	// }
	NSLog(@"self.urls count = %ld", [self.urls count]);

	[self.urls removeAllObjects];
}

>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
#pragma mark ViewController audioExtention

- (IBAction)audioExtension:(id)sender	// sender is NSMatrix object
{
<<<<<<< HEAD
	NSLog(@"%@", NSStringFromSelector(_cmd));
=======
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (NSMutableString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"mpg"]) {
		if ([selCell state] == 0) {
<<<<<<< HEAD
			self.ReturnSearchString.data_object.mp3_check = 0;
		} else {
			self.ReturnSearchString.data_object.mp3_check = 1;
=======
			self.data_object.mp3_check = FALSE;
		} else {
			self.data_object.mp3_check = TRUE;
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
		}
	}

	if ([[selCell title] isEqualToString:@"mpg"]) {
		if ([selCell state] == 0) {
<<<<<<< HEAD
			self.ReturnSearchString.data_object.mp3_check = 0;
		} else {
			self.ReturnSearchString.data_object.mp3_check = (int *)1;
=======
			self.data_object.wma_check = FALSE;
		} else {
			self.data_object.wma_check = TRUE;
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
		}
	}

	if ([[selCell title] isEqualToString:@"wma"]) {
		if ([selCell state] == 0) {
<<<<<<< HEAD
			self.ReturnSearchString.data_object.wma_check = 0;
		} else {
			self.ReturnSearchString.data_object.wma_check = (int *)1;
=======
			self.data_object.ogg_check = FALSE;
		} else {
			self.data_object.ogg_check = TRUE;
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
		}
	}
    [self.ReturnSearchString assembleTypesString];


<<<<<<< HEAD
#ifdef DEBUG
		
#endif
=======
	[self assembleTypesString];
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
}

- (IBAction)videoExtension:(id)sender
{
<<<<<<< HEAD
	NSLog(@"%@", NSStringFromSelector(_cmd));
=======
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (NSMutableString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"mpg"]) {
		if ([selCell state] == 0) {
<<<<<<< HEAD
			self.ReturnSearchString.data_object.mpg_check = 0;
		} else {
			self.ReturnSearchString.data_object.mpg_check = 1;
=======
			self.data_object.mpg_check = FALSE;
		} else {
			self.data_object.mpg_check = TRUE;
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
		}
	}

	if ([[selCell title] isEqualToString:@"avi"]) {
		if ([selCell state] == 0) {
<<<<<<< HEAD
			self.ReturnSearchString.data_object.avi_check = 0;
		} else {
			self.ReturnSearchString.data_object.avi_check = (int *)1;
=======
			self.data_object.avi_check = FALSE;
		} else {
			self.data_object.avi_check = TRUE;
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
		}
	}

	if ([[selCell title] isEqualToString:@"wmv"]) {
		if ([selCell state] == 0) {
<<<<<<< HEAD
			self.ReturnSearchString.data_object.wmv_check = 0;
		} else {
			self.ReturnSearchString.data_object.wmv_check = (int *)1;
=======
			self.data_object.wmv_check = FALSE;
		} else {
			self.data_object.wmv_check = TRUE;
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
		}
	}

	if ([[selCell title] isEqualToString:@"divx"]) {
		if ([selCell state] == 0) {
<<<<<<< HEAD
			self.ReturnSearchString.data_object.divx_check = 0;
		} else {
			self.ReturnSearchString.data_object.divx_check = (int *)1;
=======
			self.data_object.divx_check = FALSE;
		} else {
			self.data_object.divx_check = TRUE;
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
		}
	}

	if ([[selCell title] isEqualToString:@"flv"]) {
		if ([selCell state] == 0) {
<<<<<<< HEAD
			self.ReturnSearchString.data_object.flv_check = 0;
		} else {
			self.ReturnSearchString.data_object.flv_check = (int *)1;
=======
			self.data_object.flv_check = FALSE;
		} else {
			self.data_object.flv_check = TRUE;
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
		}
	}

#ifndef DEBUG
		// NSLog(@"self.data_object.mpg_check IS : %@", (self.data_object.mpg_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.avi_check IS : %@", (self.data_object.avi_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.wmv_check IS : %@", (self.data_object.wmv_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.divx_check IS : %@", (self.data_object.divx_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.flv_check IS : %@", (self.data_object.flv_check == TRUE) ? @"TRUE" : @"FALSE");
#endif
<<<<<<< HEAD
=======

	[self assembleTypesString];
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
}

- (IBAction)documentExtension:(id)sender
{
<<<<<<< HEAD
	NSLog(@"%@", NSStringFromSelector(_cmd));
=======
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (NSMutableString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"pdf"]) {
<<<<<<< HEAD
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"txt"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"lit"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"rar"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"doc"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"rtf"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"pps"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"chm"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"zip1"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"odt"]) {
		if ([selCell state] == 0) {} else {}
=======
		if ([selCell state] == 0) {
			self.data_object.pdf_check = FALSE;
		} else {
			self.data_object.pdf_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"txt"]) {
		if ([selCell state] == 0) {
			self.data_object.txt_check = FALSE;
		} else {
			self.data_object.txt_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"lit"]) {
		if ([selCell state] == 0) {
			self.data_object.lit_check = FALSE;
		} else {
			self.data_object.lit_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"rar"]) {
		if ([selCell state] == 0) {
			self.data_object.rar_check = FALSE;
		} else {
			self.data_object.rar_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"doc"]) {
		if ([selCell state] == 0) {
			self.data_object.doc_check = FALSE;
		} else {
			self.data_object.doc_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"rtf"]) {
		if ([selCell state] == 0) {
			self.data_object.rtf_check = FALSE;
		} else {
			self.data_object.rtf_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"pps"]) {
		if ([selCell state] == 0) {
			self.data_object.pps_check = FALSE;
		} else {
			self.data_object.pps_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"chm"]) {
		if ([selCell state] == 0) {
			self.data_object.chm_check = FALSE;
		} else {
			self.data_object.chm_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"zip1"]) {
		if ([selCell state] == 0) {
			self.data_object.zip1_check = FALSE;
		} else {
			self.data_object.zip1_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"odt"]) {
		if ([selCell state] == 0) {
			self.data_object.odt_check = FALSE;
		} else {
			self.data_object.odt_check = TRUE;
		}
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
	}

#ifndef DEBUG
		// NSLog(@"self.data_object.pdf_check IS : %@", (self.data_object.pdf_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.txt_check IS : %@", (self.data_object.txt_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.lit_check IS : %@", (self.data_object.lit_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.rar_check IS : %@", (self.data_object.rar_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.doc_check IS : %@", (self.data_object.doc_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.rtf_check IS : %@", (self.data_object.rtf_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.pps_check IS : %@", (self.data_object.pps_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.chm_check IS : %@", (self.data_object.chm_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.zip1_check IS : %@", (self.data_object.zip1_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.odt_check IS : %@", (self.data_object.odt_check == TRUE) ? @"TRUE" : @"FALSE");
#endif
<<<<<<< HEAD
=======

	[self assembleTypesString];
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
}

- (IBAction)passwordQuery:(id)sender
{
<<<<<<< HEAD
	NSLog(@"%@", NSStringFromSelector(_cmd));
=======
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %ld", (long)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"pass 1"]) {
<<<<<<< HEAD
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"pass 2"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"pass 3"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"pass 4"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"pass 5"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"pass 6"]) {
		if ([selCell state] == 0) {} else {}
	}
=======
		if ([selCell state] == 0) {
			self.data_object.pass_1 = FALSE;
		} else {
			self.data_object.pass_1 = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"pass 2"]) {
		if ([selCell state] == 0) {
			self.data_object.pass_2 = FALSE;
		} else {
			self.data_object.pass_2 = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"pass 3"]) {
		if ([selCell state] == 0) {
			self.data_object.pass_3 = FALSE;
		} else {
			self.data_object.pass_3 = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"pass 4"]) {
		if ([selCell state] == 0) {
			self.data_object.pass_4 = FALSE;
		} else {
			self.data_object.pass_4 = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"pass 5"]) {
		if ([selCell state] == 0) {
			self.data_object.pass_5 = FALSE;
		} else {
			self.data_object.pass_5 = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"pass 6"]) {
		if ([selCell state] == 0) {
			self.data_object.pass_6 = FALSE;
		} else {
			self.data_object.pass_6 = TRUE;
		}
	}

#ifdef DEBUG
		NSLog(@"self.data_object.pass_check IS : %@", (self.data_object.pass_check == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_text IS : %@", (self.data_object.pass_text == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_1 IS : %@", (self.data_object.pass_1 == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_2 IS : %@", (self.data_object.pass_2 == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_3 IS : %@", (self.data_object.pass_3 == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_4 IS : %@", (self.data_object.pass_4 == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_5 IS : %@", (self.data_object.pass_5 == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_6 IS : %@", (self.data_object.pass_6 == TRUE) ? @"TRUE" : @"FALSE");
#endif
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
}

- (IBAction)fileExtension:(id)sender
{
<<<<<<< HEAD
	NSLog(@"%@", NSStringFromSelector(_cmd));

=======
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (id)[selCell title]);

	if ([selCell tag] == 0) {
		// file ext
		self.data_object.exe_check	= FALSE;
		self.data_object.rar_check1 = FALSE;
		self.data_object.zip_check	= FALSE;
		self.data_object.ddl_check	= FALSE;
	} else if ([selCell tag] == 1) {
		// file ext
		self.data_object.exe_check	= TRUE;
		self.data_object.rar_check1 = FALSE;
		self.data_object.zip_check	= FALSE;
		self.data_object.ddl_check	= FALSE;
	} else if ([selCell tag] == 2) {
		// file ext
		self.data_object.exe_check	= FALSE;
		self.data_object.rar_check1 = TRUE;
		self.data_object.zip_check	= FALSE;
		self.data_object.ddl_check	= FALSE;
	} else if ([selCell tag] == 3) {
		// file ext
		self.data_object.exe_check	= FALSE;
		self.data_object.rar_check1 = FALSE;
		self.data_object.zip_check	= TRUE;
		self.data_object.ddl_check	= FALSE;
	} else if ([selCell tag] == 4) {
		// file ext
		self.data_object.exe_check	= FALSE;
		self.data_object.rar_check1 = FALSE;
		self.data_object.zip_check	= FALSE;
		self.data_object.ddl_check	= TRUE;
	} else {		// NSLog(@"Error");
	}
<<<<<<< HEAD
=======

#ifndef DEBUG
		// NSLog(@"self.data_object.exe_check IS : %@", (self.data_object.exe_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.rar_check1 IS : %@", (self.data_object.rar_check1 == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.zip_check IS : %@", (self.data_object.zip_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.ddl_check IS : %@", (self.data_object.ddl_check == TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
}

- (IBAction)linkQuery:(id)sender
{
<<<<<<< HEAD
	NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", [selCell title]);
=======
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (id)[selCell title]);
>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...

	if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else {// NSLog(@"Error");
	}

	[self assembleTypesString];
}

<<<<<<< HEAD
=======
- (void)assembleTypesString
{
	self.data_object.types_str = @"";
	// self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@"%7C"];

	// Audio
	if (self.data_object.mp3_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".mp3%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.wma_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".wma%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.ogg_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".ogg%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	// Docs
	if (self.data_object.pdf_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".pdf%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.txt_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".txt%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.lit_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".lit%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.rar_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".rar%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.doc_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".doc%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.rtf_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".rtf%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.pps_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".pps%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.chm_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".chm%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.zip1_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".zip1%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.odt_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".odt%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	// Video
	if (self.data_object.mpg_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".mpg%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.avi_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".avi%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.wmv_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".wmv%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.divx_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".divx%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.flv_check == TRUE) {
		self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".flv%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

    
    
    
    
	if ([self.data_object.types_str length] <= 7) {
		NSLog(@"less than = 7");
		// http://borkware.com/quickies/one?topic=NSString

		self.data_object.types_str = [self truncateString:self.data_object.types_str toCharacterCount:4];

		// https://bdpuqvsqmphctrcs.onion.to/data/
	}

	if ([self.data_object.types_str isEqualToString:@".divx%7C"]) {
		self.data_object.types_str = [self truncateString:self.data_object.types_str toCharacterCount:5];
	}

    
    
    
    NSLog(@"assembleTypesString");
	NSLog(@"self.data_object.types_str = %@", self.data_object.types_str);
}

>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
- (NSString *)	truncateString	:(NSString *)string
				toCharacterCount:(NSUInteger)count
{
	NSRange range = {0, MIN(string.length, count)};

	range = [string rangeOfComposedCharacterSequencesForRange:range];
	NSString *trunc = [string substringWithRange:range];

	if (trunc.length < string.length) {
		trunc = [trunc stringByAppendingString:@""];
	}

	return trunc;
}	// truncateString

<<<<<<< HEAD
=======

#pragma mark ViewController openPasswordQueries

- (NSMutableArray *)openPasswordQueries:(NSMutableArray *)mutableArray
{
	if (self.data_object.pass_1 == TRUE) {
        [self.data_object.passWordLinkArray addObject:self.data_object.pass_1_str];

		for (int i = 0; i < [self.data_object.passWordLinkArray count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_2 == TRUE) {
        [self.data_object.passWordLinkArray addObject:self.data_object.pass_2_str];

        for (int i = 0; i < [self.data_object.passWordLinkArray count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_3 == TRUE) {
        [self.data_object.passWordLinkArray addObject:self.data_object.pass_3_str];

        for (int i = 0; i < [self.data_object.passWordLinkArray count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_4 == TRUE) {
        [self.data_object.passWordLinkArray addObject:self.data_object.pass_4_str];

        for (int i = 0; i < [self.data_object.passWordLinkArray count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_5 == TRUE) {
        [self.data_object.passWordLinkArray addObject:self.data_object.pass_5_str];

        for (int i = 0; i < [self.data_object.passWordLinkArray count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_6 == TRUE) {
		
        [self.data_object.passWordLinkArray addObject:(NSString *)self.data_object.pass_6_str];
        
        for (int i = 0; i < [self.data_object.passWordLinkArray count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

    mutableArray = self.data_object.passWordLinkArray;
    
    return mutableArray;
}

>>>>>>> parent of 92e63e1... Begin Beter Data Structure MVC...
@end
