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
@synthesize searchTextField, urls, ws;

#pragma mark ViewController viewDidLoad

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.title = @"Presenting ViewController";
	[self.data_object = [DataObjects alloc] init];
	[self.data_object loadValues:nil];
	self.urls = [NSMutableArray arrayWithCapacity:100];
	[self openPasswordQueries];
	self.ws = [NSWorkspace sharedWorkspace];
}

- (void)setRepresentedObject:(id)representedObject
{
	[super setRepresentedObject:representedObject];
}

#pragma mark ViewController figureOutTheLogicHere
- (NSString *)returnSearchString:(NSString *)searchString
{
	[self assembleTypesString];
	NSLog(@"%@", self.data_object.types_str);

	if ([self.data_object.types_str isEqualToString:@""]) {} else {}

	self.data_object.search_str = [self returnSearchField];
	searchString = [BASE_URL stringByAppendingString:@"q="];
	NSLog(@"%@", searchString);
	searchString = [searchString stringByAppendingString:[self returnSearchField]];
	NSLog(@"%@", searchString);

	return searchString;
}

- (IBAction)enterFromSearchField:(id)sender
{
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
	if (background) {
		NSArray *urls = [NSArray arrayWithObject:url];
		[self.ws openURLs:urls withAppBundleIdentifier:nil options:NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifiers:nil];
	} else {
		[[NSWorkspace sharedWorkspace] openURL:url];
	}

	[self openPasswordQueries];
	// gotta remove objects and revuild every time
	NSLog(@"self.urls count = %ld", [self.urls count]);

	[[NSWorkspace sharedWorkspace] openURLs:[self.urls arrayByAddingObjectsFromArray:self.data_object.passWordLinkArray] withAppBundleIdentifier:nil options:NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifiers:nil];

	// for (int i = 0; i < [self.data_object.passWordLinkArray count]; i++) {
	//   [[NSWorkspace sharedWorkspace] openURLs:[NSURL URLWithString:self.data_object.passWordLinkArray[i]] withAppBundleIdentifier:nil options:NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifiers:nil];
	// }
	NSLog(@"self.urls count = %ld", [self.urls count]);

	[self.urls removeAllObjects];
}

#pragma mark ViewController audioExtention

- (IBAction)audioExtension:(id)sender	// sender is NSMatrix object
{
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %ld", (long)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"mp3"]) {
		if ([selCell state] == 0) {
			self.data_object.mp3_check = FALSE;
		} else {
			self.data_object.mp3_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"wma"]) {
		if ([selCell state] == 0) {
			self.data_object.wma_check = FALSE;
		} else {
			self.data_object.wma_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"ogg"]) {
		if ([selCell state] == 0) {
			self.data_object.ogg_check = FALSE;
		} else {
			self.data_object.ogg_check = TRUE;
		}
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
	NSLog(@"Selected cell title is %ld", (long)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"mpg"]) {
		if ([selCell state] == 0) {
			self.data_object.mpg_check = FALSE;
		} else {
			self.data_object.mpg_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"avi"]) {
		if ([selCell state] == 0) {
			self.data_object.avi_check = FALSE;
		} else {
			self.data_object.avi_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"wmv"]) {
		if ([selCell state] == 0) {
			self.data_object.wmv_check = FALSE;
		} else {
			self.data_object.wmv_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"divx"]) {
		if ([selCell state] == 0) {
			self.data_object.divx_check = FALSE;
		} else {
			self.data_object.divx_check = TRUE;
		}
	}

	if ([[selCell title] isEqualToString:@"flv"]) {
		if ([selCell state] == 0) {
			self.data_object.flv_check = FALSE;
		} else {
			self.data_object.flv_check = TRUE;
		}
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
	NSLog(@"Selected cell title is %ld", (long)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"pdf"]) {
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

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %ld", (long)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"pass 1"]) {
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

#ifndef DEBUG
		NSLog(@"self.data_object.pass_check IS : %@", (self.data_object.pass_check == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_text IS : %@", (self.data_object.pass_text == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_1 IS : %@", (self.data_object.pass_1 == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_2 IS : %@", (self.data_object.pass_2 == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_3 IS : %@", (self.data_object.pass_3 == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_4 IS : %@", (self.data_object.pass_4 == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_5 IS : %@", (self.data_object.pass_5 == TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"self.data_object.pass_6 IS : %@", (self.data_object.pass_6 == TRUE) ? @"TRUE" : @"FALSE");
#endif
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

	NSInteger		*capacity	= (long *)[self.data_object.types_str length];
    NSLog(@"capacity = %i",(int)capacity);
	NSMutableString *temp		= [NSMutableString stringWithCapacity:(NSUInteger )capacity];
	NSLog(@"temp.length = %lx", temp.length);
	[temp setString:self.data_object.types_str];
	[temp replaceCharactersInRange:NSMakeRange(0, 0)
	withString:@"Exige"];
	NSLog(@"%@", temp);									// Lotus Exige
	[temp deleteCharactersInRange:NSMakeRange(0, 0)];
	NSLog(@"%@", temp);									// Lotus

	// [self.data_object.types_str deleteCharactersInRange:NSMakeRange(5, 6)];

	NSLog(@"assembleTypesString");
	NSLog(@"self.data_object.types_str = %@", self.data_object.types_str);
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

- (void)openPasswordQueries
{
	if (self.data_object.pass_1 == TRUE) {
		self.data_object.full_search_str = @"http://www.google.com/search?q=intitle%3A%22Index+of%22+passwords+modified";
		[self.urls addObject:self.data_object.full_search_str];

		// NSLog(@"0 %@",self.urls[0]);
		// With a traditional for loop
		for (int i = 0; i < [self.urls count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_2 == TRUE) {
		self.data_object.full_search_str = @"http://www.google.com/search?hl=en&q=allinurl%3Aauth_user_file.txt";
		[self.urls addObject:self.data_object.full_search_str];

		// NSLog(@"1 %@",self.urls[1]);
		for (int i = 0; i < [self.urls count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_3 == TRUE) {
		self.data_object.full_search_str = @"http://www.google.com/search?q=inurl%3Apasslist.txt&btnG=Search";
		[self.urls addObject:self.data_object.full_search_str];

		// NSLog(@"2 %@",self.urls[2]);
		// [[NSWorkspace sharedWorkspace] openURLs:urls withAppBundleIdentifier:nil options:NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifiers:nil];
		//  self.data_object.pass_3 == FALSE;
		for (int i = 0; i < [self.urls count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_4 == TRUE) {
		self.data_object.full_search_str = @"http://www.google.com/search?q=%22%23+-FrontPage-%22+inurl%3Aservice.pwd";
		[self.urls addObject:self.data_object.full_search_str];

		// NSLog(@"3 %@",self.urls[3]);
		for (int i = 0; i < [self.urls count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_5 == TRUE) {
		self.data_object.full_search_str = @"http://www.google.com/search?q=intitle%3A%22Index+of%22+config.php";
		[self.urls addObject:self.data_object.full_search_str];

		// NSLog(@"4 %@",self.urls[4]);
		for (int i = 0; i < [self.urls count]; i++) {
			NSLog(@"%d: %@", i, self.urls[i]);
		}
	}

	if (self.data_object.pass_6 == TRUE) {
		self.data_object.full_search_str = @"http://www.google.com/search?q=%22http%3A%2F%2F*%3A*%40%22";
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

@end
