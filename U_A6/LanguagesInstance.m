//
// Created by Ridho Laksono on 11/06/2014.
// Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import "LanguagesInstance.h"
#import "CPlist.h"
#import "Lang.h"

@implementation LanguagesInstance {
    CPlist *languagePlist;
    NSMutableArray *languages;
}

static LanguagesInstance *sharedInstance = nil;
+ (LanguagesInstance *)Instance {
    if (!sharedInstance) {
        sharedInstance = (LanguagesInstance *) [[super alloc] init];
    }

    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) { 
        // load languages plist
        languagePlist = [CPlist plistWithPListName:@"languages"];
        // setup languages from the dictionary

        // load plist content into array
        languages = [[NSMutableArray alloc] init];
        [self setupLanguages];
    }

    return self;
}

// call this to accumulate hardcoded language
- (void) setupLanguages{
    NSMutableDictionary *aLanguages = [languagePlist GetDataDictionary:@"languages"];

    // clear before overriding the content of the languages array
    [languages removeAllObjects];

    // fill in the languages from the dictionary
    for(NSString* key in aLanguages){
        Lang *translation = [[Lang alloc] init];
        translation.language = key;
        translation.text = aLanguages[key];

        // put this guy in the pool
        [languages addObject:translation];
    }
}

- (NSString *)getTranslationFromLanguages:(NSString *)languageName{
    // get the good morning translation, for loop array and test
    for(Lang * translation in languages){
        if(translation.language == languageName){
            return translation.text;
        }
    }

    return nil;
}

- (NSMutableArray *)getLanguages {
    return languages;
}
@end