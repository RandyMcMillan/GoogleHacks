//
//  ViewController.h
//  GoogleHacks
//
//  Created by Randy McMillan on 7/9/15.
//  Copyright (c) 2015 Randy McMillan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ReturnSearchString.h"

@interface ViewController : NSViewController {
	IBOutlet NSTextField	*searchTextField;
	IBOutlet NSButton		*show;
}

- (IBAction)enterFromSearchField:(id)sender;
// return URL recieve searchString

- (void)openURL:(NSString *)url inBackground:(BOOL)background;
- (IBAction)openURLFromButton:(id)sender;
- (IBAction)audioExtension:(id)sender;
- (IBAction)videoExtension:(id)sender;
- (IBAction)documentExtension:(id)sender;
- (IBAction)passwordQuery:(id)sender;
- (IBAction)fileExtension:(id)sender;
- (IBAction)linkQuery:(id)sender;
@property (nonatomic, readwrite) NSTextField	*searchTextField;
@property (nonatomic, readwrite) NSMutableArray *urls;
@property (nonatomic, strong) NSWorkspace		*ws;

@property (nonatomic, retain) ReturnSearchString *ReturnSearchString;

@end
