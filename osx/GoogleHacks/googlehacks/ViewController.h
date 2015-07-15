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
	IBOutlet NSTextField	*urlLinkTextField;
	IBOutlet NSButton		*show;
	IBOutlet NSButton		*reset;
    //CheckBoxes
	IBOutlet NSButton		*mp3;
	IBOutlet NSButton		*wma;
	IBOutlet NSButton		*ogg;
	IBOutlet NSButton		*mpg;
	IBOutlet NSButton		*avi;
	IBOutlet NSButton		*wmv;
	IBOutlet NSButton		*divx;
	IBOutlet NSButton		*flv;
	IBOutlet NSButton		*pdf;
	IBOutlet NSButton		*txt;
	IBOutlet NSButton		*lit;
	IBOutlet NSButton		*doc;
	IBOutlet NSButton		*rtf;
	IBOutlet NSButton		*pps;
	IBOutlet NSButton		*chm;
	IBOutlet NSButton		*odt;
	IBOutlet NSButton		*pass1;
	IBOutlet NSButton		*pass2;
	IBOutlet NSButton		*pass3;
	IBOutlet NSButton		*pass4;
	IBOutlet NSButton		*pass5;
	IBOutlet NSButton		*pass6;
	IBOutlet NSButton		*rar;
	IBOutlet NSButton		*zip;
	IBOutlet NSButton		*exe;
	IBOutlet NSButton		*ddl;
	IBOutlet NSButton		*link;
	IBOutlet NSButton		*addUrl;
	IBOutlet NSButton		*related;
	IBOutlet NSButton		*tools;
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
- (IBAction)method1:(id)sender;
- (IBAction)method2:(id)sender;
- (IBAction)archives:(id)sender;
- (IBAction)linkQuery:(id)sender;
- (IBAction)resetButtons:(id)sender;
- (void)assembleTypesString;
- (void)openPasswordQueries;
- (NSString *)truncateString:(NSString *)string toCharacterCount:(NSUInteger)count;
@property (nonatomic, readwrite) DataObjects	*data_object;
@property (nonatomic, readwrite) NSTextField	*searchTextField;
@property (nonatomic, readwrite) NSMutableArray *urls;
@property (nonatomic, strong) NSWorkspace		*ws;
@property (nonatomic,readwrite)NSMutableString *types_str;

@end
