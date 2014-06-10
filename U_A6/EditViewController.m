//
//  EditViewController.m
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import "EditViewController.h"
#import "Translation.h"

@interface EditViewController ()

@end

@implementation EditViewController{
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        self.languages = [[NSMutableArray alloc] init];
    }

    return self;
}

/** uncomment to setup fake data
- (void)loadView {
    [super loadView];

    NSString *newLang = [NSString stringWithFormat:@"country- %tu", self.languages.count];
    Translation *lang = [Translation translationWithLanguage:newLang text:@"good morning"];

    // add language to row
    [self.languages addObject: lang];


     newLang = [NSString stringWithFormat:@"country- %tu", self.languages.count];
     lang = [Translation translationWithLanguage:newLang text:@"good morning"];

    // add language to row
    [self.languages addObject: lang];
}
*/

- (id)tableView:(NSTableView *)tableView
        objectValueForTableColumn:(NSTableColumn *)tableColumn
        row:(NSInteger)row {
    
    Translation *o = [self.languages objectAtIndex: row];
    NSString *languageAsKey = [tableColumn identifier];

    return [o valueForKey:languageAsKey];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.languages.count;
}

-(IBAction) addLanguage:(id)sender{
    //set up the new language
    NSString *newLang = [NSString stringWithFormat:@"country- %tu", self.languages.count];
    Translation *lang = [Translation translationWithLanguage:newLang text:@"good morning"];

    // add language to row
    [self.languages addObject: lang];

    // reload the view
    [self.tableView reloadData];
}

-(IBAction) removeLanguage:(id)sender{
    // remove language to row
    NSInteger row = [self.tableView selectedRow];
    if(row != -1){
        [self.languages removeObjectAtIndex:(NSUInteger) row];
        [self.tableView reloadData];
    }
}

@end
