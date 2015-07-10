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


#define BASE_URL                 @ "http://www.google.com"


