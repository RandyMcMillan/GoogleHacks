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

@synthesize data_object;
@synthesize searchTextField;


#pragma mark ViewController viewDidLoad

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.title = @"Presenting ViewController";
	[self.data_object = [DataObjects alloc] init];
	[self.data_object loadValues:nil];

}

- (void)setRepresentedObject:(id)representedObject
{
	[super setRepresentedObject:representedObject];
}

#pragma mark ViewController figureOutTheLogicHere
- (NSString *)returnSearchString:(NSString *)searchString {

   	//NSURL *url = [self modifyURL:nil];
    //NSLog(@"url = %@", url);
    //NSString *scheme = [url scheme];
    
    //if ([scheme isEqualToString:@"file"]) {} else {
        [self assembleTypesString];
        //NSLog(@"before else... = %@", self.data_object.types_str);
        NSLog(@"%@", self.data_object.types_str);
        
        if ([self.data_object.types_str isEqualToString:@""]) {
            //[self openURL:url inBackground:YES];
        } else {
            //  NSLog(@"after else... = %@", self.data_object.types_str);
            //[self openURL:url inBackground:YES];
        }
//    }
 
   	 self.data_object.search_str = [self returnSearchField];
    searchString = [BASE_URL stringByAppendingString:@"q="];
    NSLog(@"%@", searchString);
    searchString = [searchString stringByAppendingString:[self returnSearchField]];
    NSLog(@"%@", searchString);
    
    return searchString;
}

- (IBAction)getSearchField:(id)sender{

    NSLog(@"%@",[[self.searchTextField stringValue] stringByReplacingOccurrencesOfString:@" " withString:@"%20"]);

}
- (NSString *)returnSearchField
{
	NSString *returnSearchField = nil;

	returnSearchField = [[self.searchTextField stringValue] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSLog(@"returnSearchField = %@",returnSearchField);
    return returnSearchField;
}

- (NSURL *)modifyURL:(NSString *)modString
{
	NSLog(@"%@", modString);// null
	NSURL *modifiedURL = [NSURL URLWithString:modString];
	return modifiedURL;
}

- (IBAction)openURLFromButton:(id)sender
{
    [self openURL:[NSURL URLWithString:[self returnSearchString:nil]] inBackground:YES];
}

- (void)openURL:(NSURL *)url inBackground:(BOOL)background
{
	if (background) {
		NSArray *urls = [NSArray arrayWithObject:url];
		[[NSWorkspace sharedWorkspace] openURLs:urls withAppBundleIdentifier:nil options:NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifiers:nil];
	} else {
		[[NSWorkspace sharedWorkspace] openURL:url];
	}
}

- (IBAction)audioExtension:(id)sender	// sender is NSMatrix object
{
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (id)[selCell title]);

	if ([selCell tag] == 0) {
		self.data_object.mp3_check	= FALSE;
		self.data_object.wma_check	= FALSE;
		self.data_object.ogg_check	= FALSE;
	} else if ([selCell tag] == 1) {
		self.data_object.mp3_check	= TRUE;
		self.data_object.wma_check	= FALSE;
		self.data_object.ogg_check	= FALSE;
	} else if ([selCell tag] == 2) {
		self.data_object.mp3_check	= FALSE;
		self.data_object.wma_check	= TRUE;
		self.data_object.ogg_check	= FALSE;
	} else if ([selCell tag] == 3) {
		self.data_object.mp3_check	= FALSE;
		self.data_object.wma_check	= FALSE;
		self.data_object.ogg_check	= TRUE;
	} else {// NSLog(@"Error");
	}

#ifndef DEBUG
		// NSLog(@"self.data_object.mp3_check IS : %@", (self.data_object.mp3_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.wma_check IS : %@", (self.data_object.wma_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.ogg_check IS : %@", (self.data_object.ogg_check == TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
}

