//
//  ReturnSearchString.m
//  GoogleHacks
//
//  Created by Randy McMillan on 7/13/15.
//  Copyright (c) 2015 Randy McMillan. All rights reserved.
//

#import "ReturnSearchString.h"

@implementation ReturnSearchString
@synthesize data_object;

- (void)loadDataObject
{
	// [self.data_object init];
	[self.data_object loadValues:nil];
}

- (NSMutableString *)returnSearchString:(NSMutableString *)mutableString{

    NSLog(@"%@", NSStringFromSelector(_cmd));

    return mutableString;
 
}

- (NSMutableArray *)returnPasswordLinkArray:(NSMutableArray *)mutableArray
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	return mutableArray;
}

- (NSString *)truncateString:(NSString *)string toCharacterCount:(NSUInteger)count
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	return string;
}

// DataObjects
- (NSString *)parseAudioExts:(NSString *)string
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	return string;
}

- (NSString *)parseVideoExts:(NSString *)string
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	return string;
}

- (NSString *)parseDocumentExts:(NSString *)string
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	return string;
}

- (NSString *)parsePassWordStrings:(NSString *)string
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	return string;
}

// link//add url//related//tools
- (NSString *)parseMethods:(NSString *)string
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	return string;
}

- (NSString *)parseFileExts:(NSString *)string
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	return string;
}

- (void)assembleTypesString
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	// Audio
	if (self.data_object.mp3_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".mp3%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.wma_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".wma%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.ogg_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".ogg%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	// Docs
	if (self.data_object.pdf_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".pdf%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.txt_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".txt%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.lit_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".lit%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.rar_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".rar%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.doc_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".doc%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.rtf_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".rtf%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.pps_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".pps%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.chm_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".chm%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.zip1_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".zip1%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.odt_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".odt%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	// Video
	if (self.data_object.mpg_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".mpg%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.avi_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".avi%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.wmv_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".wmv%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.divx_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".divx%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if (self.data_object.flv_check != FALSE) {
		self.data_object.types_str = (NSMutableString *)[self.data_object.types_str stringByAppendingString:@".flv%7C"];
	}

	NSLog(@"%@", self.data_object.types_str);

	if ([self.data_object.types_str length] <= 7) {
		NSLog(@"less than = 7");
		// http://borkware.com/quickies/one?topic=NSString

		self.data_object.types_str = (NSMutableString *)[self truncateString:self.data_object.types_str toCharacterCount:4];

		// https://bdpuqvsqmphctrcs.onion.to/data/
	}

	if ([self.data_object.types_str isEqualToString:@".divx%7C"]) {
		self.data_object.types_str = (NSMutableString *)[self truncateString:self.data_object.types_str toCharacterCount:5];
	}

	NSLog(@"self.data_object.types_str = %@", self.data_object.types_str);
}

@end
