//
//  MainWindowViewController.m
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import "MainWindowViewController.h"
#import "Translation.h"

@implementation MainWindowViewController

@synthesize languages;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }

    return self;
}

- (void)refreshView {
    // get the languages
    languages = (NSMutableArray *) [self fetchObjectsForEntityName:@"Translation"];

    // createRadioButtons
    [self createRadioButtons];

    // set default value on text box
    NSString *def = [self getTranslationFromLanguages: [[self.RadioGroupLanguage selectedCell] title]];
    [[self displayLanguage] setStringValue: (def != nil)?def:@""];
}

// create radio buttons by looping through languages
- (void) createRadioButtons {
    NSArray *cells = [self.RadioGroupLanguage cells];

    // refill the radio group
    for(NSUInteger i = 0; i < languages.count; i++){
        Translation *translation = languages[i];

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
    [[self displayLanguage] setStringValue: [self getTranslationFromLanguages: selCell.title]];
}

// get the good morning translation, for loop array and test
- (NSString *)getTranslationFromLanguages:(NSString *)languageName{
    // get the good morning translation, for loop array and test
    for(Translation *translation in languages){
        if(translation.language == languageName){
            return translation.text;
        }
    }

    return nil;
}

// get the data
- (NSArray *)fetchObjectsForEntityName:(NSString *)entityName
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];

    NSError *error;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        // Handle the error.
        return nil;
    }

    return fetchedObjects;
}

- (void)onBeforeAddObject:(id)object {
    //NSLog(@"akkefwf");
}

- (void)onEditObject:(id)value forKey:(NSString *)key {
    [self refreshView];
}

- (void)onRemoveObject:(id)object {
    [self refreshView];
}


@end
