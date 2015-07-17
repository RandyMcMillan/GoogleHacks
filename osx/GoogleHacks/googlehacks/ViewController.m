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

@synthesize data_object, typesString, typesStringArray;
@synthesize searchTextField, urlLinkTextField, urls, passWordUrls, ws;

#pragma mark ViewController viewDidLoad

- (void)viewDidLoad
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	[super viewDidLoad];
	self.title = @"Presenting ViewController";
	[self.data_object = [DataObjects alloc] init];
	[self.data_object loadValues:nil];
	self.urls			= [NSMutableArray arrayWithCapacity:100];	// may use 4 when all done...we'll see
	self.passWordUrls	= [NSMutableArray arrayWithCapacity:10];	// never uses more than one...
    self.typesStringArray = [NSMutableArray arrayWithCapacity:100];
	// [self openPasswordQueries];
	self.ws			= [NSWorkspace sharedWorkspace];
	self.typesString	= (NSMutableString *)self.data_object.types_str;
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

	[self openPasswordQueries];
	[self assembleTypesString];

	[self.urls addObjectsFromArray:self.passWordUrls];
    [self.urls addObjectsFromArray:self.typesStringArray];
    
    
    for (int i = 0; i < [self.passWordUrls count]; i++) {
        NSLog(@"self.passWordUrls[%d]: %@", i, (NSMutableString *)self.passWordUrls[i]);
    }
    
        for (int i = 0; i < [self.typesStringArray count]; i++) {
        NSLog(@"self.typesStringArray[%d]: %@", i, (NSMutableString *)self.typesStringArray[i]);
    }
    
        for (int i = 0; i < [self.urls count]; i++) {
        NSLog(@"self.urls[%d]: %@", i, (NSMutableString *)self.urls[i]);
    }

    [self openURL:self.urls inBackground:YES];

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

// Opens a URL in the default browser in background or foreground
- (void)openURL:(NSString *)url inBackground:(BOOL)background
{
	[self openAppleScript:(NSString *)@"SafariCloseAllWindows"];

	if (background) {
		// NSArray* urls = [NSArray arrayWithArray:self.urls];
		[[NSWorkspace sharedWorkspace] openURLs:(NSArray *)self.urls withAppBundleIdentifier:nil options:NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifiers:nil];
	} else {
		[[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:url]];
	}

	NSLog(@"self.urls count = %ld", [self.urls count]);
	NSLog(@"self.urls count = %ld", [self.urls count]);

	[self.urls removeAllObjects];
}

#pragma mark ViewController openAppleScript

