//
//  EditViewController.h
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface EditViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>

@property IBOutlet NSTableView *tableView;
@property NSMutableArray *languages;

-(IBAction) addLanguage:(id)sender;
-(IBAction) removeLanguage:(id)sender;

@end