- (IBAction)videoExtension:(id)sender
{
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (id)[selCell title]);

	if ([selCell tag] == 0) {
		// Video
		self.data_object.mpg_check	= FALSE;
		self.data_object.avi_check	= FALSE;
		self.data_object.wmv_check	= FALSE;
		self.data_object.divx_check = FALSE;
		self.data_object.flv_check	= FALSE;
	} else if ([selCell tag] == 1) {
		// Video
		self.data_object.mpg_check	= TRUE;
		self.data_object.avi_check	= FALSE;
		self.data_object.wmv_check	= FALSE;
		self.data_object.divx_check = FALSE;
		self.data_object.flv_check	= FALSE;
	} else if ([selCell tag] == 2) {
		// Video
		self.data_object.mpg_check	= FALSE;
		self.data_object.avi_check	= TRUE;
		self.data_object.wmv_check	= FALSE;
		self.data_object.divx_check = FALSE;
		self.data_object.flv_check	= FALSE;
	} else if ([selCell tag] == 3) {
		// Video
		self.data_object.mpg_check	= FALSE;
		self.data_object.avi_check	= FALSE;
		self.data_object.wmv_check	= TRUE;
		self.data_object.divx_check = FALSE;
		self.data_object.flv_check	= FALSE;
	} else if ([selCell tag] == 4) {
		// Video
		self.data_object.mpg_check	= FALSE;
		self.data_object.avi_check	= FALSE;
		self.data_object.wmv_check	= FALSE;
		self.data_object.divx_check = TRUE;
		self.data_object.flv_check	= FALSE;
	} else if ([selCell tag] == 5) {
		// Video
		self.data_object.mpg_check	= FALSE;
		self.data_object.avi_check	= FALSE;
		self.data_object.wmv_check	= FALSE;
		self.data_object.divx_check = FALSE;
		self.data_object.flv_check	= TRUE;
	} else {// NSLog(@"Error");
	}

#ifndef DEBUG
		// NSLog(@"self.data_object.mpg_check IS : %@", (self.data_object.mpg_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.avi_check IS : %@", (self.data_object.avi_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.wmv_check IS : %@", (self.data_object.wmv_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.divx_check IS : %@", (self.data_object.divx_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.flv_check IS : %@", (self.data_object.flv_check == TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
}

