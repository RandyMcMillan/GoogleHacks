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


    IBOutlet NSTextField *searchTextField;
    IBOutlet NSButton *show;

}

-(IBAction)getSearchField:(id)sender;
- (NSURL *)modifiedURL;
- (void)openURL:(NSURL *)url inBackground:(BOOL)background;
-(IBAction)openURLFromButton:(id)sender;
- (IBAction)audioExtension:(id)sender;
- (IBAction)videoExtension:(id)sender;
- (IBAction)documentExtension:(id)sender;
- (IBAction)passwordQuery:(id)sender;
- (IBAction)fileExtension:(id)sender;
- (IBAction)linkQuery:(id)sender;

@property (nonatomic, readwrite) DataObjects *data_object;
@property (nonatomic, readwrite) NSTextField *searchTextField;

@end

