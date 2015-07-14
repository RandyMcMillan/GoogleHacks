//
//  AppDelegate.h
//  GoogleHacks
//
//  Created by Randy McMillan on 7/9/15.
//  Copyright (c) 2015 Randy McMillan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator	*persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel			*managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext			*managedObjectContext;

@end
