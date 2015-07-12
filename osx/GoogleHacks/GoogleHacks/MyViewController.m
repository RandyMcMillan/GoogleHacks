//
//  MyViewController.m
//  TestOSXApp
//
//  Created by jonathan on 22/01/2015.
//  Copyright (c) 2015 net.ellipsis. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController () @end

@implementation MyViewController {}

@synthesize webView, baseURL, url;

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.title = @"Presented ViewController";
	[self.webView setMainFrameURL:[self appURL]];
}

- (IBAction)dismiss:(id)sender
{
	if (self.presentingViewController) {
		[self.presentingViewController dismissViewController:self];
	} else {
		// for the 'show' transition
		[self.view.window close];
	}
}

// Changes the greeting message by executing a function in JavaScript.
// This is triggered from the Change Greeting menu item.
- (IBAction)changeGreeting:(id)sender
{
	[[webView windowScriptObject] evaluateWebScript:@"changeGreeting('Hello from Objective-C!')"];
}

// Here we grab the URL to the bundled index.html document.
// Normally it would be the URL to your web app such as @"http://example.com".
- (NSString *)appURL
{
	// return [[[NSBundle mainBundle] URLForResource:@"http://www.google" withExtension:@"html"] absoluteString];

	self.baseURL	= [NSURL URLWithString:@"file:///path/to/web_root/"];
	self.url		= [NSURL URLWithString:@"folder/file.html" relativeToURL:self.baseURL];
	NSURL *absURL = [self.url absoluteURL];
	NSLog(@"absURL = %@", absURL);
	NSString *getURL = [NSString stringWithContentsOfURL:absURL encoding:1000 error:nil];
	// self.title = [NSString stringWithContentsOfURL:absURL encoding:1000 error:nil];;

	return getURL;
}

// This delegate method gets triggered every time the page loads, but before the JavaScript runs
- (void)webView:(WebView *)webView windowScriptObjectAvailable:(WebScriptObject *)windowScriptObject
{
	// Allow this class to be usable through the "window.app" object in JavaScript
	// This could be any Objective-C class
	[windowScriptObject setValue:self forKey:@"app"];
}

@end
