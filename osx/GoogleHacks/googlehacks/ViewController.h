//
//  ViewController.h
//  GoogleHacks
//
//  Created by Randy McMillan on 7/9/15.
//  Copyright (c) 2015 Randy McMillan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DataObjects.h"

@interface ViewController : NSViewController {
    IBOutlet NSTextField	*searchTextField;
	IBOutlet NSButton		*show;
    IBOutlet NSButton *pass1;
    IBOutlet NSButton *pass2;
    IBOutlet NSButton *pass3;
    IBOutlet NSButton *pass4;
    IBOutlet NSButton *pass5;
    IBOutlet NSButton *pass6;
}

- (IBAction)enterFromSearchField:(id)sender;
- (NSString *)returnSearchString:(NSString *)searchString;
- (NSURL *)modifyURL:(NSString *)modString;
- (void)openURL:(NSURL *)url inBackground:(BOOL)background;
- (IBAction)openURLFromButton:(id)sender;
- (IBAction)audioExtension:(id)sender;
- (IBAction)videoExtension:(id)sender;
- (IBAction)documentExtension:(id)sender;
- (IBAction)passwordQuery:(id)sender;
- (IBAction)fileExtension:(id)sender;
- (IBAction)linkQuery:(id)sender;
- (void)assembleTypesString;
- (void)openPasswords;
- (NSString *)truncateString:(NSString *)string toCharacterCount:(NSUInteger)count;
@property (nonatomic, readwrite) DataObjects	*data_object;
@property (nonatomic, readwrite) NSTextField	*searchTextField;
@property (nonatomic, retain) NSButton *pass1;
@property (nonatomic, retain) NSButton *pass2;
@property (nonatomic, retain) NSButton *pass3;
@property (nonatomic, retain) NSButton *pass4;
@property (nonatomic, retain) NSButton *pass5;
@property (nonatomic, retain) NSButton *pass6;

@end
