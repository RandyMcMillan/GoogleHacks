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

@synthesize searchTextField, urls, ws;
@synthesize returnSearchString;

#pragma mark ViewController viewDidLoad

- (void)viewDidLoad
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	[super viewDidLoad];
	self.title = @"Presenting ViewController";
	self.returnSearchString = [[ReturnSearchString alloc]init];
	self.urls	= [NSMutableArray arrayWithCapacity:100];
	self.ws		= [NSWorkspace sharedWorkspace];
}

#pragma mark ViewController figureOutTheLogicHere
- (NSString *)returnSearchString:(NSString *)searchString
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	searchString = [[self.searchTextField stringValue] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
	NSLog(@"%@", searchString);
	return searchString;
}

- (IBAction)enterFromSearchField:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	[self openURLFromButton:(id)sender];
}

- (IBAction)openURLFromButton:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	// [self openURL:[NSURL URLWithString:[self returnSearchString:nil]] inBackground:YES];
}

- (void)openURL:(NSURL *)url inBackground:(BOOL)background
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark ViewController audioExtention

- (IBAction)audioExtension:(id)sender	// sender is NSMatrix object
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %ld", (long)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"mp3"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"wma"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"ogg"]) {
		if ([selCell state] == 0) {} else {}
	}

#ifndef DEBUG
		// NSLog(@"self.data_object.mp3_check IS : %@", (self.data_object.mp3_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.wma_check IS : %@", (self.data_object.wma_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.ogg_check IS : %@", (self.data_object.ogg_check == TRUE) ? @"TRUE" : @"FALSE");
#endif
}

- (IBAction)videoExtension:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSButtonCell *selCell = [sender selectedCell];
	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %ld", (long)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"mpg"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"avi"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"wmv"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"divx"]) {
		if ([selCell state] == 0) {} else {}
	}

	if ([[selCell title] isEqualToString:@"flv"]) {
		if ([selCell state] == 0) {} else {}
	}

#ifndef DEBUG
		// NSLog(@"self.data_object.mpg_check IS : %@", (self.data_object.mpg_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.avi_check IS : %@", (self.data_object.avi_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.wmv_check IS : %@", (self.data_object.wmv_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.divx_check IS : %@", (self.data_object.divx_check == TRUE) ? @"TRUE" : @"FALSE");
		// NSLog(@"self.data_object.flv_check IS : %@", (self.data_object.flv_check == TRUE) ? @"TRUE" : @"FALSE");
#endif
}

- (IBAction)documentExtension:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSButtonCell *selCell = [sender selectedCell];
	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %ld", (long)[selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"pdf"]) {
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
}

- (IBAction)passwordQuery:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", [selCell title]);
	NSLog(@"Selected cell state is %ld", (long)[selCell state]);

	if ([[selCell title] isEqualToString:@"pass 1"]) {
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
}

- (IBAction)fileExtension:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", [selCell title]);

	if ([selCell tag] == 0) {
		// file ext
	} else if ([selCell tag] == 1) {
		// file ext
	} else if ([selCell tag] == 2) {
		// file ext
	} else if ([selCell tag] == 3) {
		// file ext
	} else if ([selCell tag] == 4) {
		// file ext
	} else {		// NSLog(@"Error");
	}
}

- (IBAction)linkQuery:(id)sender
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	NSButtonCell *selCell = [sender selectedCell];

	NSLog(@"Selected cell is %ld", (long)[selCell tag]);
	NSLog(@"Selected cell title is %@", [selCell title]);

	if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else if ([selCell tag] == 0) {} else {// NSLog(@"Error");
	}
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

#pragma mark ViewController openPasswordQueries

/*
 *   - (NSMutableArray *)returnPasswordLinkArray:(NSMutableArray *)mutableArray
 *   {
 *    if (self.data_object.pass_1 == TRUE) {
 *        [self.data_object.passWordLinkArray addObject:self.data_object.pass_1_str];
 *
 *    }
 *
 *    if (self.data_object.pass_2 == TRUE) {
 *        [self.data_object.passWordLinkArray addObject:self.data_object.pass_2_str];
 *
 *    }
 *
 *    if (self.data_object.pass_3 == TRUE) {
 *        [self.data_object.passWordLinkArray addObject:self.data_object.pass_3_str];
 *
 *    }
 *
 *    if (self.data_object.pass_4 == TRUE) {
 *        [self.data_object.passWordLinkArray addObject:self.data_object.pass_4_str];
 *
 *    }
 *
 *    if (self.data_object.pass_5 == TRUE) {
 *        [self.data_object.passWordLinkArray addObject:self.data_object.pass_5_str];
 *
 *    }
 *
 *    if (self.data_object.pass_6 == TRUE) {
 *
 *        [self.data_object.passWordLinkArray addObject:(NSString *)self.data_object.pass_6_str];
 *
 *    }
 *
 *
 *        for (int i = 0; i < [self.data_object.passWordLinkArray count]; i++) {
 *            //NSLog(@"%d: %@", i, self.data_object.passWordLinkArray[i]);
 *        }
 *
 *    mutableArray = self.data_object.passWordLinkArray;
 *
 *    return mutableArray;
 *   }
 *
 */

@end
