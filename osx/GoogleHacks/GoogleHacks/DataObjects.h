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

@property (nonatomic, retain) NSMutableString	*search_str;
@property (nonatomic, retain) NSMutableString	*full_search_str;
@property (nonatomic, retain) NSMutableString	*types_str;

// Audio Files
@property (nonatomic, retain) NSArray	*audioArray;
@property (nonatomic, readwrite) NSUInteger	*mp3_check;
@property (nonatomic, readwrite) NSUInteger	*wma_check;
@property (nonatomic, readwrite) NSUInteger	*ogg_check;

// Documents
@property (nonatomic, retain) NSArray	*documentArray;
@property (nonatomic, readwrite) NSUInteger	*pdf_check;
@property (nonatomic, readwrite) NSUInteger	*txt_check;
@property (nonatomic, readwrite) NSUInteger	*lit_check;
@property (nonatomic, readwrite) NSUInteger	*rar_check;
@property (nonatomic, readwrite) NSUInteger	*doc_check;
@property (nonatomic, readwrite) NSUInteger	*rtf_check;
@property (nonatomic, readwrite) NSUInteger	*pps_check;
@property (nonatomic, readwrite) NSUInteger	*chm_check;
@property (nonatomic, readwrite) NSUInteger	*zip1_check;
@property (nonatomic, readwrite) NSUInteger	*odt_check;

// Video
@property (nonatomic, retain) NSArray	*videoArray;
@property (nonatomic, readwrite) NSUInteger	*mpg_check;
@property (nonatomic, readwrite) NSUInteger	*avi_check;
@property (nonatomic, readwrite) NSUInteger	*wmv_check;
@property (nonatomic, readwrite) NSUInteger	*divx_check;
@property (nonatomic, readwrite) NSUInteger	*flv_check;

// Passwords
@property (nonatomic, retain) NSArray			*passWordTitleArray;
@property (nonatomic, readwrite) NSUInteger			*pass_check;
@property (nonatomic, readwrite) NSUInteger			*pass_text;
@property (nonatomic, readwrite) NSUInteger			*pass_1;
@property (nonatomic, readwrite) NSUInteger			*pass_2;
@property (nonatomic, readwrite) NSUInteger			*pass_3;
@property (nonatomic, readwrite) NSUInteger			*pass_4;
@property (nonatomic, readwrite) NSUInteger			*pass_5;
@property (nonatomic, readwrite) NSUInteger			*pass_6;
@property (nonatomic, retain) NSMutableArray	*passWordLinkArray;
@property (nonatomic, readwrite) NSString		*pass_1_str;
@property (nonatomic, readwrite) NSString		*pass_2_str;
@property (nonatomic, readwrite) NSString		*pass_3_str;
@property (nonatomic, readwrite) NSString		*pass_4_str;
@property (nonatomic, readwrite) NSString		*pass_5_str;
@property (nonatomic, readwrite) NSString		*pass_6_str;

@property (nonatomic, readwrite) NSUInteger	*method1_check;
@property (nonatomic, readwrite) NSUInteger	*method2_check;

@property (nonatomic, readwrite) NSUInteger	*link_check;
@property (nonatomic, readwrite) NSUInteger	*addurl_check;
@property (nonatomic, readwrite) NSUInteger	*related_check;
@property (nonatomic, readwrite) NSUInteger	*tools_text;
@property (nonatomic, readwrite) NSUInteger	*StaticText2;
@property (nonatomic, readwrite) NSUInteger	*StaticText3;

@property (nonatomic, readwrite) NSUInteger	*exe_check;
@property (nonatomic, readwrite) NSUInteger	*rar_check1;
@property (nonatomic, readwrite) NSUInteger	*zip_check;
@property (nonatomic, readwrite) NSUInteger	*ddl_check;

@property (nonatomic, readwrite) NSUInteger	*StaticText4;
@property (nonatomic, readwrite) NSUInteger	*StaticText5;
@property (nonatomic, readwrite) NSUInteger	*StaticText6;
@property (nonatomic, readwrite) NSUInteger	*StaticText7;

- (id)loadValues:(NSObject *)object;

+ (void)initialize;

@end
