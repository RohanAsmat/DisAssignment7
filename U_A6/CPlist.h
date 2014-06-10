//
//  CPlist.h
//

#import <Cocoa/Cocoa.h>

@interface CPlist : NSObject
{
    NSString *pListPath;
    NSString *pListName;
}

- (instancetype)initWithPListName:(NSString *)aPListName;
+ (instancetype)plistWithPListName:(NSString *)aPListName;

- (NSMutableArray *)GetDataArray:(NSString *)key;
- (NSMutableDictionary *)GetDataDictionary:(NSString *)key;
- (NSNumber *)GetDataNumber:(NSString *)key;
- (NSString *)GetDataString:(NSString *)key;

- (void)Save:(NSString *)key values:(NSMutableArray *)values;
- (void)SaveString:(NSString *)key value:(NSString *)value;
- (void)SaveNumber:(NSString *)key value:(NSNumber *)value;

@end
