//
//  DataObjects.h
//  GoogleHacks
//
//  Created by Randy McMillan on 7/9/15.
//  Copyright (c) 2015 Randy McMillan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataObjects : NSObject

//Search String
@property (nonatomic, retain) NSString *search_str;
@property (nonatomic, retain) NSString *full_search_str;
@property (nonatomic, retain) NSString *types_str;

//Audio Files
@property (nonatomic, readwrite) BOOL *mp3_check;
@property (nonatomic, readwrite) BOOL *wma_check;
@property (nonatomic, readwrite) BOOL *ogg_check;

//Documents
@property (nonatomic, readwrite) BOOL *pdf_check;
@property (nonatomic, readwrite) BOOL *txt_check;
@property (nonatomic, readwrite) BOOL *lit_check;
@property (nonatomic, readwrite) BOOL *rar_check;
@property (nonatomic, readwrite) BOOL *doc_check;
@property (nonatomic, readwrite) BOOL *rtf_check;
@property (nonatomic, readwrite) BOOL *pps_check;
@property (nonatomic, readwrite) BOOL *chm_check;
@property (nonatomic, readwrite) BOOL *zip1_check;
@property (nonatomic, readwrite) BOOL *odt_check;

//Video
@property (nonatomic, readwrite) BOOL *mpg_check;
@property (nonatomic, readwrite) BOOL *avi_check;
@property (nonatomic, readwrite) BOOL *wmv_check;
@property (nonatomic, readwrite) BOOL *divx_check;
@property (nonatomic, readwrite) BOOL *flv_check;

//Passwords
@property (nonatomic, readwrite) BOOL *pass_check;
@property (nonatomic, readwrite) BOOL *pass_text;
@property (nonatomic, readwrite) BOOL *pass_1;
@property (nonatomic, readwrite) BOOL *pass_2;
@property (nonatomic, readwrite) BOOL *pass_3;
@property (nonatomic, readwrite) BOOL *pass_4;
@property (nonatomic, readwrite) BOOL *pass_5;
@property (nonatomic, readwrite) BOOL *pass_6;


@property (nonatomic, readwrite) BOOL *method1_check;
@property (nonatomic, readwrite) BOOL *method2_check;

@property (nonatomic, readwrite) BOOL *link_check;
@property (nonatomic, readwrite) BOOL *addurl_check;
@property (nonatomic, readwrite) BOOL *related_check;
@property (nonatomic, readwrite) BOOL *tools_text;
@property (nonatomic, readwrite) BOOL *StaticText2;
@property (nonatomic, readwrite) BOOL *StaticText3;


@property (nonatomic, readwrite) BOOL *exe_check;
@property (nonatomic, readwrite) BOOL *rar_check1;
@property (nonatomic, readwrite) BOOL *zip_check;
@property (nonatomic, readwrite) BOOL *ddl_check;

@property (nonatomic, readwrite) BOOL *StaticText4;
@property (nonatomic, readwrite) BOOL *StaticText5;
@property (nonatomic, readwrite) BOOL *StaticText6;
@property (nonatomic, readwrite) BOOL *StaticText7;



/*
 
 
 //Search String
 NSString *search_str = @"Search String";
 NSString *full_search_str = @"Full Search String";
 NSString *types_str = @"";
 
 //Audio Files
 BOOL mp3_check = FALSE;
 BOOL wma_check = FALSE;
 BOOL ogg_check = FALSE;
 
 //Documents
 BOOL pdf_check = FALSE;
 BOOL txt_check = FALSE;
 BOOL lit_check = FALSE;
 BOOL rar_check = FALSE;
 BOOL doc_check = FALSE;
 BOOL rtf_check = FALSE;
 BOOL pps_check = FALSE;
 BOOL chm_check = FALSE;
 BOOL zip1_check = FALSE;
 BOOL odt_check = FALSE;
 
 //Video
 BOOL mpg_check = FALSE;
 BOOL avi_check = FALSE;
 BOOL wmv_check = FALSE;
 BOOL divx_check = FALSE;
 BOOL flv_check = FALSE;
 
 //Passwords
 BOOL pass_check = FALSE;
 BOOL pass_text = FALSE;
 
 BOOL pass_1 = FALSE;
 BOOL pass_5 = FALSE;
 BOOL pass_2 = FALSE;
 BOOL pass_6 = FALSE;
 BOOL pass_3 = FALSE;
 BOOL pass_4 = FALSE;
 
 //Methods
 BOOL method1_check = FALSE;
 BOOL method2_check = FALSE;
 
 //Links
 BOOL link_check = FALSE;
 BOOL addurl_check = FALSE;
 BOOL related_check = FALSE;
 BOOL tools_text = FALSE;
 BOOL StaticText2 = FALSE;
 BOOL StaticText3 = FALSE;
 
 // archives
 BOOL exe_check = FALSE;
 BOOL rar_check1 = FALSE;
 BOOL zip_check = FALSE;
 BOOL ddl_check = FALSE;
 
 // text
 BOOL StaticText4 = FALSE;
 BOOL StaticText5 = FALSE;
 BOOL StaticText6 = FALSE;
 BOOL StaticText7 = FALSE;

 
 */
@end