- (IBAction)documentExtension:(id)sender
{
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (id)[selCell title]);

	if ([selCell tag] == 0) {
		// Documents
		self.data_object.pdf_check	= FALSE;
		self.data_object.txt_check	= FALSE;
		self.data_object.lit_check	= FALSE;
		self.data_object.rar_check	= FALSE;
		self.data_object.doc_check	= FALSE;
		self.data_object.rtf_check	= FALSE;
		self.data_object.pps_check	= FALSE;
		self.data_object.chm_check	= FALSE;
		self.data_object.zip1_check = FALSE;
		self.data_object.odt_check	= FALSE;
	} else if ([selCell tag] == 1) {
		// Documents
		self.data_object.pdf_check	= TRUE;
		self.data_object.txt_check	= FALSE;
		self.data_object.lit_check	= FALSE;
		self.data_object.rar_check	= FALSE;
		self.data_object.doc_check	= FALSE;
		self.data_object.rtf_check	= FALSE;
		self.data_object.pps_check	= FALSE;
		self.data_object.chm_check	= FALSE;
		self.data_object.zip1_check = FALSE;
		self.data_object.odt_check	= FALSE;
	} else if ([selCell tag] == 2) {
		// Documents
		self.data_object.pdf_check	= FALSE;
		self.data_object.txt_check	= TRUE;
		self.data_object.lit_check	= FALSE;
		self.data_object.rar_check	= FALSE;
		self.data_object.doc_check	= FALSE;
		self.data_object.rtf_check	= FALSE;
		self.data_object.pps_check	= FALSE;
		self.data_object.chm_check	= FALSE;
		self.data_object.zip1_check = FALSE;
		self.data_object.odt_check	= FALSE;
	} else if ([selCell tag] == 3) {
		// Documents
		self.data_object.pdf_check	= FALSE;
		self.data_object.txt_check	= FALSE;
		self.data_object.lit_check	= TRUE;
		self.data_object.rar_check	= FALSE;
		self.data_object.doc_check	= FALSE;
		self.data_object.rtf_check	= FALSE;
		self.data_object.pps_check	= FALSE;
		self.data_object.chm_check	= FALSE;
		self.data_object.zip1_check = FALSE;
		self.data_object.odt_check	= FALSE;
	} else if ([selCell tag] == 4) {
		// Documents
		self.data_object.pdf_check	= FALSE;
		self.data_object.txt_check	= FALSE;
		self.data_object.lit_check	= FALSE;
		self.data_object.rar_check	= TRUE;
		self.data_object.doc_check	= FALSE;
		self.data_object.rtf_check	= FALSE;
		self.data_object.pps_check	= FALSE;
		self.data_object.chm_check	= FALSE;
		self.data_object.zip1_check = FALSE;
		self.data_object.odt_check	= FALSE;
	} else if ([selCell tag] == 5) {
		// Documents
		self.data_object.pdf_check	= FALSE;
		self.data_object.txt_check	= FALSE;
		self.data_object.lit_check	= FALSE;
		self.data_object.rar_check	= FALSE;
		self.data_object.doc_check	= TRUE;
		self.data_object.rtf_check	= FALSE;
		self.data_object.pps_check	= FALSE;
		self.data_object.chm_check	= FALSE;
		self.data_object.zip1_check = FALSE;
		self.data_object.odt_check	= FALSE;
	} else if ([selCell tag] == 6) {
		// Documents
		self.data_object.pdf_check	= FALSE;
		self.data_object.txt_check	= FALSE;
		self.data_object.lit_check	= FALSE;
		self.data_object.rar_check	= FALSE;
		self.data_object.doc_check	= FALSE;
		self.data_object.rtf_check	= TRUE;
		self.data_object.pps_check	= FALSE;
		self.data_object.chm_check	= FALSE;
		self.data_object.zip1_check = FALSE;
		self.data_object.odt_check	= FALSE;
	} else if ([selCell tag] == 7) {
		// Documents
		self.data_object.pdf_check	= FALSE;
		self.data_object.txt_check	= FALSE;
		self.data_object.lit_check	= FALSE;
		self.data_object.rar_check	= FALSE;
		self.data_object.doc_check	= FALSE;
		self.data_object.rtf_check	= FALSE;
		self.data_object.pps_check	= TRUE;
		self.data_object.chm_check	= FALSE;
		self.data_object.zip1_check = FALSE;
		self.data_object.odt_check	= FALSE;
	} else if ([selCell tag] == 8) {
		// Documents
		self.data_object.pdf_check	= FALSE;
		self.data_object.txt_check	= FALSE;
		self.data_object.lit_check	= FALSE;
		self.data_object.rar_check	= FALSE;
		self.data_object.doc_check	= FALSE;
		self.data_object.rtf_check	= FALSE;
		self.data_object.pps_check	= FALSE;
		self.data_object.chm_check	= TRUE;
		self.data_object.zip1_check = FALSE;
		self.data_object.odt_check	= FALSE;
	} else if ([selCell tag] == 9) {
		// Documents
		self.data_object.pdf_check	= FALSE;
		self.data_object.txt_check	= FALSE;
		self.data_object.lit_check	= FALSE;
		self.data_object.rar_check	= FALSE;
		self.data_object.doc_check	= FALSE;
		self.data_object.rtf_check	= FALSE;
		self.data_object.pps_check	= FALSE;
		self.data_object.chm_check	= FALSE;
		self.data_object.zip1_check = TRUE;
		self.data_object.odt_check	= FALSE;
	} else if ([selCell tag] == 10) {
		// Documents
		self.data_object.pdf_check	= FALSE;
		self.data_object.txt_check	= FALSE;
		self.data_object.lit_check	= FALSE;
		self.data_object.rar_check	= FALSE;
		self.data_object.doc_check	= FALSE;
		self.data_object.rtf_check	= FALSE;
		self.data_object.pps_check	= FALSE;
		self.data_object.chm_check	= FALSE;
		self.data_object.zip1_check = FALSE;
		self.data_object.odt_check	= TRUE;
	} else {									// NSLog(@"Error");
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

	[self assembleTypesString];
}

