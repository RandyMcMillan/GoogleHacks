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
 //   self.data_object.types_str = @"";
    
#ifndef DEBUG
    //NSLog(self.data_object.search_str);
    //NSLog(self.data_object.full_search_str);
    //NSLog(self.data_object.types_str);

#endif
    
    //images
    //????
    
    
    //https://support.google.com/websearch/answer/2466433?hl=en


    
    
    //Methods
    //http://www.google.com/translate?hl=&sl=en&tl=en&u=%20randymcmillan.net&sandbox=1
    //http://www.google.com/translate?hl=&sl=da&tl=de&u=%20randymcmillan.net&sandbox=1
    self.data_object.method1_check = FALSE;
    //http://www.google.com/gwt/n?u=http%3A%2F%2Frandymcmillan.net
    self.data_object.method2_check = FALSE;
    
    //Links
    //site
    //http://www.google.com/search?q=site%3A

    self.data_object.link_check = FALSE;
    
    //Add url
    //http://www.google.com/addurl?q="+ search_str +"&hl=en&dqq=
    self.data_object.addurl_check = FALSE;
    
    //related
    //http://www.google.com/search?q=related%3Arandy+mcmillan
    self.data_object.related_check = FALSE;
    self.data_object.tools_text = FALSE;
    self.data_object.StaticText2 = FALSE;
    self.data_object.StaticText3 = FALSE;
    //map
    //http://www.google.com/search?q=view%3Amap+
    //https://maps.google.com/
    //https://www.google.com/maps/@37.0625,-95.677068,4z
    
    
    // text
    self.data_object.StaticText4 = FALSE;
    self.data_object.StaticText5 = FALSE;
    self.data_object.StaticText6 = FALSE;
    self.data_object.StaticText7 = FALSE;
    
    
    
    // Do any additional setup after loading the view.

}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
    
}


//full_search_str ="http://www.google.com/search?hl=en&q=-inurl%3A%28htm%7Chtml%7Cphp%29+intitle%3A%22index+of%22+%2B%22last+modified%22+%2B%22parent+directory%22+%2Bdescription+%2Bsize+%2B%28" +types+ "%29+%22"+search_str+"%22"

- (void)getSearchField:(id)sender {
    
    //http://stackoverflow.com/questions/16704156/how-to-open-external-links-to-safari-chrome-browser-in-cocoa
    //http://theocacao.com/document.page/183
    
    
    //TODO handle white spaces
    //http://stackoverflow.com/questions/7628470/remove-all-whitespaces-from-nsstring
    //[self.data_object.full_search_str  stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    self.searchTextField.stringValue  = [[self.searchTextField stringValue]  stringByReplacingOccurrencesOfString:@" " withString:@"%20"];

    self.data_object.full_search_str = [BASE_URL stringByAppendingString:[self.searchTextField stringValue]];
    
    //http://stackoverflow.com/questions/3439853/replace-occurances-of-space-in-url
    //strip spaces from user before direct manipulation
    self.data_object.full_search_str  = [self.data_object.full_search_str  stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithString:self.data_object.full_search_str]];
 
    NSString *scheme = [url scheme];
    if ([scheme isEqualToString:@"file"]){}else
    {
        if (![self.data_object.types_str  isEqualToString:@""]) {
            
            [self openURL:url inBackground:YES];

        }else{
        //append with types

            
            
            //open afgter append
            [self openURL:url inBackground:YES];
        }
        
    }
    
    //NSLog(@"__________getSearchField_________");

    [self assembleTypesString];
}

- (NSURL *)modifiedURL{

    NSURL *modifiedURL = nil;

    return modifiedURL;
}

