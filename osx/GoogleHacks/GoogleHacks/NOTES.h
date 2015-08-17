//
//  NOTES.h
//  googlehacks
//
//  Created by Randy McMillan on 7/12/15.
//  Copyright (c) 2015 Randy McMillan. All rights reserved.
//

#ifndef googlehacks_NOTES_h
#define googlehacks_NOTES_h

/*
https://www.google.com/search?q=intitle:%22index%20of%22%20intext:%22.ds_store%22&gws_rd=ssl 
 
 https://www.exploit-db.com/ghdb/3914/
 
 
 
https://www.exploit-db.com/google-hacking-database/
 
 https://www.exploit-db.com/ghdb/550/
 
 https://www.exploit-db.com/ghdb/4033/
 
http://123to100.blogspot.com/2009/02/google-hacking-code.html 
https://github.com/search?utf8=✓&q=applescripts+safari&type=Repositories&ref=searchresults
 
 https://github.com/abbeycode/AppleScripts/blob/master/Scripts/Applications/Safari/Open%20in%20Chrome.applescript
 
 https://github.com/abbeycode/AppleScripts/blob/master/Scripts/Libraries/Safari.applescript
 
 https://github.com/ramkam/safari_to_pdf
 
 https://github.com/gallybattat/open-safari-url-in-google-chrome
 

 
 http://hints.macworld.com/article.php?story=20051107093733174
 
 
https://github.com/samowitsch/url-browser 
 
 https://github.com/samowitsch/url-browser
 *
 *
 * // http://stackoverflow.com/questions/2503372/how-to-close-all-or-only-some-tabs-in-safari-using-applescript
   // http://stackoverflow.com/questions/4909702/run-applescript-from-cocoa-application
 
 NSString* path = [[NSBundle mainBundle] pathForResource:@"ScriptName" ofType:@"scpt"];
 NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
 NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
 [appleScript executeAndReturnError:nil];
 [appleScript release];

 
 //NS MAtrix https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSMatrix_Class/index.html#//apple_ref/occ/instm/NSMatrix/setState:atRow:column:
 
 
 
 
 *    // https://support.google.com/websearch/answer/2466433?hl=en
 *    // http://www.google.com/translate?hl=&sl=en&tl=en&u=%20randymcmillan.net&sandbox=1
 *    // http://www.google.com/translate?hl=&sl=da&tl=de&u=%20randymcmillan.net&sandbox=1
 *    // http://www.google.com/gwt/n?u=http%3A%2F%2Frandymcmillan.net
 *    // http://www.google.com/search?q=site%3A
 *    // http://www.google.com/addurl?q="+ search_str +"&hl=en&dqq=
 *    // http://www.google.com/search?q=related%3Arandy+mcmillan
 *    // http://www.google.com/search?q=view%3Amap+
 *    // https://maps.google.com/
 *    // https://www.google.com/maps/@37.0625,-95.677068,4z
 *    // Do any additional setup after loading the view.
 *
 // http://en.osdn.jp/projects/sfnet_ghh/
 
 // https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Strings/Articles/CreatingStrings.html#//apple_ref/doc/uid/20000148-CJBCJHHI*
 *
 *   // full_search_str ="http://www.google.com/search?hl=en&q=-inurl%3A%28htm%7Chtml%7Cphp%29+intitle%3A%22index+of%22+%2B%22last+modified%22+%2B%22parent+directory%22+%2Bdescription+%2Bsize+%2B%28" +types+ "%29+%22"+search_str+"%22"
 *
 *   // http://stackoverflow.com/questions/16704156/how-to-open-external-links-to-safari-chrome-browser-in-cocoa
 *    // http://theocacao.com/document.page/183
 *    // TODO handle white spaces
 *    // http://stackoverflow.com/questions/7628470/remove-all-whitespaces-from-nsstring
 *    // [self.data_object.full_search_str  stringByReplacingOccurrencesOfString:@" " withString:@"+"];
 *    // http://stackoverflow.com/questions/3439853/replace-occurances-of-space-in-url
 *    // strip spaces from user before direct manipulation
 *    // tle%3A%22index+of%22+%2B%22last+modified%22+%2B%22parent+directory%22+%2Bdescription+%2Bsize+%2B%28" +types+ "%29+%22"+search_str+"%22"
 *
 *    // self.data_object.full_search_str = [BASE_URL stringByAppendingString:self.data_object.search_str];
 *
 *
 *   // TODO open in tor
 *   // org.mozilla.tor browser
 *
 *   // http://zachwaugh.me/posts/opening-links-in-background-with-cocoa/
 *
 *   // Opens a URL in the default browser in background or foreground
 *
 *
 *   // https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Button/Articles/QueryMatrixButtons.html
 *
 *    // http://rypress.com/tutorials/objective-c/data-types/nsarray    // With fast-enumeration
 *    //		[[NSWorkspace sharedWorkspace] openURLs:urls withAppBundleIdentifier:nil options:NSWorkspaceLaunchWithoutActivation additionalEventParamDescriptor:nil launchIdentifiers:nil];
 *
 *
 *   //NSMustableString
 *   https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSMutableString_Class/index.html#//apple_ref/occ/cl/NSMutableString
 *
 * NSLog(@"%@", NSStringFromSelector(_cmd))
 */

#endif
