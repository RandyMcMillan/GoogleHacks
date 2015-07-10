//
//  DataObjects.m
//  GoogleHacks
//
//  Created by Randy McMillan on 7/9/15.
//  Copyright (c) 2015 Randy McMillan. All rights reserved.
//

#import "DataObjects.h"
#include "Constants.h"


//https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Strings/Articles/CreatingStrings.html#//apple_ref/doc/uid/20000148-CJBCJHHI


@implementation DataObjects 

 //Search String
 @synthesize search_str;
 @synthesize full_search_str;
 @synthesize types_str;
 
 //Audio Files
 @synthesize mp3_check;
 @synthesize wma_check;
 @synthesize ogg_check;
 
 //Documents
 @synthesize pdf_check;
 @synthesize txt_check;
 @synthesize lit_check;
 @synthesize rar_check;
 @synthesize doc_check;
 @synthesize rtf_check;
 @synthesize pps_check;
 @synthesize chm_check;
 @synthesize zip1_check;
 @synthesize odt_check;
 
 //Video
 @synthesize mpg_check;
 @synthesize avi_check;
 @synthesize wmv_check;
 @synthesize divx_check;
 @synthesize flv_check;
 
 //Passwords
 @synthesize pass_check;
 @synthesize pass_text;
 
 @synthesize pass_1;
 @synthesize pass_5;
 @synthesize pass_2;
 @synthesize pass_6;
 @synthesize pass_3;
 @synthesize pass_4;
 
 //Methods
 @synthesize method1_check;
 @synthesize method2_check;
 
 //Links
 @synthesize link_check;
 @synthesize addurl_check;
 @synthesize related_check;
 @synthesize tools_text;
 @synthesize StaticText2;
 @synthesize StaticText3;
 
 // archives
 @synthesize exe_check;
 @synthesize rar_check1;
 @synthesize zip_check;
 @synthesize ddl_check;
 
 // text
 @synthesize StaticText4;
 @synthesize StaticText5;
 @synthesize StaticText6;
 @synthesize StaticText7;
    


- (id) loadValues:(NSObject *)object
{

     //self.avi_check = FALSE;
     //Search String
     self.search_str = @"http://google.com";
     self.full_search_str = @"http://google.com";
     self.types_str = @"";
     
     //Audio Files
     self.mp3_check = FALSE;
     self.wma_check = FALSE;
     self.ogg_check = FALSE;
     
     //Documents
     self.pdf_check = FALSE;
     self.txt_check = FALSE;
     self.lit_check = FALSE;
     self.rar_check = FALSE;
     self.doc_check = FALSE;
     self.rtf_check = FALSE;
     self.pps_check = FALSE;
     self.chm_check = FALSE;
     self.zip1_check = FALSE;
     self.odt_check = FALSE;
     
     //Video
     self.mpg_check = FALSE;
     self.avi_check = FALSE;
     self.wmv_check = FALSE;
     self.divx_check = FALSE;
     self.flv_check = FALSE;
     
     //Passwords
     self.pass_check = FALSE;
     self.pass_text = FALSE;
     
     self.pass_1 = FALSE;
     self.pass_5 = FALSE;
     self.pass_2 = FALSE;
     self.pass_6 = FALSE;
     self.pass_3 = FALSE;
     self.pass_4 = FALSE;
     
     //Methods
     self.method1_check = FALSE;
     self.method2_check = FALSE;
     
     //Links
     self.link_check = FALSE;
     self.addurl_check = FALSE;
     self.related_check = FALSE;
     self.tools_text = FALSE;
     self.StaticText2 = FALSE;
     self.StaticText3 = FALSE;
     
     // archives
     self.exe_check = FALSE;
     self.rar_check1 = FALSE;
     self.zip_check = FALSE;
     self.ddl_check = FALSE;
     
     // text
     self.StaticText4 = FALSE;
     self.StaticText5 = FALSE;
     self.StaticText6 = FALSE;
     self.StaticText7 = FALSE;
     
    NSLog(@"DataObject init");
    return NO;

}

+ (void)initialize {

    NSLog(@"DataObjects initialize");
   //[self init];
    
}


@end