-(IBAction)openURLFromButton:(id)sender
{

    
    //tle%3A%22index+of%22+%2B%22last+modified%22+%2B%22parent+directory%22+%2Bdescription+%2Bsize+%2B%28" +types+ "%29+%22"+search_str+"%22"

    //self.data_object.full_search_str = [BASE_URL stringByAppendingString:self.data_object.search_str];
    [self getSearchField:nil];
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


//https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Button/Articles/QueryMatrixButtons.html
- (IBAction)audioExtension:(id)sender { // sender is NSMatrix object
    NSButtonCell *selCell = [sender selectedCell];
    NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (id)[selCell title]);

    
    if ([selCell tag]== 0){
    
            self.data_object.mp3_check = FALSE;
            self.data_object.wma_check = FALSE;
            self.data_object.ogg_check = FALSE;
    
    }else if ([selCell tag]==1){
           self.data_object.mp3_check = TRUE;
            self.data_object.wma_check = FALSE;
            self.data_object.ogg_check = FALSE;

    
    }else if ([selCell tag]==2){
    
    
            self.data_object.mp3_check = FALSE;
            self.data_object.wma_check = TRUE;
            self.data_object.ogg_check = FALSE;

    
    }else if ([selCell tag]==3){
    
            self.data_object.mp3_check = FALSE;
            self.data_object.wma_check = FALSE;
            self.data_object.ogg_check = TRUE;

    
    }else{//NSLog(@"Error");
    }
    
#ifndef DEBUG
    //NSLog(@"self.data_object.mp3_check IS : %@", (self.data_object.mp3_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.wma_check IS : %@", (self.data_object.wma_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.ogg_check IS : %@", (self.data_object.ogg_check == TRUE) ? @"TRUE" : @"FALSE");
#endif
    

    
    

}

- (IBAction)videoExtension:(id)sender{

    NSButtonCell *selCell = [sender selectedCell];
    NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (id)[selCell title]);

    if ([selCell tag]== 0){
    
        
        //Video
            self.data_object.mpg_check = FALSE;
            self.data_object.avi_check = FALSE;
            self.data_object.wmv_check = FALSE;
            self.data_object.divx_check = FALSE;
            self.data_object.flv_check = FALSE;
        

    
    }else if ([selCell tag]== 1){
    
        
        //Video
        self.data_object.mpg_check = TRUE;
        self.data_object.avi_check = FALSE;
        self.data_object.wmv_check = FALSE;
        self.data_object.divx_check = FALSE;
        self.data_object.flv_check = FALSE;
        

    
    }else if ([selCell tag]== 2){
    
    
    //Video
    self.data_object.mpg_check = FALSE;
    self.data_object.avi_check = TRUE;
    self.data_object.wmv_check = FALSE;
    self.data_object.divx_check = FALSE;
    self.data_object.flv_check = FALSE;

    }

    else if ([selCell tag]== 3){
    
        
        //Video
        self.data_object.mpg_check = FALSE;
        self.data_object.avi_check = FALSE;
        self.data_object.wmv_check = TRUE;
        self.data_object.divx_check = FALSE;
        self.data_object.flv_check = FALSE;
        

    
    }else if ([selCell tag]== 4){
    
        
        //Video
        self.data_object.mpg_check = FALSE;
        self.data_object.avi_check = FALSE;
        self.data_object.wmv_check = FALSE;
        self.data_object.divx_check = TRUE;
        self.data_object.flv_check = FALSE;

        

    
    }else if ([selCell tag]== 5){
    
        
        //Video
        self.data_object.mpg_check = FALSE;
        self.data_object.avi_check = FALSE;
        self.data_object.wmv_check = FALSE;
        self.data_object.divx_check = FALSE;
        self.data_object.flv_check = TRUE;

    
    }else{//NSLog(@"Error");
    }
    
#ifndef DEBUG
    //NSLog(@"self.data_object.mpg_check IS : %@", (self.data_object.mpg_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.avi_check IS : %@", (self.data_object.avi_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.wmv_check IS : %@", (self.data_object.wmv_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.divx_check IS : %@", (self.data_object.divx_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.flv_check IS : %@", (self.data_object.flv_check == TRUE) ? @"TRUE" : @"FALSE");
