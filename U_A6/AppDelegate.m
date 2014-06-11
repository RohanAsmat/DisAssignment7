//
//  AppDelegate.m
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate()
@property (nonatomic,strong) IBOutlet MainWindowViewController *mainWindowViewController;
@property (nonatomic,strong) IBOutlet EditViewController *editViewController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    // 1. Create the mainWindow View Controller
    self.mainWindowViewController = [[MainWindowViewController alloc] initWithNibName:@"MainWindowViewController" bundle:nil];
    // 1. Create the editWindow View Controller
    self.editViewController = [[EditViewController alloc] initWithNibName:@"EditViewController" bundle:nil];
    
    // 2. Add the mainview controller to the Window's content view
    [self.window.contentView addSubview:self.mainWindowViewController.view];
    self.mainWindowViewController.view.frame = ((NSView*)self.window.contentView).bounds;
    
    // 2. Add the windowview controller to the Window's content view
    [self.editWindow.contentView addSubview:self.editViewController.view];
    self.editViewController.view.frame = ((NSView*)self.editWindow.contentView).bounds;

    // set the delegate after edit
    self.editViewController.delegate = self.mainWindowViewController;
}

@end
