//
//  EditViewController.m
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}
- (void) awakeFromNib {
    
    [self.tableView setDataSource:self];
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 4;
}
- (id)          tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)column
                      row:(NSInteger)rowIndex {
    
//    if ((workersTable == nil) || ([[column identifier] length] == 0))
//        return nil;
//    
//    DADataTableRow *row = [[workersTable rows] objectAtIndex:rowIndex];
//    return [row valueForKey:[column identifier]];
//    
    return 3 % 3 ? @"Tick..." : @"BOOM!";  // fill this out

}


- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSLog(@"rohan");
    // Get a new ViewCell
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    cellView.textField.stringValue = @"rohan" ;
    // Since this is a single-column table view, this would not be necessary.
    // But it's a good practice to do it in order by remember it when a table is multicolumn.
    if( [tableColumn.identifier isEqualToString:@"Language"] )
    {
        //ScaryBugDoc *bugDoc = [self.bugs objectAtIndex:row];
        //cellView.imageView.image = bugDoc.thumbImage;
        //cellView.textField.stringValue = bugDoc.data.title;
        cellView.textField.stringValue = @"rohan";

        return cellView;
    }
    
    if( [tableColumn.identifier isEqualToString:@"Text"] )
    {
        //ScaryBugDoc *bugDoc = [self.bugs objectAtIndex:row];
        //cellView.imageView.image = bugDoc.thumbImage;
        //cellView.textField.stringValue = bugDoc.data.title;
        cellView.textField.stringValue = @"rohan";
        
        return cellView;
    }
    
    
    return cellView;
}




@end
