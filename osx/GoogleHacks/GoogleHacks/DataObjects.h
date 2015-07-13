//
//  DataObjects.h
//  GoogleHacks
//
//  Created by Randy McMillan on 7/9/15.
//  Copyright (c) 2015 Randy McMillan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataObjects : NSObject

// Search String

@property (nonatomic, retain) NSString	*search_str;
@property (nonatomic, retain) NSString	*full_search_str;
@property (nonatomic, retain) NSString	*types_str;

// Audio Files
@property (nonatomic,retain) NSArray *audioArray;
@property (nonatomic, readwrite) BOOL	*mp3_check;
@property (nonatomic, readwrite) BOOL	*wma_check;
@property (nonatomic, readwrite) BOOL	*ogg_check;

// Documents
@property (nonatomic,retain) NSArray *documentArray;
@property (nonatomic, readwrite) BOOL	*pdf_check;
@property (nonatomic, readwrite) BOOL	*txt_check;
@property (nonatomic, readwrite) BOOL	*lit_check;
@property (nonatomic, readwrite) BOOL	*rar_check;
@property (nonatomic, readwrite) BOOL	*doc_check;
@property (nonatomic, readwrite) BOOL	*rtf_check;
@property (nonatomic, readwrite) BOOL	*pps_check;
@property (nonatomic, readwrite) BOOL	*chm_check;
@property (nonatomic, readwrite) BOOL	*zip1_check;
@property (nonatomic, readwrite) BOOL	*odt_check;

// Video
@property (nonatomic,retain) NSArray *videoArray;
@property (nonatomic, readwrite) BOOL	*mpg_check;
@property (nonatomic, readwrite) BOOL	*avi_check;
@property (nonatomic, readwrite) BOOL	*wmv_check;
@property (nonatomic, readwrite) BOOL	*divx_check;
@property (nonatomic, readwrite) BOOL	*flv_check;

// Passwords
@property (nonatomic,retain) NSArray *passWordArray;
@property (nonatomic, readwrite) BOOL	*pass_check;
@property (nonatomic, readwrite) BOOL	*pass_text;
@property (nonatomic, readwrite) BOOL	*pass_1;
@property (nonatomic, readwrite) BOOL	*pass_2;
@property (nonatomic, readwrite) BOOL	*pass_3;
@property (nonatomic, readwrite) BOOL	*pass_4;
@property (nonatomic, readwrite) BOOL	*pass_5;
@property (nonatomic, readwrite) BOOL	*pass_6;
@property (nonatomic,retain) NSArray *passWordLinkArray;
@property (nonatomic, readwrite) NSURL	*pass_1_str;
@property (nonatomic, readwrite) NSURL	*pass_2_str;
@property (nonatomic, readwrite) NSURL	*pass_3_str;
@property (nonatomic, readwrite) NSURL	*pass_4_str;
@property (nonatomic, readwrite) NSURL	*pass_5_str;
@property (nonatomic, readwrite) NSURL	*pass_6_str;

@property (nonatomic, readwrite) BOOL	*method1_check;
@property (nonatomic, readwrite) BOOL	*method2_check;

@property (nonatomic, readwrite) BOOL	*link_check;
@property (nonatomic, readwrite) BOOL	*addurl_check;
@property (nonatomic, readwrite) BOOL	*related_check;
@property (nonatomic, readwrite) BOOL	*tools_text;
@property (nonatomic, readwrite) BOOL	*StaticText2;
@property (nonatomic, readwrite) BOOL	*StaticText3;

@property (nonatomic, readwrite) BOOL	*exe_check;
@property (nonatomic, readwrite) BOOL	*rar_check1;
@property (nonatomic, readwrite) BOOL	*zip_check;
@property (nonatomic, readwrite) BOOL	*ddl_check;

@property (nonatomic, readwrite) BOOL	*StaticText4;
@property (nonatomic, readwrite) BOOL	*StaticText5;
@property (nonatomic, readwrite) BOOL	*StaticText6;
@property (nonatomic, readwrite) BOOL	*StaticText7;


- (id)loadValues:(NSObject *)object;

+ (void)initialize;

@end
