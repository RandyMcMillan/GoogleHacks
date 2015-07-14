//
//  ReturnSearchString.h
//  GoogleHacks
//
//  Created by Randy McMillan on 7/13/15.
//  Copyright (c) 2015 Randy McMillan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataObjects.h"

@interface ReturnSearchString : NSObject

- (void)assembleTypesString;

- (NSMutableString *)returnSearchString:(NSMutableString *)mutableString;
- (NSMutableArray *)returnPasswordLinkArray:(NSMutableArray *)mutableArray;
- (NSString *)truncateString:(NSString *)string toCharacterCount:(NSUInteger)count;

- (void)loadDataObject;

// DataObjects
- (NSString *)parseAudioExts:(NSString *)string;
- (NSString *)parseVideoExts:(NSString *)string;

- (NSString *)parseDocumentExts:(NSString *)string;

- (NSString *)parsePassWordStrings:(NSString *)string;

// link//add url//related//tools
- (NSString *)parseMethods:(NSString *)string;

- (NSString *)parseFileExts:(NSString *)string;

@property (nonatomic, readwrite) DataObjects *data_object;

@end
