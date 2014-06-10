//
//  MainWindowViewController.m
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import "MainWindowViewController.h"

@interface MainWindowViewController ()

@end

@implementation MainWindowViewController{
    NSMutableDictionary* languages;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        languages = [[NSMutableDictionary alloc] init];
        [self setupLanguages];
    }

    return self;
}

- (void)loadView {
    [super loadView];

    [self createRadioButtons];
    
    [[self displayLanguage] setStringValue: languages[[[self.RadioGroupLanguage selectedCell] title]]];
}


- (void) setupLanguages{
    [languages setObject:@"Good morning" forKey:@"English"];
    [languages setObject:@"Buenos dias" forKey:@"Spanish"];
    [languages setObject:@"Guten morgen" forKey:@"German"];
    [languages setObject:@"Bonjour" forKey:@"French"];
}

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

- (IBAction)choseLanguage:(id)sender {
    NSButtonCell *selCell = [sender selectedCell];
    [[self displayLanguage] setStringValue: languages[selCell.title]];

    //NSLog(@"Selected cell is %d", (int) [selCell tag]);
}
@end
