//
//  MainWindowViewController.h
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import <Cocoa/Cocoa.h> 

@interface MainWindowViewController : NSViewController

@property (weak) IBOutlet NSTextField *displayLanguage;
@property (weak) IBOutlet NSMatrix *RadioGroupLanguage;
@property NSManagedObjectContext* managedObjectContext;

- (void)refreshView;

- (IBAction)choseLanguage:(id)sender;

@end
