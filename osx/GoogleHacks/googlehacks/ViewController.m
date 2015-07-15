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

@synthesize data_object, types_str;
@synthesize searchTextField, urlLinkTextField, urls, ws;

#pragma mark ViewController viewDidLoad

- (void)viewDidLoad
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	[super viewDidLoad];
	self.title = @"Presenting ViewController";
	[self.data_object = [DataObjects alloc] init];
	[self.data_object loadValues:nil];
	self.urls = [NSMutableArray arrayWithCapacity:100];
	// [self openPasswordQueries];
	self.ws			= [NSWorkspace sharedWorkspace];
	self.types_str	= (NSMutableString *)self.data_object.types_str;
}

- (void)setRepresentedObject:(id)representedObject
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	[super setRepresentedObject:representedObject];
}

#pragma mark ViewController enterFromButton <---all roads lead here

- (IBAction)pressSearchButton:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSLog(@"returnSearchField = %@", [self returnSearchField]);
	NSLog(@"returnURLLinkField = %@", [self returnURLLinkField]);

	[self assembleTypesString];

	// Basic openURL...
	// [self openURL:[NSURL URLWithString:[self returnSearchString:nil]] inBackground:NO];
}

#pragma mark ViewController enterFromSearchField

- (IBAction)enterFromSearchField:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	// enterFromButton handles enterFrom logic
	[self pressSearchButton:(id)sender];
}

#pragma mark ViewController enterFromURLLinkField

- (IBAction)enterFromURLLinkField:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	// enterFromButton handles enterFrom logic
	[self pressSearchButton:(id)sender];
}

#pragma mark ViewController returnSearchField

- (NSString *)returnSearchField
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSLog(@"self.searchTextField = %@", [self.searchTextField stringValue]);
	return [[self.searchTextField stringValue] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
}

#pragma mark ViewController returnURLLinkField

- (NSString *)returnURLLinkField
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSLog(@"self.urlLinkTextField = %@", [self.urlLinkTextField stringValue]);
	return [[self.urlLinkTextField stringValue] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
}

#pragma mark ViewController figureOutTheLogicHere

- (NSString *)returnSearchString:(NSString *)searchString
{
	// This method will handle more complex logic...
	NSLog(@"%@", NSStringFromSelector(_cmd));

	searchString	= [BASE_URL stringByAppendingString:@"q="];
	searchString	= [searchString stringByAppendingString:[self returnSearchField]];
	NSLog(@"searchString = %@", searchString);

	return searchString;
}

#pragma mark ViewController modifyURL

- (NSURL *)modifyURL:(NSString *)modString
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSLog(@"%@", modString);// null
	NSURL *modifiedURL = [NSURL URLWithString:modString];

	return modifiedURL;
}

#pragma mark ViewController openURL

