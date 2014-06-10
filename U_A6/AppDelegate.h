//
//  AppDelegate.h
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "MainWindowViewController.h"
#include "EditViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSWindow *editWindow;



@end
