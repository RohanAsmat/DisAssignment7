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

@implementation MainWindowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (IBAction)choseLanguage:(id)sender {
    NSButtonCell *selCell = [sender selectedCell];
    NSLog(@"Selected cell is %d", [selCell tag]);
}
@end