- (void)openAppleScript:(NSString *)scriptName
{
	NSLog(@"%@", NSStringFromSelector(_cmd));
	NSString		*path			= [[NSBundle mainBundle] pathForResource:scriptName ofType:@"scpt"];
	NSURL			*url			= [NSURL fileURLWithPath:path]; NSDictionary *errors = [NSDictionary dictionary];
	NSAppleScript	*appleScript	= [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
	[appleScript executeAndReturnError:nil];
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

	[self.passWordUrls removeAllObjects];

	if ((long)[selCell tag] == 0) {
		[self.passWordUrls removeAllObjects];
	}

	for (int i = 0; i < [self.passWordUrls count]; i++) {
		NSLog(@"self.passWordUrls[%d]: %@", i, (NSMutableString *)self.passWordUrls[i]);
	}

	if ((long)[selCell tag] == 1) {
		if (![self.passWordUrls containsObject:[NSURL URLWithString:@"http://www.google.com/search?q=intitle%3A%22Index+of%22+passwords+modified"]]) {
			[self.passWordUrls addObject:[NSURL URLWithString:@"http://www.google.com/search?q=intitle%3A%22Index+of%22+passwords+modified"]];
		}
	} else {
		[self.passWordUrls removeObjectIdenticalTo:[NSURL URLWithString:@"http://www.google.com/search?q=intitle%3A%22Index+of%22+passwords+modified"]];
	}

	if ((long)[selCell tag] == 2) {
		if (![self.passWordUrls containsObject:[NSURL URLWithString:@"http://www.google.com/search?hl=en&q=allinurl%3Aauth_user_file.txt"]]) {
			[self.passWordUrls addObject:[NSURL URLWithString:@"http://www.google.com/search?hl=en&q=allinurl%3Aauth_user_file.txt"]];
		}
	} else {
		[self.passWordUrls removeObjectIdenticalTo:[NSURL URLWithString:@"http://www.google.com/search?hl=en&q=allinurl%3Aauth_user_file.txt"]];
	}

	if ((long)[selCell tag] == 3) {
		if (![self.passWordUrls containsObject:[NSURL URLWithString:@"http://www.google.com/search?q=inurl%3Apasslist.txt&btnG=Search"]]) {
			[self.passWordUrls addObject:[NSURL URLWithString:@"http://www.google.com/search?q=inurl%3Apasslist.txt&btnG=Search"]];
		}
	} else {
		[self.passWordUrls removeObjectIdenticalTo:[NSURL URLWithString:@"http://www.google.com/search?q=inurl%3Apasslist.txt&btnG=Search"]];
	}

	if ((long)[selCell tag] == 4) {
		if (![self.passWordUrls containsObject:[NSURL URLWithString:@"http://www.google.com/search?q=%22%23+-FrontPage-%22+inurl%3Aservice.pwd"]]) {
			[self.passWordUrls addObject:[NSURL URLWithString:@"http://www.google.com/search?q=%22%23+-FrontPage-%22+inurl%3Aservice.pwd"]];
		}
	} else {
		[self.passWordUrls removeObjectIdenticalTo:[NSURL URLWithString:@"ttp://www.google.com/search?q=%22%23+-FrontPage-%22+inurl%3Aservice.pwd"]];
	}

	if ((long)[selCell tag] == 5) {
		if (![self.passWordUrls containsObject:[NSURL URLWithString:@"http://www.google.com/search?q=intitle%3A%22Index+of%22+config.php"]]) {
			[self.passWordUrls addObject:[NSURL URLWithString:@"http://www.google.com/search?q=intitle%3A%22Index+of%22+config.php"]];
		}
	} else {
		[self.passWordUrls removeObjectIdenticalTo:[NSURL URLWithString:@"http://www.google.com/search?q=intitle%3A%22Index+of%22+config.php"]];
	}

	if ((long)[selCell tag] == 6) {
		if (![self.passWordUrls containsObject:[NSURL URLWithString:@"http://www.google.com/search?q=%22http%3A%2F%2F*%3A*%40%22"]]) {
			[self.passWordUrls addObject:[NSURL URLWithString:@"http://www.google.com/search?q=%22http%3A%2F%2F*%3A*%40%22"]];
		}
	} else {
		[self.passWordUrls removeObjectIdenticalTo:[NSURL URLWithString:@"http://www.google.com/search?q=%22http%3A%2F%2F*%3A*%40%22"]];
	}

	// With a traditional for loop
	for (int i = 0; i < [self.passWordUrls count]; i++) {
		NSLog(@"self.passWordUrls[%d]: %@", i, (NSMutableString *)self.passWordUrls[i]);
	}
}

#pragma mark ViewController openPasswordQueries

- (void)openPasswordQueries
{
	NSLog(@"%@", NSStringFromSelector(_cmd));

	[self openURL:(NSURL *)[self returnSearchString:nil] inBackground:YES];
}











/*
 
 
 
 ElseIf RadioButton6.value = TRUE  Then
 if index_check.value = TRUE Then
 full_search_str="http://www.google.com/search?q=site%3A" + search_str
 elseif related_check.value=true then
 full_search_str="http://www.google.com/search?q=related%3A" + search_str
 elseif  addurl_check.value=true then
 full_search_str="http://www.google.com/addurl?q="+ search_str +"&hl=en&dqq="
 elseif  link_check.value=true then
 full_search_str="http://www.google.com/search?q=link%3A" + search_str
 elseif map_check.value=true then
 full_search_str="http://www.google.com/search?q=view%3Amap+" + search_str

 
 
 */


/*
 
 
 end if
 ElseIf RadioButton4.value = TRUE  Then
 if method1_check.value = TRUE Then
 full_search_str="http://www.google.com/translate?langpair=en|en&u=" + search_str
 
 end if
 if method2_check.value = TRUE Then
 full_search_str="http://www.google.com/gwt/n?u=http%3A%2F%2F" + search_str
 
 end if
 
 
 ElseIf RadioButton7.value = TRUE  Then
 full_search_str="http://www.google.com/search?q=site%3Awww.lyrics.com " + search_str
 ElseIf RadioButton8.value = TRUE  Then
 full_search_str="http://www.google.com/search?hl=en&q=" + search_str +"+site%3Ahttp%3A%2F%2Fwww.searchfreefonts.com%2Ffont+OR+site%3Awww.dafont.com+OR+site%3Ahttp%3A%2F%2Fwww.searchfreefonts.com%2F+++-comments+-categories.php+-comment.php" + search_str
 Elseif RadioButton9.value=True Then
 if exe_check.value = TRUE Then
 types = types+".exe%7C"

 
 
 
 
 ElseIf RadioButton7.value = TRUE  Then
 full_search_str="http://www.google.com/search?q=site%3Awww.lyrics.com " + search_str
 ElseIf RadioButton8.value = TRUE  Then
 full_search_str="http://www.google.com/search?hl=en&q=" + search_str +"+site%3Ahttp%3A%2F%2Fwww.searchfreefonts.com%2Ffont+OR+site%3Awww.dafont.com+OR+site%3Ahttp%3A%2F%2Fwww.searchfreefonts.com%2F+++-comments+-categories.php+-comment.php" + search_str
 Elseif RadioButton9.value=True Then
 if exe_check.value = TRUE Then
 types = types+".exe%7C"

Window1.rbfrm 
 LINE 2256
 
 full_search_str="http://web.archive.org/web/*///http://" +search_str



/*
 
ElseIf RadioButton12.value = TRUE  Then
full_search_str="http://www.google.com/search?q=" +search_str+ "&btnG=Search&q=%28&q=bigupload.com%2Fd+%7C&q=filefactory.com%2Ffile+%7C&q=dl-1.free.fr+%7C&q=gigasize.com%2Fget.php+%7C&q=d01.megashares.com%2F%3Fd01+%7C&q=megaupload.com%2F%3Fd+%7C&q=rapidshare.com%2Ffiles+%7C&q=rapidshare.de%2Ffiles+%7C&q=rapidupload.com%2Fd.php+%7C&q=sendspace.com%2Ffile+%7C&q=sexuploader.com%2F%3Fd+%7C&q=uploading.com%2F%3Fget+%7C&q=uploadport.com%2Frequest%2F%3Ffid+%7C&q=zupload.com%2Fdownload.php+%7C&q=%29"

End If






 */


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

	self.typesString = (NSMutableString *)@"";
	// self.typesString = [self.typesString stringByAppendingString:@"%7C"];

	// Audio
	if ([mp3 state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".mp3%7C"];
	}

	if ([wma state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".wma%7C"];
	}

	if ([ogg state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".ogg%7C"];
	}
    
    if ([mid state] == TRUE) {
        self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".mid%7C"];
    }

	// Docs
	if ([pdf state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".pdf%7C"];
	}

	if ([txt state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".txt%7C"];
	}

	if ([lit state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".lit%7C"];
	}

	if ([rar state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".rar%7C"];
	}

	if ([doc state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".doc%7C"];
	}

	if ([rtf state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".rtf%7C"];
	}

	if ([pps state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".pps%7C"];
	}

	if ([chm state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".chm%7C"];
	}

	if ([zip state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".zip%7C"];
	}

	if ([odt state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".odt%7C"];
	}

	// Video
	if ([mpg state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".mpg%7C"];
	}

	if ([avi state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".avi%7C"];
	}

	if ([wmv state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".wmv%7C"];
	}

	if ([divx state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".divx%7C"];
	}

	if ([flv state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".flv%7C"];
	}

	if ([exe state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".exe%7C"];
	}

	if ([ddl state] == TRUE) {
		self.typesString = (NSMutableString *)[self.typesString stringByAppendingString:@".ddl%7C"];
	}

	if ([self.typesString length] <= 7) {
		// NSLog(@"less than = 7");
		// http://borkware.com/quickies/one?topic=NSString

		self.typesString = (NSMutableString *)[self truncateString:self.typesString toCharacterCount:4];
		// https://bdpuqvsqmphctrcs.onion.to/data/
	}

	if ([self.typesString isEqualToString:@".divx%7C"]) {
		self.typesString = (NSMutableString *)[self truncateString:self.typesString toCharacterCount:5];
	}
    
    [self.typesStringArray removeAllObjects];
    
  //  NSString *tempString = [NSMutableString stringWithString:@"http://www.google.com/search?hl=en&q=-inurl%3A%28htm%7Chtml%7Cphp%29+intitle%3A%22index+of%22+%2B%22last+modified%22+%2B%22parent+directory%22+%2Bdescription+%2Bsize+%2B%28' +types+ '%29+%22'+search_str+'%22"];
    
   	NSLog(@"self.typesString = %@", (NSString *)self.typesString);
 
    
    NSMutableString *tempString =
    [[NSMutableString alloc]initWithString:@"http://www.google.com/search?hl=en&q=-inurl%3A%28htm%7Chtml%7Cphp%29+intitle%3A%22index+of%22+%2B%22last+modified%22+%2B%22parent+directory%22+%2Bdescription+%2Bsize+%2B%28"];
     
     tempString = (NSMutableString *)[tempString stringByAppendingString:self.typesString];
     tempString = (NSMutableString *)[tempString stringByAppendingString:@"%29+%22"];
     tempString = (NSMutableString *)[tempString stringByAppendingString:[self returnSearchField]];
     tempString = (NSMutableString *)[tempString stringByAppendingString:@"%22"];
 
    NSLog(@"LINE:560 \n tempString = %@\n",tempString);
    
    [self.typesStringArray addObject:[NSURL URLWithString:(NSString *)tempString]];
    
    
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
    [mid setState:0];
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

	// [pass1 setState:0];
	// [pass2 setState:0];
	// [pass3 setState:0];
	// [pass4 setState:0];
	// [pass5 setState:0];
	// [pass6 setState:0];

	[rar setState:0];
	[zip setState:0];
	[exe setState:0];
	[ddl setState:0];
	[link setState:0];
	[addUrl setState:0];
	[related setState:0];
	[tools setState:0];

	// NSLog(@"self.typesString = %@", NSStringFromClass([self.typesString class]));
	self.typesString = (NSMutableString *)@"";

	// if (!self.urls) {
	//	self.urls = [[NSMutableArray alloc] init];
	// } else {
	
    
    [self.urls removeAllObjects];
    [self.typesStringArray removeAllObjects];
    
    
    
	// }

	NSLog(@"self.typesString = %@", self.typesString);
}

@end
