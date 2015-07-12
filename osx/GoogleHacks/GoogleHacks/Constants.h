//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//
//



#define BARBUTTON(TITLE, SELECTOR) [[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]
#define MINIMUM_SCALE 1.0f
#define MAXIMUM_SCALE 4.0f
#define ZOOM_STEP 1.5


#define kLeftMargin                 20.0
#define kTopMargin                  20.0
#define kRightMargin                20.0
#define kTweenMargin                6.0

#define kAppFirstConstant            30.0

#define KEY_COUNT                   44

#define VIEWBOUNDS                  [[UIScreen mainScreen] bounds]

#ifndef IS_IPAD
#define IS_IPAD                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#endif


#define TWITTER_URL                 @ "http://api.twitter.com/1/"


#define MOST_BASIC_URL @"https://www.google.com/search?q=-inurl:(htm%7Chtml%7Cphp)+intitle:%22index+of%22+%2B%22last+modified%22+%2B%22parent+directory%22+%2Bdescription+%2Bsize+%2B(%22+.m4v+%7C+.avi+%7C+.wmv+%7C+.flv+%7C+.jpg+%7C+.nzb%22)+%22%22+yay++%22%22&ie=UTF-8&oe=UTF-8"


#define Q_EQUALS
#define BASE_URL                 @ "https://www.google.com/search?"


