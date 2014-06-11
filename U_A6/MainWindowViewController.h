//
//  MainWindowViewController.h
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "EditViewController.h"

@interface MainWindowViewController : NSViewController <LanguageManipulationDelegate>

@property (weak) IBOutlet NSTextField *displayLanguage;
@property (weak) IBOutlet NSMatrix *RadioGroupLanguage;

- (IBAction)choseLanguage:(id)sender;

@end
