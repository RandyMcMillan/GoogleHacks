//
//  MyView.m
//  NSViewControllerPresentations
//
//  Created by jonathan on 24/01/2015.
//  Copyright (c) 2015 net.ellipsis. All rights reserved.
//

#import "MyView.h"

@implementation MyView
/*
 These click-blockers are required for the custom presented NSViewController's view, as it does not have it's own backing window. Without them, clicks are picked up by the buttons on the presentingViewControllers' view
 
 */



- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    //    NSURL *url = [[NSURL alloc] initWithString:dialThis];
    //    NSURL *url = [NSURL URLWithString:dialThis];
    [webView setURL:[NSURL URLWithString:[self appURL]]];

    //[webView setURL:[self appURL]];
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag {
   // [self bringMainWindowToFront:nil];
    return YES;
}

/*
- (IBAction)bringMainWindowToFront:(id)sender {
    [window makeKeyAndOrderFront:sender];
    if ([[webView setURL] isEqualTo:@""]) {
        [webView setURL:[NSURL URLWithString:[self appURL]]];
    }
}

 */


- (void)windowWillClose:(NSNotification *)notification {
    [webView setURL:[NSURL URLWithString:[self appURL]]];
}

// Make every method in this class available to javascript
// This may be a security risk so you may want to add logic to
// restrict which methods are accessible
+ (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector { return NO; }

// Here we grab the URL to the bundled index.html document.
// Normally it would be the URL to your web app such as @"http://example.com".
- (NSString *)appURL {
    return [[[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"] absoluteString];
}


// Change the application's icon in the dock, this is triggered from JavaScript
- (void)changeIcon:(NSString *)iconName {
    [NSApp setApplicationIconImage:[NSImage imageNamed:iconName]];
}


// Changes the greeting message by executing a function in JavaScript.
// This is triggered from the Change Greeting menu item.
- (IBAction)changeGreeting:(id)sender {
   // [[webView windowScriptObject] evaluateWebScript:@"changeGreeting('Hello from Objective-C!')"];
}
/*
// This delegate method gets triggered every time the page loads, but before the JavaScript runs
- (void)webView:(WebView *)webView windowScriptObjectAvailable:(WebScriptObject *)windowScriptObject {
    // Allow this class to be usable through the "window.app" object in JavaScript
    // This could be any Objective-C class
    [windowScriptObject setValue:self forKey:@"app"];
}
*/


- (void) mouseDown:(NSEvent*)event {}
- (void) mouseDragged:(NSEvent*)event {}
- (void) mouseUp:(NSEvent*)event {}
@end
