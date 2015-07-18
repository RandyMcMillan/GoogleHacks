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
	IBOutlet NSTextField	*customExtTextField;
	IBOutlet NSButton		*show;
	IBOutlet NSButton		*reset;
    //CheckBoxes
	IBOutlet NSButton		*mp3;
	IBOutlet NSButton		*wma;
	IBOutlet NSButton		*ogg;
   	IBOutlet NSButton		*mid;
 
    //
	IBOutlet NSButton		*mpg;
	IBOutlet NSButton		*avi;
	IBOutlet NSButton		*wmv;
	IBOutlet NSButton		*divx;
	IBOutlet NSButton		*flv;
    IBOutlet NSButton       *gif;
    //
	IBOutlet NSButton		*pdf;
	IBOutlet NSButton		*txt;
	IBOutlet NSButton		*lit;
	IBOutlet NSButton		*doc;
	IBOutlet NSButton		*docx;
	IBOutlet NSButton		*rtf;
	IBOutlet NSButton		*pps;
	IBOutlet NSButton		*chm;
	IBOutlet NSButton		*odt;
	//
    IBOutlet NSButton		*pass1;
	IBOutlet NSButton		*pass2;
	IBOutlet NSButton		*pass3;
	IBOutlet NSButton		*pass4;
	IBOutlet NSButton		*pass5;
	IBOutlet NSButton		*pass6;
	//
    IBOutlet NSButton		*rar;
	IBOutlet NSButton		*zip;
	IBOutlet NSButton		*exe;
	IBOutlet NSButton		*ddl;
	//
    IBOutlet NSButton		*link;
	IBOutlet NSButton		*addUrl;
	IBOutlet NSButton		*related;
	IBOutlet NSButton		*tools;
}

- (IBAction)pressSearchButton:(id)sender;
- (IBAction)enterFromSearchField:(id)sender;
- (IBAction)enterFromURLLinkField:(id)sender;
- (NSString *)returnSearchString:(NSString *)searchString;
- (NSURL *)modifyURL:(NSString *)modString;
- (void)openURL:(NSURL *)url inBackground:(BOOL)background;

- (IBAction)audioExtension:(id)sender;
- (IBAction)videoExtension:(id)sender;
- (IBAction)documentExtension:(id)sender;
- (IBAction)passwordQuery:(id)sender;
- (IBAction)archives:(id)sender;
- (IBAction)linkQuery:(id)sender;
- (void)assembleTypesString;
- (NSString *)truncateString:(NSString *)string toCharacterCount:(NSUInteger)count;
- (void)openPasswordQueries;
- (IBAction)method1:(id)sender;
- (IBAction)method2:(id)sender;
- (IBAction)resetButtons:(id)sender;

- (void)openAppleScript:(NSString *)scriptName;

@property (nonatomic, readwrite) DataObjects	*data_object;
@property (nonatomic, readwrite) NSTextField	*searchTextField;
@property (nonatomic, readwrite) NSTextField	*urlLinkTextField;
@property (nonatomic, readwrite) NSTextField	*customExtTextField;
@property (nonatomic, readwrite) NSMutableArray *urls;
@property (nonatomic, readwrite) NSMutableArray *passWordUrls;
@property (nonatomic, strong) NSWorkspace		*ws;
@property (nonatomic,readwrite)NSMutableString *typesString;
@property (nonatomic, readwrite)NSMutableArray *typesStringArray;

@end
