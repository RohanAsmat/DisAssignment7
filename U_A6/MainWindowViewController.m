//
//  MainWindowViewController.m
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import "MainWindowViewController.h"
#import "CPlist.h"

@interface MainWindowViewController ()

@end

@implementation MainWindowViewController{
    NSMutableDictionary* languages;
    CPlist* languagePlist;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.

        // load languages plist
        languagePlist = [CPlist plistWithPListName:@"languages"];
        // setup languages from the dictionary
        languages = [languagePlist GetDataDictionary:@"languages"];

        // uncomment to use hardcoded languages
        //languages = [[NSMutableDictionary alloc] init];
        //[self setupLanguages];
    }

    return self;
}

- (void)loadView {
    [super loadView];

    [self createRadioButtons];
    
    [[self displayLanguage] setStringValue: languages[[[self.RadioGroupLanguage selectedCell] title]]];
}

// call this to accumulate hardcoded language
- (void) setupLanguages{
    [languages setObject:@"Good morning" forKey:@"English"];
    [languages setObject:@"Buenos dias" forKey:@"Spanish"];
    [languages setObject:@"Guten morgen" forKey:@"German"];
    [languages setObject:@"Bonjour" forKey:@"French"];
}

// create radio buttons by looping through languages
- (void) createRadioButtons {
    NSArray *cells = [self.RadioGroupLanguage cells];
    NSUInteger i = 0;
    
    for(NSString * key in languages){
        if(i > 0)
            [self.RadioGroupLanguage addRow];
        
        [cells[i] setTitle:key];
        i++;
    }
}

// language radio button on press handler.
- (IBAction)choseLanguage:(id)sender {
    NSButtonCell *selCell = [sender selectedCell];

    // set the display text (translated version) on the text box
    [[self displayLanguage] setStringValue: languages[selCell.title]];
}
@end
