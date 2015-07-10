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


@implementation ViewController

@synthesize data_object;
@synthesize searchField;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Presenting ViewController";
    [self.data_object init];

    
    //Search String
    self.data_object.search_str = @"Search String";
   // self.searchField. = self.data_object.search_str;

    
    self.data_object.full_search_str = @"Full Search String";
    self.data_object .types_str = @"";
    
    //Audio Files
    self.data_object.mp3_check = FALSE;
    self.data_object.wma_check = FALSE;
    self.data_object.ogg_check = FALSE;
    
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
    
    //Video
    self.data_object.mpg_check = FALSE;
    self.data_object.avi_check = FALSE;
    self.data_object.wmv_check = FALSE;
    self.data_object.divx_check = FALSE;
    self.data_object.flv_check = FALSE;
    
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
    

    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
    


}

- (void)getSearchField:(id)sender {


    NSLog(@"getSearchField");
    
}


@end