#endif
    

    


}
- (IBAction)documentExtension:(id)sender{

    NSButtonCell *selCell = [sender selectedCell];
    NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (id)[selCell title]);

    if ([selCell tag]== 0){
    
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

    
    }else if ([selCell tag]== 1){
    
        //Documents
        self.data_object.pdf_check = TRUE;
        self.data_object.txt_check = FALSE;
        self.data_object.lit_check = FALSE;
        self.data_object.rar_check = FALSE;
        self.data_object.doc_check = FALSE;
        self.data_object.rtf_check = FALSE;
        self.data_object.pps_check = FALSE;
        self.data_object.chm_check = FALSE;
        self.data_object.zip1_check = FALSE;
        self.data_object.odt_check = FALSE;

    
    }else
        if ([selCell tag]== 2){
        
            //Documents
            self.data_object.pdf_check = FALSE;
            self.data_object.txt_check = TRUE;
            self.data_object.lit_check = FALSE;
            self.data_object.rar_check = FALSE;
            self.data_object.doc_check = FALSE;
            self.data_object.rtf_check = FALSE;
            self.data_object.pps_check = FALSE;
            self.data_object.chm_check = FALSE;
            self.data_object.zip1_check = FALSE;
            self.data_object.odt_check = FALSE;

        
        }else
            if ([selCell tag]== 3){
            
                //Documents
                self.data_object.pdf_check = FALSE;
                self.data_object.txt_check = FALSE;
                self.data_object.lit_check = TRUE;
                self.data_object.rar_check = FALSE;
                self.data_object.doc_check = FALSE;
                self.data_object.rtf_check = FALSE;
                self.data_object.pps_check = FALSE;
                self.data_object.chm_check = FALSE;
                self.data_object.zip1_check = FALSE;
                self.data_object.odt_check = FALSE;

            
            }else
                if ([selCell tag]== 4){
                
                    //Documents
                    self.data_object.pdf_check = FALSE;
                    self.data_object.txt_check = FALSE;
                    self.data_object.lit_check = FALSE;
                    self.data_object.rar_check = TRUE;
                    self.data_object.doc_check = FALSE;
                    self.data_object.rtf_check = FALSE;
                    self.data_object.pps_check = FALSE;
                    self.data_object.chm_check = FALSE;
                    self.data_object.zip1_check = FALSE;
                    self.data_object.odt_check = FALSE;

                
                }else
                    if ([selCell tag]== 5){
                    
                        //Documents
                        self.data_object.pdf_check = FALSE;
                        self.data_object.txt_check = FALSE;
                        self.data_object.lit_check = FALSE;
                        self.data_object.rar_check = FALSE;
                        self.data_object.doc_check = TRUE;
                        self.data_object.rtf_check = FALSE;
                        self.data_object.pps_check = FALSE;
                        self.data_object.chm_check = FALSE;
                        self.data_object.zip1_check = FALSE;
                        self.data_object.odt_check = FALSE;

                    
                    }else
                        if ([selCell tag]== 6){
                        
                            //Documents
                            self.data_object.pdf_check = FALSE;
                            self.data_object.txt_check = FALSE;
                            self.data_object.lit_check = FALSE;
                            self.data_object.rar_check = FALSE;
                            self.data_object.doc_check = FALSE;
                            self.data_object.rtf_check = TRUE;
                            self.data_object.pps_check = FALSE;
                            self.data_object.chm_check = FALSE;
                            self.data_object.zip1_check = FALSE;
                            self.data_object.odt_check = FALSE;

                        }else
                            if ([selCell tag]== 7){
                            
                                //Documents
                                self.data_object.pdf_check = FALSE;
                                self.data_object.txt_check = FALSE;
                                self.data_object.lit_check = FALSE;
                                self.data_object.rar_check = FALSE;
                                self.data_object.doc_check = FALSE;
                                self.data_object.rtf_check = FALSE;
                                self.data_object.pps_check = TRUE;
                                self.data_object.chm_check = FALSE;
                                self.data_object.zip1_check = FALSE;
                                self.data_object.odt_check = FALSE;

                            
                            }else
                                if ([selCell tag]== 8){
                                
                                    //Documents
                                    self.data_object.pdf_check = FALSE;
                                    self.data_object.txt_check = FALSE;
                                    self.data_object.lit_check = FALSE;
                                    self.data_object.rar_check = FALSE;
                                    self.data_object.doc_check = FALSE;
                                    self.data_object.rtf_check = FALSE;
                                    self.data_object.pps_check = FALSE;
                                    self.data_object.chm_check = TRUE;
                                    self.data_object.zip1_check = FALSE;
                                    self.data_object.odt_check = FALSE;

                                
                                }else
                                    if ([selCell tag]== 9){
                                    
                                        //Documents
                                        self.data_object.pdf_check = FALSE;
                                        self.data_object.txt_check = FALSE;
                                        self.data_object.lit_check = FALSE;
                                        self.data_object.rar_check = FALSE;
                                        self.data_object.doc_check = FALSE;
                                        self.data_object.rtf_check = FALSE;
                                        self.data_object.pps_check = FALSE;
                                        self.data_object.chm_check = FALSE;
                                        self.data_object.zip1_check = TRUE;
                                        self.data_object.odt_check = FALSE;

                                    }else
                                        if ([selCell tag]== 10){
                                        
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
                                            self.data_object.odt_check = TRUE;

                                        
                                        }else{//NSLog(@"Error");
                                        }
    
