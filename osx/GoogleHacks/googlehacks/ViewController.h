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


- (void)openURL:(NSString *)url inBackground:(BOOL)background;
- (IBAction)enterFromButton:(id)sender;
- (IBAction)enterFromSearchField:(id)sender;
- (IBAction)audioExtension:(id)sender;
- (IBAction)videoExtension:(id)sender;
- (IBAction)documentExtension:(id)sender;
- (IBAction)passwordQuery:(id)sender;
- (IBAction)fileExtension:(id)sender;
- (IBAction)linkQuery:(id)sender;
@property (nonatomic, readwrite) NSTextField	*searchTextField;
@property (nonatomic, readwrite) NSMutableString *url;
@property (nonatomic, readwrite) NSMutableArray *urls;
@property (nonatomic, strong) NSWorkspace		*ws;
@property (nonatomic, readwrite) NSMutableString *searchString;
@property (nonatomic, retain) ReturnSearchString *ReturnSearchString;

@end
