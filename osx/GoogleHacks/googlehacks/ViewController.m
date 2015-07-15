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

@synthesize data_object,types_str;
@synthesize searchTextField, urls, ws;

#pragma mark ViewController viewDidLoad

- (void)viewDidLoad
{
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
	[super viewDidLoad];
	self.title = @"Presenting ViewController";
	[self.data_object = [DataObjects alloc] init];
	[self.data_object loadValues:nil];
	self.urls = [NSMutableArray arrayWithCapacity:100];
	//[self openPasswordQueries];
	self.ws = [NSWorkspace sharedWorkspace];
    self.types_str = (NSMutableString *)self.data_object.types_str;
}

- (void)setRepresentedObject:(id)representedObject
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
	[super setRepresentedObject:representedObject];
}

#pragma mark ViewController figureOutTheLogicHere
- (NSString *)returnSearchString:(NSString *)searchString
{
    NSLog(@"%@", NSStringFromSelector(_cmd));

	[self assembleTypesString];
	if ([self.types_str isEqualToString:@""]) {} else {}
	self.data_object.search_str = (NSMutableString *)[self returnSearchField];
	searchString = [BASE_URL stringByAppendingString:@"q="];
	searchString = [searchString stringByAppendingString:[self returnSearchField]];
	NSLog(@"searchString = %@", searchString);

	return searchString;
}

- (IBAction)enterFromSearchField:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
	NSLog(@"searchTextField = %@", [[self.searchTextField stringValue] stringByReplacingOccurrencesOfString:@" " withString:@"%20"]);
	[self openURLFromButton:(id)sender];
}

- (NSString *)returnSearchField
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
	NSString *returnSearchField = nil;
	returnSearchField = [[self.searchTextField stringValue] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
	NSLog(@"returnSearchField = %@", returnSearchField);

	return returnSearchField;
}

- (NSURL *)modifyURL:(NSString *)modString
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
	NSLog(@"%@", modString);// null
	NSURL *modifiedURL = [NSURL URLWithString:modString];

	return modifiedURL;
}

#pragma mark ViewController handle password logic

- (IBAction)openURLFromButton:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
	[self openURL:[NSURL URLWithString:[self returnSearchString:nil]] inBackground:YES];
}

- (void)openURL:(NSURL *)url inBackground:(BOOL)background
{
    NSLog(@"%@", NSStringFromSelector(_cmd));

	if (background) {
		NSArray *urls = [NSArray arrayWithObject:url];
		[self.ws openURLs:urls withAppBundleIdentifier:nil options:NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifiers:nil];
	} else {
		[[NSWorkspace sharedWorkspace] openURL:url];
	}

	NSLog(@"self.urls count = %ld", [self.urls count]);
	NSLog(@"self.urls count = %ld", [self.urls count]);

	[self.urls removeAllObjects];
}

#pragma mark ViewController audioExtention

- (IBAction)audioExtension:(id)sender	// sender is NSMatrix object
{
    NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"mp3"]) {
		if ([selCell state] == 0) {
			self.data_object.mp3_check = FALSE;
		} else {
			self.data_object.mp3_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"wma"]) {
		if ([selCell state] == 0) {
			self.data_object.wma_check = FALSE;
		} else {
			self.data_object.wma_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"ogg"]) {
		if ([selCell state] == 0) {
			self.data_object.ogg_check = FALSE;
		} else {
			self.data_object.ogg_check = (signed char *)TRUE;
		}
	}

#ifdef DEBUG
		NSLog(@"self.data_object.mp3_check IS : %@", (self.data_object.mp3_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.wma_check IS : %@", (self.data_object.wma_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.ogg_check IS : %@", (self.data_object.ogg_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
}

- (IBAction)videoExtension:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];
	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"mpg"]) {
		if ([selCell state] == 0) {
			self.data_object.mpg_check = FALSE;
		} else {
			self.data_object.mpg_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"avi"]) {
		if ([selCell state] == 0) {
			self.data_object.avi_check = FALSE;
		} else {
			self.data_object.avi_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"wmv"]) {
		if ([selCell state] == 0) {
			self.data_object.wmv_check = FALSE;
		} else {
			self.data_object.wmv_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"divx"]) {
		if ([selCell state] == 0) {
			self.data_object.divx_check = FALSE;
		} else {
			self.data_object.divx_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"flv"]) {
		if ([selCell state] == 0) {
			self.data_object.flv_check = FALSE;
		} else {
			self.data_object.flv_check = (signed char *)TRUE;
		}
	}