#ifndef DEBUG
    //NSLog(@"self.data_object.pdf_check IS : %@", (self.data_object.pdf_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.txt_check IS : %@", (self.data_object.txt_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.lit_check IS : %@", (self.data_object.lit_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.rar_check IS : %@", (self.data_object.rar_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.doc_check IS : %@", (self.data_object.doc_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.rtf_check IS : %@", (self.data_object.rtf_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.pps_check IS : %@", (self.data_object.pps_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.chm_check IS : %@", (self.data_object.chm_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.zip1_check IS : %@", (self.data_object.zip1_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.odt_check IS : %@", (self.data_object.odt_check == TRUE) ? @"TRUE" : @"FALSE");
#endif




}
- (IBAction)passwordQuery:(id)sender{

    NSButtonCell *selCell = [sender selectedCell];
    NSLog(@"Selected cell tag is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell state is %ld", (long)[selCell state]);
    NSLog(@"Selected cell title is %@", (id)[selCell title]);

    
    if ([selCell tag]== 0){
    
        //Passwords
        self.data_object.pass_check = FALSE;
        self.data_object.pass_text = FALSE;
        
        self.data_object.pass_1 = FALSE;
        self.data_object.pass_2 = FALSE;
        self.data_object.pass_3 = FALSE;
        self.data_object.pass_4 = FALSE;
        self.data_object.pass_5 = FALSE;
        self.data_object.pass_6 = FALSE;

    
    }else if ([selCell tag]== 1){
    
        //Passwords
        self.data_object.pass_check = TRUE;
        self.data_object.pass_text = FALSE;
        
        self.data_object.pass_1 = FALSE;
        self.data_object.pass_2 = FALSE;
        self.data_object.pass_3 = FALSE;
        self.data_object.pass_4 = FALSE;
        self.data_object.pass_5 = FALSE;
        self.data_object.pass_6 = FALSE;
    
    }else
        if ([selCell tag]== 2){
        
            //Passwords
            self.data_object.pass_check = FALSE;
            self.data_object.pass_text = TRUE;
            
            self.data_object.pass_1 = FALSE;
            self.data_object.pass_2 = FALSE;
            self.data_object.pass_3 = FALSE;
            self.data_object.pass_4 = FALSE;
            self.data_object.pass_5 = FALSE;
            self.data_object.pass_6 = FALSE;


        
        }else
            if ([selCell tag]== 3){
            
                //Passwords
                self.data_object.pass_check = FALSE;
                self.data_object.pass_text = FALSE;
                
                self.data_object.pass_1 = TRUE;
                self.data_object.pass_2 = FALSE;
                self.data_object.pass_3 = FALSE;
                self.data_object.pass_4 = FALSE;
                self.data_object.pass_5 = FALSE;
                self.data_object.pass_6 = FALSE;

            
            }else
                if ([selCell tag]== 4){
                
                    //Passwords
                    self.data_object.pass_check = FALSE;
                    self.data_object.pass_text = FALSE;
                    
                    self.data_object.pass_1 = FALSE;
                    self.data_object.pass_2 = TRUE;
                    self.data_object.pass_3 = FALSE;
                    self.data_object.pass_4 = FALSE;
                    self.data_object.pass_5 = FALSE;
                    self.data_object.pass_6 = FALSE;

                
                }else
                    if ([selCell tag]== 5){
                    
                        //Passwords
                        self.data_object.pass_check = FALSE;
                        self.data_object.pass_text = FALSE;
                        
                        self.data_object.pass_1 = FALSE;
                        self.data_object.pass_2 = FALSE;
                        self.data_object.pass_3 = TRUE;
                        self.data_object.pass_4 = FALSE;
                        self.data_object.pass_5 = FALSE;
                        self.data_object.pass_6 = FALSE;

                    
                    }else
                        if ([selCell tag]== 6){
                        
                            //Passwords
                            self.data_object.pass_check = FALSE;
                            self.data_object.pass_text = FALSE;
                            
                            self.data_object.pass_1 = FALSE;
                            self.data_object.pass_2 = FALSE;
                            self.data_object.pass_3 = FALSE;
                            self.data_object.pass_4 = TRUE;
                            self.data_object.pass_5 = FALSE;
                            self.data_object.pass_6 = FALSE;

                        
                        }else
                            if ([selCell tag]== 7){
                            
                                //Passwords
                                self.data_object.pass_check = FALSE;
                                self.data_object.pass_text = FALSE;
                                
                                self.data_object.pass_1 = FALSE;
                                self.data_object.pass_2 = FALSE;
                                self.data_object.pass_3 = FALSE;
                                self.data_object.pass_4 = FALSE;
                                self.data_object.pass_5 = TRUE;
                                self.data_object.pass_6 = FALSE;


                            
                            }else
                                if ([selCell tag]== 8){
                                
                                    //Passwords
                                    self.data_object.pass_check = FALSE;
                                    self.data_object.pass_text = FALSE;
                                    
                                    self.data_object.pass_1 = FALSE;
                                    self.data_object.pass_2 = FALSE;
                                    self.data_object.pass_3 = FALSE;
                                    self.data_object.pass_4 = FALSE;
                                    self.data_object.pass_5 = FALSE;
                                    self.data_object.pass_6 = TRUE;

                                
                                }else{//NSLog(@"Error");
                                }
    
#ifndef DEBUG
    //NSLog(@"self.data_object.pass_check IS : %@", (self.data_object.pass_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.pass_text IS : %@", (self.data_object.pass_text == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.pass_1 IS : %@", (self.data_object.pass_1 == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.pass_2 IS : %@", (self.data_object.pass_2 == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.pass_3 IS : %@", (self.data_object.pass_3 == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.pass_4 IS : %@", (self.data_object.pass_4 == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.pass_5 IS : %@", (self.data_object.pass_5 == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.pass_6 IS : %@", (self.data_object.pass_6 == TRUE) ? @"TRUE" : @"FALSE");
#endif



}
- (IBAction)fileExtension:(id)sender{

    NSButtonCell *selCell = [sender selectedCell];
    NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (id)[selCell title]);

    if ([selCell tag]== 0){
    
        // file ext
        self.data_object.exe_check = FALSE;
        self.data_object.rar_check1 = FALSE;
        self.data_object.zip_check = FALSE;
        self.data_object.ddl_check = FALSE;

    
    }else if ([selCell tag]== 1){
    
        // file ext
        self.data_object.exe_check = TRUE;
        self.data_object.rar_check1 = FALSE;
        self.data_object.zip_check = FALSE;
        self.data_object.ddl_check = FALSE;

    
    }else
        if ([selCell tag]== 2){
        
            // file ext
            self.data_object.exe_check = FALSE;
            self.data_object.rar_check1 = TRUE;
            self.data_object.zip_check = FALSE;
            self.data_object.ddl_check = FALSE;

        
        }else
            if ([selCell tag]== 3){
            
                // file ext
                self.data_object.exe_check = FALSE;
                self.data_object.rar_check1 = FALSE;
                self.data_object.zip_check = TRUE;
                self.data_object.ddl_check = FALSE;

            
            }else if ([selCell tag]== 4){
                
                // file ext
                self.data_object.exe_check = FALSE;
                self.data_object.rar_check1 = FALSE;
                self.data_object.zip_check = FALSE;
                self.data_object.ddl_check = TRUE;
                
                
            }else{//NSLog(@"Error");
            }
    
