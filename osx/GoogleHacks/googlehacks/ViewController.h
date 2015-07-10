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

}

-(IBAction)getSearchField:(id)sender;

@property (nonatomic, readwrite) DataObjects *data_object;
@property (nonatomic, readwrite) NSTextField *searchField;

@end