- (void)openURL:(NSURL *)url inBackground:(BOOL)background
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	// openURL:nil inBackground:YES;
	// opens self.urls - an ARRAY OF URLS
	// openURL:urlVariable inBackground:NO/nil
	// opens a sent url
	if (background) {
		// NSArray *urls = [NSArray arrayWithObject:url];
		[self.ws openURLs:self.urls withAppBundleIdentifier:nil options:NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifiers:nil];
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

	if ([mp3 state] == (long)TRUE) {} else {}

	if ([wma state] == (long)TRUE) {} else {}

	if ([ogg state] == (long)TRUE) {} else {}

#ifdef DEBUG
		NSLog(@"[mp3 state] IS : %@", ([pdf state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[wma state] IS : %@", ([txt state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[ogg state] IS : %@", ([lit state] == (long)TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
}

#pragma mark ViewController videoExtension

- (IBAction)videoExtension:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([mpg state] == (long)TRUE) {} else {}

	if ([avi state] == (long)TRUE) {} else {}

	if ([wmv state] == (long)TRUE) {} else {}

	if ([divx state] == (long)TRUE) {} else {}

#ifdef DEBUG
		NSLog(@"[mpg state] IS : %@", ([doc state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[avi state] IS : %@", ([rtf state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[wmv state] IS : %@", ([pps state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[divx state] IS : %@", ([chm state] == (long)TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
}

#pragma mark ViewController documentExtension

- (IBAction)documentExtension:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([pdf state] == (long)TRUE) {} else {}

	if ([txt state] == (long)TRUE) {} else {}

	if ([lit state] == (long)TRUE) {} else {}

	if ([doc state] == (long)TRUE) {} else {}

	if ([rtf state] == (long)TRUE) {} else {}

	if ([pps state] == (long)TRUE) {} else {}

	if ([chm state] == (long)TRUE) {} else {}

	if ([odt state] == (long)TRUE) {} else {}

#ifdef DEBUG
		NSLog(@"[pdf state] IS : %@", ([pdf state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[txt state] IS : %@", ([txt state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[lit state] IS : %@", ([lit state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[doc state] IS : %@", ([doc state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[rtf state] IS : %@", ([rtf state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[pps state] IS : %@", ([pps state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[chm state] IS : %@", ([chm state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[odt state] IS : %@", ([odt state] == (long)TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
}

#pragma mark ViewController passwordQuery

- (IBAction)passwordQuery:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);
	// if ([germanMakes containsObject:@"BMW"]) {

	if ([pass1 state] == (long)TRUE) {
		if (![self.urls containsObject:(NSMutableString *)PASS_1_STR]) {
			[self.urls addObject:(NSMutableString *)PASS_1_STR];
		}
	} else {
		[self.urls removeObjectIdenticalTo:(NSMutableString *)PASS_1_STR];
	}

	if ([pass2 state] == (long)TRUE) {
		if (![self.urls containsObject:(NSMutableString *)PASS_2_STR]) {
			[self.urls addObject:(NSMutableString *)PASS_2_STR];
		}
	} else {
		[self.urls removeObjectIdenticalTo:(NSMutableString *)PASS_2_STR];
	}

	if ([pass3 state] == (long)TRUE) {
		if (![self.urls containsObject:(NSMutableString *)PASS_3_STR]) {
			[self.urls addObject:(NSMutableString *)PASS_3_STR];
		}
	} else {
		[self.urls removeObjectIdenticalTo:(NSMutableString *)PASS_3_STR];
	}

	if ([pass4 state] == (long)TRUE) {
		if (![self.urls containsObject:(NSMutableString *)PASS_4_STR]) {
			[self.urls addObject:(NSMutableString *)PASS_4_STR];
		}
	} else {
		[self.urls removeObjectIdenticalTo:(NSMutableString *)PASS_4_STR];
	}

	if ([pass5 state] == (long)TRUE) {
		if (![self.urls containsObject:(NSMutableString *)PASS_5_STR]) {
			[self.urls addObject:(NSMutableString *)PASS_5_STR];
		}
	} else {
		[self.urls removeObjectIdenticalTo:(NSMutableString *)PASS_5_STR];
	}

	if ([pass6 state] == (long)TRUE) {
		if (![self.urls containsObject:(NSMutableString *)PASS_6_STR]) {
			[self.urls addObject:(NSMutableString *)PASS_6_STR];
		}
	} else {
		[self.urls removeObjectIdenticalTo:(NSMutableString *)PASS_6_STR];
	}

#ifdef DEBUG
		NSLog(@"[pass1 state] IS : %@", ([pass1 state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[pass2 state] IS : %@", ([pass2 state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[pass3 state] IS : %@", ([pass3 state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[pass4 state] IS : %@", ([pass4 state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[pass5 state] IS : %@", ([pass5 state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[pass6 state] IS : %@", ([pass6 state] == (long)TRUE) ? @"TRUE" : @"FALSE");
#endif

	// With a traditional for loop
	for (int i = 0; i < [self.urls count]; i++) {
		NSLog(@"self.urls[%d]: %@", i, (NSMutableString *)self.urls[i]);
	}
}

#pragma mark ViewController openPasswordQueries

- (void)openPasswordQueries
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark ViewController archives

- (IBAction)archives:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([pdf state] == (long)TRUE) {} else {}

	if ([txt state] == (long)TRUE) {} else {}

	if ([lit state] == (long)TRUE) {} else {}

	if ([doc state] == (long)TRUE) {} else {}

	if ([rtf state] == (long)TRUE) {} else {}

	if ([pps state] == (long)TRUE) {} else {}

	if ([chm state] == (long)TRUE) {} else {}

	if ([odt state] == (long)TRUE) {} else {}

#ifdef DEBUG
		NSLog(@"[pdf state] IS : %@", ([pdf state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[txt state] IS : %@", ([txt state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[lit state] IS : %@", ([lit state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[doc state] IS : %@", ([doc state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[rtf state] IS : %@", ([rtf state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[pps state] IS : %@", ([pps state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[chm state] IS : %@", ([chm state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[odt state] IS : %@", ([odt state] == (long)TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
}

#pragma mark ViewController linkQuery

- (IBAction)linkQuery:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([pdf state] == (long)TRUE) {} else {}

	if ([txt state] == (long)TRUE) {} else {}

	if ([lit state] == (long)TRUE) {} else {}

	if ([doc state] == (long)TRUE) {} else {}

	if ([rtf state] == (long)TRUE) {} else {}

	if ([pps state] == (long)TRUE) {} else {}

	if ([chm state] == (long)TRUE) {} else {}

	if ([odt state] == (long)TRUE) {} else {}

#ifdef DEBUG
		NSLog(@"[pdf state] IS : %@", ([pdf state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[txt state] IS : %@", ([txt state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[lit state] IS : %@", ([lit state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[doc state] IS : %@", ([doc state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[rtf state] IS : %@", ([rtf state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[pps state] IS : %@", ([pps state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[chm state] IS : %@", ([chm state] == (long)TRUE) ? @"TRUE" : @"FALSE");
		NSLog(@"[odt state] IS : %@", ([odt state] == (long)TRUE) ? @"TRUE" : @"FALSE");
#endif

	[self assembleTypesString];
}

#pragma mark ViewController assembleTypesString

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
		// NSLog(@"less than = 7");
		// http://borkware.com/quickies/one?topic=NSString

		self.types_str = (NSMutableString *)[self truncateString:self.types_str toCharacterCount:4];
		// https://bdpuqvsqmphctrcs.onion.to/data/
	}

	if ([self.types_str isEqualToString:@".divx%7C"]) {
		self.types_str = (NSMutableString *)[self truncateString:self.types_str toCharacterCount:5];
	}

	NSLog(@"self.types_str = %@", (NSString *)self.types_str);
}

#pragma mark ViewController truncateString

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

#pragma mark ViewController method1

- (IBAction)method1:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);
}

#pragma mark ViewController method2

- (IBAction)method2:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", (NSString *)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);
}

#pragma mark ViewController resetButtons

- (IBAction)resetButtons:(id)sender
{
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

	// NSLog(@"self.types_str = %@", NSStringFromClass([self.types_str class]));
	self.types_str	= (NSMutableString *)@"";
	self.types_str	= (NSMutableString *)@"";

	// if (!self.urls) {
	//	self.urls = [[NSMutableArray alloc] init];
	// } else {
	[self.urls removeAllObjects];
	// }

	NSLog(@"self.types_str = %@", self.types_str);
}

@end