#ifndef DEBUG
    //NSLog(@"self.data_object.exe_check IS : %@", (self.data_object.exe_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.rar_check1 IS : %@", (self.data_object.rar_check1 == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.zip_check IS : %@", (self.data_object.zip_check == TRUE) ? @"TRUE" : @"FALSE");
    //NSLog(@"self.data_object.ddl_check IS : %@", (self.data_object.ddl_check == TRUE) ? @"TRUE" : @"FALSE");
#endif
    
    

    
}
- (IBAction)linkQuery:(id)sender{

    NSButtonCell *selCell = [sender selectedCell];
    NSLog(@"Selected cell is %ld", (long)[selCell tag]);
    NSLog(@"Selected cell title is %@", (id)[selCell title]);

    if ([selCell tag]== 0){}else if ([selCell tag]== 0){}else
        if ([selCell tag]== 0){}else
            if ([selCell tag]== 0){}else
                if ([selCell tag]== 0){}else
                    if ([selCell tag]== 0){}else
                        if ([selCell tag]== 0){}else
                            if ([selCell tag]== 0){}else
                                if ([selCell tag]== 0){}else
                                    if ([selCell tag]== 0){}else
                                        if ([selCell tag]== 0){}else{//NSLog(@"Error");
                                        }

}




- (void)assembleTypesString{

    self.data_object.types_str = @"";
//Audio
    if (self.data_object.mp3_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".mp3%7C"];
    }
    
    if (self.data_object.wma_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".wma%7C"];
    }
    
    if (self.data_object.ogg_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".ogg%7C"];
    }
