//
//  ViewController.m
//  GoogleHacks
//
//  Created by Randy McMillan on 7/9/15.
//  Copyright (c) 2015 Randy McMillan. All rights reserved.
//


//https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Strings/Articles/CreatingStrings.html#//apple_ref/doc/uid/20000148-CJBCJHHI

#import "ViewController.h"
#import "MyViewController.h"
#import "MyCustomAnimator.h"
#import "DataObjects.h"
#include "Constants.h"

@implementation ViewController

@synthesize data_object;
@synthesize searchTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Presenting ViewController";
    [self.data_object = [DataObjects alloc]init];
    [self.data_object loadValues:nil];
    
    //Search String
    //self.data_object.search_str = @"Search String";
    //self.searchField. = self.data_object.search_str;
    //[self.searchTextField setStringValue:self.data_object.search_str];
    //self.data_object.full_search_str = @"Full Search String";
    self.data_object.types_str = @"";
    
#ifndef DEBUG
    NSLog(self.data_object.search_str);
    NSLog(self.data_object.full_search_str);
    NSLog(self.data_object.types_str);

#endif
    
    
    //Audio Files
    self.data_object.mp3_check = TRUE;
    self.data_object.wma_check = FALSE;
    self.data_object.ogg_check = FALSE;
    
#ifndef DEBUG
    NSLog(@"self.data_object.mp3_check IS : %@", (self.data_object.mp3_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.wma_check IS : %@", (self.data_object.wma_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.ogg_check IS : %@", (self.data_object.ogg_check == TRUE) ? @"TRUE" : @"FALSE");
#endif
    
    
    //Documents
    self.data_object.pdf_check = FALSE;
    self.data_object.txt_check = FALSE;
    self.data_object.lit_check = FALSE;
    self.data_object.rar_check = FALSE;
    self.data_object.doc_check = FALSE;
    self.data_object.rtf_check = FALSE;
    self.data_object.pps_check = FALSE;
    self.data_object.chm_check = FALSE;
    self.data_object.zip1_check = FALSE;
    self.data_object.odt_check = FALSE;
    
    
#ifndef DEBUG
    NSLog(@"self.data_object.pdf_check IS : %@", (self.data_object.pdf_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.txt_check IS : %@", (self.data_object.txt_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.lit_check IS : %@", (self.data_object.lit_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.rar_check IS : %@", (self.data_object.rar_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.doc_check IS : %@", (self.data_object.doc_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.rtf_check IS : %@", (self.data_object.rtf_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.pps_check IS : %@", (self.data_object.pps_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.chm_check IS : %@", (self.data_object.chm_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.zip1_check IS : %@", (self.data_object.zip1_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.odt_check IS : %@", (self.data_object.odt_check == TRUE) ? @"TRUE" : @"FALSE");
#endif
    
    //Video
    self.data_object.mpg_check = TRUE;
    self.data_object.avi_check = FALSE;
    self.data_object.wmv_check = FALSE;
    self.data_object.divx_check = FALSE;
    self.data_object.flv_check = FALSE;
    
#ifndef DEBUG
    NSLog(@"self.data_object.mpg_check IS : %@", (self.data_object.mpg_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.avi_check IS : %@", (self.data_object.avi_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.wmv_check IS : %@", (self.data_object.wmv_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.divx_check IS : %@", (self.data_object.divx_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"self.data_object.flv_check IS : %@", (self.data_object.flv_check == TRUE) ? @"TRUE" : @"FALSE");
#endif
    
    //Passwords
    self.data_object.pass_check = FALSE;
    self.data_object.pass_text = FALSE;
    
    self.data_object.pass_1 = FALSE;
    self.data_object.pass_5 = FALSE;
    self.data_object.pass_2 = FALSE;
    self.data_object.pass_6 = FALSE;
    self.data_object.pass_3 = FALSE;
    self.data_object.pass_4 = FALSE;
    
    //Methods
    self.data_object.method1_check = FALSE;
    self.data_object.method2_check = FALSE;
    
    //Links
    self.data_object.link_check = FALSE;
    self.data_object.addurl_check = FALSE;
    self.data_object.related_check = FALSE;
    self.data_object.tools_text = FALSE;
    self.data_object.StaticText2 = FALSE;
    self.data_object.StaticText3 = FALSE;
    
    // archives
    self.data_object.exe_check = FALSE;
    self.data_object.rar_check1 = FALSE;
    self.data_object.zip_check = FALSE;
    self.data_object.ddl_check = FALSE;
    
    // text
    self.data_object.StaticText4 = FALSE;
    self.data_object.StaticText5 = FALSE;
    self.data_object.StaticText6 = FALSE;
    self.data_object.StaticText7 = FALSE;
    
    
    
#ifndef DEBUG
//    #ifndef DEBUG

    
    NSLog(@"VALUE IS : %@", (self.data_object.wma_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.ogg_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.pdf_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.txt_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.lit_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.rar_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.doc_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.rtf_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.pps_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.chm_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.zip1_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.odt_check == TRUE) ? @"TRUE" : @"FALSE");

    NSLog(@"VALUE IS : %@", (self.data_object.mpg_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.avi_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.wmv_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.divx_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.flv_check == TRUE) ? @"TRUE" : @"FALSE");
    
    NSLog(@"VALUE IS : %@", (self.data_object.odt_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.odt_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.odt_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.odt_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.odt_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.odt_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.odt_check == TRUE) ? @"TRUE" : @"FALSE");
    NSLog(@"VALUE IS : %@", (self.data_object.odt_check == TRUE) ? @"TRUE" : @"FALSE");

    
#endif
    
    // Do any additional setup after loading the view.

}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
    
}

- (void)getSearchField:(id)sender {
    
    //http://stackoverflow.com/questions/16704156/how-to-open-external-links-to-safari-chrome-browser-in-cocoa
    //http://theocacao.com/document.page/183
    
    NSWorkspace * ws = [NSWorkspace sharedWorkspace];
    //NSURL *url = [NSURL URLWithString:@"http://theocacao.com/"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithString:[self.searchTextField stringValue]]];

    NSLog(@"url = %@", url);

   // NSURL *url = [NSURL URLWithString:[self.searchTextField stringValue]];
    NSLog(@"%@", [self.searchTextField stringValue]);

    // open local urls in our app, and external in default browser
    NSString *scheme = [url scheme];
    if ([scheme isEqualToString:@"file"])
    {
        //[listener use];
    }
    else
    {
        //[listener ignore];
       // [ws openURL: url];
        [self openURL:url inBackground:YES];
        
        
    }
    
    NSLog(@"__________getSearchField_________");
    NSLog(@"BASE_URL = %@",BASE_URL);

    //self.data_object.full_search_str = [self.data_object.search_str stringByAppendingString:BASE_URL];
    //NSLog(@"self.data_object.full_search_str = %@",self.data_object.full_search_str);


}

- (NSURL *)modifiedURL{

    NSURL *modifiedURL = nil;

    return modifiedURL;
}

-(IBAction)openURLFromButton:(id)sender
{

    self.data_object.full_search_str = [BASE_URL stringByAppendingString:self.data_object.search_str];

    [self openURL:[NSURL URLWithString:self.data_object.full_search_str] inBackground:YES];

}


 
// http://zachwaugh.me/posts/opening-links-in-background-with-cocoa/
 
 // Opens a URL in the default browser in background or foreground
 - (void)openURL:(NSURL *)url inBackground:(BOOL)background
 {
 if (background) {
 NSArray* urls = [NSArray arrayWithObject:url];
 [[NSWorkspace sharedWorkspace] openURLs:urls withAppBundleIdentifier:nil options:NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifiers:nil];
 } else {
 [[NSWorkspace sharedWorkspace] openURL:url];
 }
 }
 


@end