- (IBAction)passwordQuery:(id)sender
{
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell tag is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);
	NSLog(@"Selected cell title is %@", (id)[selCell title]);

	if ([selCell tag] == 0) {
		// Passwords
		self.data_object.pass_check = FALSE;
		self.data_object.pass_text	= FALSE;

		self.data_object.pass_1 = FALSE;
		self.data_object.pass_2 = FALSE;
		self.data_object.pass_3 = FALSE;
		self.data_object.pass_4 = FALSE;
		self.data_object.pass_5 = FALSE;
		self.data_object.pass_6 = FALSE;
	} else if ([selCell tag] == 1) {
		// Passwords
		self.data_object.pass_check = TRUE;
		self.data_object.pass_text	= FALSE;

		self.data_object.pass_1 = FALSE;
		self.data_object.pass_2 = FALSE;
		self.data_object.pass_3 = FALSE;
		self.data_object.pass_4 = FALSE;
		self.data_object.pass_5 = FALSE;
		self.data_object.pass_6 = FALSE;
	} else if ([selCell tag] == 2) {
		// Passwords
		self.data_object.pass_check = FALSE;
		self.data_object.pass_text	= TRUE;

		self.data_object.pass_1 = FALSE;
		self.data_object.pass_2 = FALSE;
		self.data_object.pass_3 = FALSE;
		self.data_object.pass_4 = FALSE;
		self.data_object.pass_5 = FALSE;
		self.data_object.pass_6 = FALSE;
	} else if ([selCell tag] == 3) {
		// Passwords
		self.data_object.pass_check = FALSE;
		self.data_object.pass_text	= FALSE;

		self.data_object.pass_1 = TRUE;
		self.data_object.pass_2 = FALSE;
		self.data_object.pass_3 = FALSE;
		self.data_object.pass_4 = FALSE;
		self.data_object.pass_5 = FALSE;
		self.data_object.pass_6 = FALSE;
	} else if ([selCell tag] == 4) {
		// Passwords
		self.data_object.pass_check = FALSE;
		self.data_object.pass_text	= FALSE;

		self.data_object.pass_1 = FALSE;
		self.data_object.pass_2 = TRUE;
		self.data_object.pass_3 = FALSE;
		self.data_object.pass_4 = FALSE;
		self.data_object.pass_5 = FALSE;
		self.data_object.pass_6 = FALSE;
	} else if ([selCell tag] == 5) {
		// Passwords
		self.data_object.pass_check = FALSE;
		self.data_object.pass_text	= FALSE;

		self.data_object.pass_1 = FALSE;
		self.data_object.pass_2 = FALSE;
		self.data_object.pass_3 = TRUE;
		self.data_object.pass_4 = FALSE;
		self.data_object.pass_5 = FALSE;
		self.data_object.pass_6 = FALSE;
	} else if ([selCell tag] == 6) {
		// Passwords
		self.data_object.pass_check = FALSE;
		self.data_object.pass_text	= FALSE;

		self.data_object.pass_1 = FALSE;
		self.data_object.pass_2 = FALSE;
		self.data_object.pass_3 = FALSE;
		self.data_object.pass_4 = TRUE;
		self.data_object.pass_5 = FALSE;
		self.data_object.pass_6 = FALSE;
	} else if ([selCell tag] == 7) {
		// Passwords
		self.data_object.pass_check = FALSE;
		self.data_object.pass_text	= FALSE;

		self.data_object.pass_1 = FALSE;
		self.data_object.pass_2 = FALSE;
		self.data_object.pass_3 = FALSE;
		self.data_object.pass_4 = FALSE;
		self.data_object.pass_5 = TRUE;
		self.data_object.pass_6 = FALSE;
	} else if ([selCell tag] == 8) {
		// Passwords
		self.data_object.pass_check = FALSE;
		self.data_object.pass_text	= FALSE;

		self.data_object.pass_1 = FALSE;
		self.data_object.pass_2 = FALSE;
		self.data_object.pass_3 = FALSE;
		self.data_object.pass_4 = FALSE;
		self.data_object.pass_5 = FALSE;
		self.data_object.pass_6 = TRUE;
	} else {							// NSLog(@"Error");
	}

