//
//  MyViewController.h
//  TestOSXApp
//
//  Created by jonathan on 22/01/2015.
//  Copyright (c) 2015 net.ellipsis. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "DataObjects.h"

@interface MyViewController : NSViewController {
	IBOutlet id		webView;
	IBOutlet NSURL	*baseURL;
	IBOutlet NSURL	*url;
}

@property (nonatomic, retain) WebView	*webView;
@property (nonatomic, retain) NSURL		*baseURL;
@property (nonatomic, retain) NSURL		*url;

- (NSString *)appURL;
- (IBAction)changeGreeting:(id)sender;

@end