//Docs
    if (self.data_object.pdf_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".pdf%7C"];
    }
    
    if (self.data_object.txt_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".txt%7C"];
    }
    
    if (self.data_object.lit_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".lit%7C"];
    }
    
    if (self.data_object.rar_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".rar%7C"];
    }
    
    if (self.data_object.doc_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".doc%7C"];
    }
    
    if (self.data_object.rtf_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".rtf%7C"];
    }
    
    if (self.data_object.pps_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".pps%7C"];
    }
    
    if (self.data_object.chm_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".chm%7C"];
    }
    
    if (self.data_object.zip1_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".zip1%7C"];
    }
    
    if (self.data_object.odt_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".odt%7C"];
    }
   //Video
    if (self.data_object.mpg_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".mpg%7C"];
    }
    
    if (self.data_object.avi_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".avi%7C"];
    }
    
    if (self.data_object.wmv_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".wmv%7C"];
    }
    
    if (self.data_object.divx_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".divx%7C"];
    }
    
    if (self.data_object.flv_check == TRUE) {
        self.data_object.types_str = [self.data_object.types_str stringByAppendingString:@".flv%7C"];
    }
    
  
    
    //Passwords
    
    if (self.data_object.pass_check == TRUE) {
        self.data_object.full_search_str = @"";
    }
    if (self.data_object.pass_text == TRUE) {
        self.data_object.full_search_str = @"";
    }
    if (self.data_object.pass_1 == TRUE) {
        self.data_object.full_search_str = @"http://www.google.com/search?q=intitle%3A%22Index+of%22+passwords+modified";
    }
    if (self.data_object.pass_2 == TRUE) {
        self.data_object.full_search_str = @"http://www.google.com/search?hl=en&q=allinurl%3Aauth_user_file.txt";
    }
    if (self.data_object.pass_3 == TRUE) {
        self.data_object.full_search_str = @"http://www.google.com/search?q=inurl%3Apasslist.txt&btnG=Search";
    }
    
    if (self.data_object.pass_4 == TRUE) {
        self.data_object.full_search_str = @"http://www.google.com/search?q=%22%23+-FrontPage-%22+inurl%3Aservice.pwd";
    }
    
    if (self.data_object.pass_5 == TRUE) {
        self.data_object.full_search_str = @"http://www.google.com/search?q=intitle%3A%22Index+of%22+config.php";
    }
    
    if (self.data_object.pass_6 == TRUE) {
        self.data_object.full_search_str = @"http://www.google.com/search?q=%22http%3A%2F%2F*%3A*%40%22";
    }
    
    
    /*
    if (self.data_object.@@ == TRUE) {
        self.data_object.full_search_str = @"";
    }
    
    if (self.data_object.@@ == TRUE) {
        self.data_object.full_search_str = @"";
    }
    */

    
    
    

    
    
    NSLog(@"assembleTypesString");
    NSLog(@"self.data_object.types_str = %@",self.data_object.types_str);


}



@end