#ifndef DEBUG
		NSLog(@"self.data_object.mpg_check IS : %@", (self.data_object.mpg_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.avi_check IS : %@", (self.data_object.avi_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.wmv_check IS : %@", (self.data_object.wmv_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.divx_check IS : %@", (self.data_object.divx_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.flv_check IS : %@", (self.data_object.flv_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
}

- (IBAction)documentExtension:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];
	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"pdf"]) {
		if ([selCell state] == 0) {
			self.data_object.pdf_check = FALSE;
		} else {
			self.data_object.pdf_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"txt"]) {
		if ([selCell state] == 0) {
			self.data_object.txt_check = FALSE;
		} else {
			self.data_object.txt_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"lit"]) {
		if ([selCell state] == 0) {
			self.data_object.lit_check = FALSE;
		} else {
			self.data_object.lit_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"rar"]) {
		if ([selCell state] == 0) {
			self.data_object.rar_check = FALSE;
		} else {
			self.data_object.rar_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"doc"]) {
		if ([selCell state] == 0) {
			self.data_object.doc_check = FALSE;
		} else {
			self.data_object.doc_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"rtf"]) {
		if ([selCell state] == 0) {
			self.data_object.rtf_check = FALSE;
		} else {
			self.data_object.rtf_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"pps"]) {
		if ([selCell state] == 0) {
			self.data_object.pps_check = FALSE;
		} else {
			self.data_object.pps_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"chm"]) {
		if ([selCell state] == 0) {
			self.data_object.chm_check = FALSE;
		} else {
			self.data_object.chm_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"zip1"]) {
		if ([selCell state] == 0) {
			self.data_object.zip1_check = FALSE;
		} else {
			self.data_object.zip1_check = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"odt"]) {
		if ([selCell state] == 0) {
			self.data_object.odt_check = FALSE;
		} else {
			self.data_object.odt_check = (signed char *)TRUE;
		}
	}

