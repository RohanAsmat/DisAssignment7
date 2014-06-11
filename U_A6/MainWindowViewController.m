//
//  MainWindowViewController.m
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import "MainWindowViewController.h"
#import "LanguagesInstance.h"

@interface MainWindowViewController ()

@end

@implementation MainWindowViewController{
    NSMutableArray* languages;
    LanguagesInstance* lang;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        lang = LanguagesInstance.Instance;
    }

    return self;
}

- (void)onAfterAdd:(NSMutableArray *)aLanguages {
    languages = aLanguages;

    // reset the radio groups
    [self createRadioButtons];
}

- (void)onAfterEdit:(NSMutableArray *)aLanguages {
    languages = aLanguages;

    // reset the radio groups
    [self createRadioButtons];
}

- (void)loadView {
    [super loadView];

    // get the languages
    languages = [lang getLanguages];

    // createRadioButtons
    [self createRadioButtons];

    // set default value on text box
    NSString *def = [lang getTranslationFromLanguages: [[self.RadioGroupLanguage selectedCell] title]];
    [[self displayLanguage] setStringValue: (def != nil)?def:@""];
}


// create radio buttons by looping through languages
- (void) createRadioButtons {
    NSArray *cells = [self.RadioGroupLanguage cells];
 

    // refill the radio group
    for(NSUInteger i = 0; i < languages.count; i++){
        Lang *translation = languages[i];

        if(i > 0) {
            @try {
                [self.RadioGroupLanguage removeRow:i];
            }
            @catch (id exception){
                NSLog(@"");
            }

            [self.RadioGroupLanguage addRow];
        }
        
        [cells[i] setTitle:translation.language];
    }
}

// language radio button on press handler.
- (IBAction)choseLanguage:(id)sender {
    // selected cell
    NSButtonCell *selCell = [sender selectedCell];

    // set the display text (translated version) on the text box
    [[self displayLanguage] setStringValue: [lang getTranslationFromLanguages: selCell.title]];
}
@end
