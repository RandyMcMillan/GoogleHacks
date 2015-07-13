//
//  DataObjects.m
//  GoogleHacks
//
//  Created by Randy McMillan on 7/9/15.
//  Copyright (c) 2015 Randy McMillan. All rights reserved.
//

#import "DataObjects.h"
#include "Constants.h"

// https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Strings/Articles/CreatingStrings.html#//apple_ref/doc/uid/20000148-CJBCJHHI

@implementation DataObjects

// Search String
@synthesize search_str;
@synthesize full_search_str;
@synthesize types_str;

// Audio Files
@synthesize audioArray;
@synthesize mp3_check;
@synthesize wma_check;
@synthesize ogg_check;

// Documents
@synthesize documentArray;
@synthesize pdf_check;
@synthesize txt_check;
@synthesize lit_check;
@synthesize rar_check;
@synthesize doc_check;
@synthesize rtf_check;
@synthesize pps_check;
@synthesize chm_check;
@synthesize zip1_check;
@synthesize odt_check;

// Video
@synthesize videoArray;
@synthesize mpg_check;
@synthesize avi_check;
@synthesize wmv_check;
@synthesize divx_check;
@synthesize flv_check;

// Passwords
@synthesize passWordTitleArray;
@synthesize pass_check;
@synthesize pass_text;
@synthesize pass_1;
@synthesize pass_5;
@synthesize pass_2;
@synthesize pass_6;
@synthesize pass_3;
@synthesize pass_4;
@synthesize passWordLinkArray;
@synthesize pass_1_str;
@synthesize pass_2_str;
@synthesize pass_3_str;
@synthesize pass_4_str;
@synthesize pass_5_str;
@synthesize pass_6_str;

// Methods
@synthesize method1_check;
@synthesize method2_check;

// Links
@synthesize link_check;
@synthesize addurl_check;
@synthesize related_check;
@synthesize tools_text;
@synthesize StaticText2;
@synthesize StaticText3;

// archives
@synthesize exe_check;
@synthesize rar_check1;
@synthesize zip_check;
@synthesize ddl_check;

// text
@synthesize StaticText4;
@synthesize StaticText5;
@synthesize StaticText6;
@synthesize StaticText7;

- (id)loadValues:(NSObject *)object
{
	// Search String
    [self.search_str setString:@""];
    [self.full_search_str setString:@""];
    [self.types_str setString:@""];

	// Audio Files
	self.audioArray = @[@".mp3",
	@".wma",
	@".ogg"
	];

	self.mp3_check	= FALSE;
	self.wma_check	= FALSE;
	self.ogg_check	= FALSE;

	// Documents
	self.documentArray = @[@".pdf",
	@".txt",
	@".lit",
	@".rar",
	@".doc",
	@".rtf",
	@".pps",
	@".chm",
	@".zip1",
	@".odt"
	];

	self.pdf_check	= FALSE;
	self.txt_check	= FALSE;
	self.lit_check	= FALSE;
	self.rar_check	= FALSE;
	self.doc_check	= FALSE;
	self.rtf_check	= FALSE;
	self.pps_check	= FALSE;
	self.chm_check	= FALSE;
	self.zip1_check = FALSE;
	self.odt_check	= FALSE;

	// Video
	self.videoArray = @[@".mpg",
	@".avi",
	@".wmv",
	@".divx",
	@".flv"
	];

	self.mpg_check	= FALSE;
	self.avi_check	= FALSE;
	self.wmv_check	= FALSE;
	self.divx_check = FALSE;
	self.flv_check	= FALSE;

	// Passwords
	self.passWordTitleArray = @[@"pass 1",
	@"pass 2",
	@"pass 3",
	@"pass 4",
	@"pass 5",
	@"pass 6"
	];

	self.pass_check = FALSE;
	self.pass_text	= FALSE;

	self.pass_1		= FALSE;
	self.pass_2		= FALSE;
	self.pass_3		= FALSE;
	self.pass_4		= FALSE;
	self.pass_5		= FALSE;
	self.pass_6		= FALSE;
	self.pass_1_str = [NSURL URLWithString:PASS_1_STR];
	self.pass_2_str = [NSURL URLWithString:PASS_2_STR];
	self.pass_3_str = [NSURL URLWithString:PASS_3_STR];
	self.pass_4_str = [NSURL URLWithString:PASS_4_STR];
	self.pass_5_str = [NSURL URLWithString:PASS_5_STR];
	self.pass_6_str = [NSURL URLWithString:PASS_6_STR];

	self.passWordLinkArray = @[self.pass_1_str,
	self.pass_2_str,
	self.pass_3_str,
	self.pass_4_str,
	self.pass_5_str,
	self.pass_6_str
	];
*/
    
	// Methods
	self.method1_check	= FALSE;
	self.method2_check	= FALSE;

	// Links
	self.link_check		= FALSE;
	self.addurl_check	= FALSE;
	self.related_check	= FALSE;
	self.tools_text		= FALSE;
	self.StaticText2	= FALSE;
	self.StaticText3	= FALSE;

	// archives
	self.videoArray = @[@".exe",
	@".rar",
	@".zip",
	@".ddl"
	];

	self.exe_check	= FALSE;
	self.rar_check1 = FALSE;
	self.zip_check	= FALSE;
	self.ddl_check	= FALSE;

	// text
	self.StaticText4	= FALSE;
	self.StaticText5	= FALSE;
	self.StaticText6	= FALSE;
	self.StaticText7	= FALSE;

	NSLog(@"DataObject init");
	return NO;
}

+ (void)initialize
{
	NSLog(@"DataObjects initialize");
	// [self init];
}

@end
