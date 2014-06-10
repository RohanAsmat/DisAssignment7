//
//  CPlist.m 
//

#import "CPlist.h"

@implementation CPlist

- (instancetype)initWithPListName:(NSString *)aPListName {
    self = [super init];
    if (self) {
        pListName = aPListName;
        [self openPList];
    }

    return self;
}

-(void) openPList{
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    pListPath = [documentsDirectory stringByAppendingPathComponent:pListName];

    NSFileManager *fileManager = [NSFileManager defaultManager];

    if (![fileManager fileExistsAtPath: pListPath])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:pListName ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath: pListPath error:&error];
    }
}

+ (instancetype)plistWithPListName:(NSString *)aPListName {
    return [[self alloc] initWithPListName:aPListName];
}

-(NSMutableArray*) GetDataArray:(NSString *)key{
    NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:pListPath];
    NSMutableArray* result = [dict objectForKey:key];
    
    return result;
}

-(NSMutableDictionary*) GetDataDictionary:(NSString *)key{
    NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:pListPath];
    NSMutableDictionary* result = [dict objectForKey:key];

    return result;
}

-(NSString*) GetDataString:(NSString *)key{
    NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:pListPath];
    NSString* result = [dict objectForKey:key];

    return result;
}

-(NSNumber*) GetDataNumber:(NSString *)key{
    NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:pListPath];
    NSNumber* result = [dict objectForKey:key];

    return result;
}

-(void) Save : (NSString *)key values:(NSMutableArray*) values{
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: pListPath];
    [data setObject:values forKey:key];
    [data writeToFile: pListPath atomically:YES];
}

-(void) SaveString : (NSString *)key value:(NSString*) value{
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: pListPath];
    [data setObject:value forKey:key];
    [data writeToFile: pListPath atomically:YES];
}

-(void) SaveNumber : (NSString *)key value:(NSNumber*) value{
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: pListPath];
    [data setObject:value forKey:key];
    [data writeToFile: pListPath atomically:YES];
}

@end