#ifndef DEBUG
		NSLog(@"self.data_object.pdf_check IS : %@", (self.data_object.pdf_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.txt_check IS : %@", (self.data_object.txt_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.lit_check IS : %@", (self.data_object.lit_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.rar_check IS : %@", (self.data_object.rar_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.doc_check IS : %@", (self.data_object.doc_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.rtf_check IS : %@", (self.data_object.rtf_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pps_check IS : %@", (self.data_object.pps_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.chm_check IS : %@", (self.data_object.chm_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.zip1_check IS : %@", (self.data_object.zip1_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.odt_check IS : %@", (self.data_object.odt_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
}

- (IBAction)passwordQuery:(id)sender
{
    
    NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"pass 1"]) {
		if ([selCell state] == 0) {
			self.data_object.pass_1 = FALSE;
		} else {
			self.data_object.pass_1 = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"pass 2"]) {
		if ([selCell state] == 0) {
			self.data_object.pass_2 = FALSE;
		} else {
			self.data_object.pass_2 = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"pass 3"]) {
		if ([selCell state] == 0) {
			self.data_object.pass_3 = FALSE;
		} else {
			self.data_object.pass_3 = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"pass 4"]) {
		if ([selCell state] == 0) {
			self.data_object.pass_4 = FALSE;
		} else {
			self.data_object.pass_4 = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"pass 5"]) {
		if ([selCell state] == 0) {
			self.data_object.pass_5 = FALSE;
		} else {
			self.data_object.pass_5 = (signed char *)TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"pass 6"]) {
		if ([selCell state] == 0) {
			self.data_object.pass_6 = FALSE;
		} else {
			self.data_object.pass_6 = (signed char *)TRUE;
		}
	}

#ifndef DEBUG
		NSLog(@"self.data_object.pass_check IS : %@", (self.data_object.pass_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_text IS : %@", (self.data_object.pass_text == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_1 IS : %@", (self.data_object.pass_1 == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_2 IS : %@", (self.data_object.pass_2 == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_3 IS : %@", (self.data_object.pass_3 == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_4 IS : %@", (self.data_object.pass_4 == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_5 IS : %@", (self.data_object.pass_5 == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_6 IS : %@", (self.data_object.pass_6 == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
#endif
}

- (IBAction)archives:(id)sender
{
    
    NSButtonCell *selCell = [sender selectedCell];
    
    NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
    NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([selCell tag] == 0) {
		// file ext
		self.data_object.exe_check	= FALSE;
		self.data_object.rar_check1 = FALSE;
		self.data_object.zip_check	= FALSE;
		self.data_object.ddl_check	= FALSE;
	} else if ([selCell tag] == 1) {
		// file ext
		self.data_object.exe_check	= (signed char *)TRUE;
		self.data_object.rar_check1 = FALSE;
		self.data_object.zip_check	= FALSE;
		self.data_object.ddl_check	= FALSE;
	} else if ([selCell tag] == 2) {
		// file ext
		self.data_object.exe_check	= FALSE;
		self.data_object.rar_check1 = (signed char *)TRUE;
		self.data_object.zip_check	= FALSE;
		self.data_object.ddl_check	= FALSE;
	} else if ([selCell tag] == 3) {
		// file ext
		self.data_object.exe_check	= FALSE;
		self.data_object.rar_check1 = FALSE;
		self.data_object.zip_check	= (signed char *)TRUE;
		self.data_object.ddl_check	= FALSE;
	} else if ([selCell tag] == 4) {
		// file ext
		self.data_object.exe_check	= FALSE;
		self.data_object.rar_check1 = FALSE;
		self.data_object.zip_check	= FALSE;
		self.data_object.ddl_check	= (signed char *)TRUE;
	} else {		// NSLog(@"Error");
	}

#ifndef DEBUG
		NSLog(@"self.data_object.exe_check IS : %@", (self.data_object.exe_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.rar_check1 IS : %@", (self.data_object.rar_check1 == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.zip_check IS : %@", (self.data_object.zip_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.ddl_check IS : %@", (self.data_object.ddl_check == (signed char *)TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
}

- (IBAction)linkQuery:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
 
    NSButtonCell *selCell = [sender selectedCell];
    
    NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
    NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else {// NSLog(@"Error");
	}

	[self assembleTypesString];
}

- (void)assembleTypesString
{
    
    NSLog(@"%@", NSStringFromSelector(_cmd));

	self.types_str = (NSMutableString *)@"";
	// self.types_str = [self.types_str stringByAppendingString:@"%7C"];

	// Audio
	if ([mp3 state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".mp3%7C"];
	}

    if ([wma state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".wma%7C"];
	}


    if ([ogg state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".ogg%7C"];
	}

	// Docs
    if ([pdf state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".pdf%7C"];
	}

    if ([txt state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".txt%7C"];
	}

    if ([lit state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".lit%7C"];
	}

    if ([rar state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".rar%7C"];
	}

    if ([doc state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".doc%7C"];
	}

    if ([rtf state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".rtf%7C"];
	}

    if ([pps state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".pps%7C"];
	}

    if ([chm state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".chm%7C"];
	}

    if ([zip state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".zip%7C"];
	}

    if ([odt state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".odt%7C"];
	}

	// Video
    if ([mpg state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".mpg%7C"];
	}

    if ([avi state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".avi%7C"];
	}

    if ([wmv state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".wmv%7C"];
	}

    if ([divx state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".divx%7C"];
	}

    if ([flv state] == TRUE) {
		self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".flv%7C"];
	}
    
    if ([exe state] == TRUE) {
        self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".exe%7C"];
    }
    
    if ([ddl state] == TRUE) {
        self.types_str = (NSMutableString *)[self.types_str stringByAppendingString:@".ddl%7C"];
    }

	if ([self.types_str length] <= 7) {
		NSLog(@"less than = 7");
		// http://borkware.com/quickies/one?topic=NSString

		self.types_str = (NSMutableString *)[self truncateString:self.types_str toCharacterCount:4];
		// https://bdpuqvsqmphctrcs.onion.to/data/
	}

	if ([self.types_str isEqualToString:@".divx%7C"]) {
		self.types_str = (NSMutableString *)[self truncateString:self.types_str toCharacterCount:5];
	}

	NSLog(@"self.types_str = %@", self.types_str);
}

- (NSString *)	truncateString	:(NSString *)string
				toCharacterCount:(NSUInteger)count
{
    
    NSLog(@"%@", NSStringFromSelector(_cmd));

	NSRange range = {0, MIN(string.length, count)};

	range = [string rangeOfComposedCharacterSequencesForRange:range];
	NSString *trunc = [string substringWithRange:range];

	if (trunc.length < string.length) {
		trunc = [trunc stringByAppendingString:@""];
	}

	return trunc;
}	// truncateString

- (void)openPasswordQueries
{
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    

	if (self.data_object.pass_1 == (signed char *)TRUE) {
		self.data_object.full_search_str = (NSMutableString *)@"http://www.google.com/search?q=intitle%3A%22Index+of%22+passwords+modified";
		[self.urls addObject:self.data_object.full_search_str];

		for (int i = 0; i < [self.urls count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_2 == (signed char *)TRUE) {
		self.data_object.full_search_str = (NSMutableString *)@"http://www.google.com/search?hl=en&q=allinurl%3Aauth_user_file.txt";
		[self.urls addObject:self.data_object.full_search_str];

		for (int i = 0; i < [self.urls count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_3 == (signed char *)TRUE) {
		self.data_object.full_search_str = (NSMutableString *)@"http://www.google.com/search?q=inurl%3Apasslist.txt&btnG=Search";
		[self.urls addObject:self.data_object.full_search_str];

		for (int i = 0; i < [self.urls count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_4 == (signed char *)TRUE) {
		self.data_object.full_search_str = (NSMutableString *)@"http://www.google.com/search?q=%22%23+-FrontPage-%22+inurl%3Aservice.pwd";
		[self.urls addObject:self.data_object.full_search_str];

		for (int i = 0; i < [self.urls count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_5 == (signed char *)TRUE) {
		self.data_object.full_search_str = (NSMutableString *)@"http://www.google.com/search?q=intitle%3A%22Index+of%22+config.php";
		[self.urls addObject:self.data_object.full_search_str];

		for (int i = 0; i < [self.urls count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_6 == (signed char *)TRUE) {
		self.data_object.full_search_str = (NSMutableString *)@"http://www.google.com/search?q=%22http%3A%2F%2F*%3A*%40%22";
		[self.urls addObject:self.data_object.full_search_str];

		for (int i = 0; i < [self.urls count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	// With a traditional for loop
	for (int i = 0; i < [self.data_object.passWordLinkArray count]; i++) {
		NSLog(@"self.data_object.passWordLinkArray[%d]: %@", i, self.data_object.passWordLinkArray[i]);
	}

	for (int i = 0; i < [self.urls count]; i++) {}
}

- (IBAction)method1:(id)sender {
    NSLog(@"%@", NSStringFromSelector(_cmd));

    NSButtonCell *selCell = [sender selectedCell];
    
    NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
    NSLog(@"Selected cell state is %ld", (long)[selCell state]);

}

- (IBAction)method2:(id)sender {
    NSLog(@"%@", NSStringFromSelector(_cmd));

    NSButtonCell *selCell = [sender selectedCell];
    
    NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
    NSLog(@"Selected cell state is %ld", (long)[selCell state]);
}

- (IBAction)resetButtons:(id)sender {

       NSLog(@"%@", NSStringFromSelector(_cmd));
    
    NSButtonCell *selCell = [sender selectedCell];
    
    NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
    NSLog(@"Selected cell state is %ld", (long)[selCell state]);
    
    [mp3 setState:0];
    [wma setState:0];
    [ogg setState:0];
    [mpg setState:0];
    [avi setState:0];
    [wmv setState:0];
    [divx setState:0];
    [flv setState:0];
    [pdf setState:0];
    [txt setState:0];
    [lit setState:0];
    [doc setState:0];
    [rtf setState:0];
    [pps setState:0];
    [chm setState:0];
    [odt setState:0];
    [pass1 setState:0];
    [pass2 setState:0];
    [pass3 setState:0];
    [pass4 setState:0];
    [pass5 setState:0];
    [pass6 setState:0];
    [rar setState:0];
    [zip setState:0];
    [exe setState:0];
    [ddl setState:0];
    [link setState:0];
    [addUrl setState:0];
    [related setState:0];
    [tools setState:0];
   
    
    NSLog(@"self.types_str = %@", NSStringFromClass([self.types_str class]));
	self.types_str = (NSMutableString *)@"";
    NSLog(@"self.types_str = %@",self.types_str);
    
}

@end
