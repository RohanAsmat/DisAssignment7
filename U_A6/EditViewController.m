//
//  EditViewController.m
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import "EditViewController.h"
#import "LanguagesInstance.h"

@interface EditViewController ()

@end

@implementation EditViewController{
    LanguagesInstance* lang;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        lang = LanguagesInstance.Instance;
        self.languages = [[NSMutableArray alloc] init];
    }

    return self;
}

- (void)loadView {
    [super loadView];

    // fill in the languages
    self.languages = [lang getLanguages];
}


- (id)tableView:(NSTableView *)tableView
        objectValueForTableColumn:(NSTableColumn *)tableColumn
        row:(NSInteger)row {
    
    Translation *o = [self.languages objectAtIndex: row];
    NSString *languageAsKey = [tableColumn identifier];

    return [o valueForKey:languageAsKey];
}

- (void)tableView:(NSTableView *)tableView
   setObjectValue:(id)object
   forTableColumn:(NSTableColumn *)tableColumn
              row:(NSInteger)row {

    Translation *p = [self.languages objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    [p setValue:object forKey:identifier];

    if(self.delegate != nil){
        [self.delegate onAfterEdit:self.languages];
    }
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.languages.count;
}

-(IBAction) addLanguage:(id)sender{
    //set up the new language
    NSString *newLang = [NSString stringWithFormat:@"country- %tu", self.languages.count];
    Translation *lg = [Translation translationWithLanguage:newLang text:@"good morning"];

    // add language to row
    [self.languages addObject: lg];

    // reload the view
    [self.tableView reloadData];
    
    if(self.delegate != nil){
        [self.delegate onAfterAdd:self.languages];
    }
}

-(IBAction) removeLanguage:(id)sender{
    // remove language to row
    NSInteger row = [self.tableView selectedRow];
    if(row != -1){
        [self.languages removeObjectAtIndex:(NSUInteger) row];
        [self.tableView reloadData];
        
        if(self.delegate != nil){
            [self.delegate onAfterEdit:self.languages];
        }
    }
}

@end