#ifndef DEBUG
		// NSLog(@"self.data_object.pass_check IS : %@", (self.data_object.pass_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.pass_text IS : %@", (self.data_object.pass_text == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.pass_1 IS : %@", (self.data_object.pass_1 == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.pass_2 IS : %@", (self.data_object.pass_2 == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.pass_3 IS : %@", (self.data_object.pass_3 == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.pass_4 IS : %@", (self.data_object.pass_4 == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.pass_5 IS : %@", (self.data_object.pass_5 == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.pass_6 IS : %@", (self.data_object.pass_6 == TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
}

- (IBAction)fileExtension:(id)sender
{
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

#ifndef DEBUG
		// NSLog(@"self.data_object.exe_check IS : %@", (self.data_object.exe_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.rar_check1 IS : %@", (self.data_object.rar_check1 == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.zip_check IS : %@", (self.data_object.zip_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.ddl_check IS : %@", (self.data_object.ddl_check == TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
}

- (IBAction)linkQuery:(id)sender
{
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (id)[selCell title]);

	if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else {// NSLog(@"Error");
	}

	[self assembleTypesString];
}

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

	// Passwords

	if (self.data_object.pass_check == TRUE) {
		self.data_object.full_search_str = @"";
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.pass_text == TRUE) {
		self.data_object.full_search_str = @"";
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.pass_1 == TRUE) {
		self.data_object.full_search_str = @"http://www.google.com/search?q=intitle%3A%22Index+of%22+passwords+modified";
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.pass_2 == TRUE) {
		self.data_object.full_search_str = @"http://www.google.com/search?hl=en&q=allinurl%3Aauth_user_file.txt";
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.pass_3 == TRUE) {
		self.data_object.full_search_str = @"http://www.google.com/search?q=inurl%3Apasslist.txt&btnG=Search";
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.pass_4 == TRUE) {
		self.data_object.full_search_str = @"http://www.google.com/search?q=%22%23+-FrontPage-%22+inurl%3Aservice.pwd";
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.pass_5 == TRUE) {
		self.data_object.full_search_str = @"http://www.google.com/search?q=intitle%3A%22Index+of%22+config.php";
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.pass_6 == TRUE) {
		self.data_object.full_search_str = @"http://www.google.com/search?q=%22http%3A%2F%2F*%3A*%40%22";
	}

	NSLog(@"%@", self.data_object.types_str);

	if ([self.data_object.types_str length] <= 7) {
		NSLog(@"less than = 7");
		// http://borkware.com/quickies/one?topic=NSString

		self.data_object.types_str = [self truncateString:self.data_object.types_str toCharacterCount:4];

		// https://bdpuqvsqmphctrcs.onion.to/data/
	}

	NSLog(@"assembleTypesString");
	NSLog(@"self.data_object.types_str = %@", self.data_object.types_str);

	// NSWorkspace * ws = [NSWorkspace sharedWorkspace];
	// NSArray * apps = [ws launchedApplications];
	// NSLog (@"%@", apps);
}

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

@end
