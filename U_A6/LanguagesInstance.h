//
// Created by Ridho Laksono on 11/06/2014.
// Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LanguagesInstance : NSObject

// singleton object of this guy
+ (LanguagesInstance *)Instance;

- (NSString *)getTranslationFromLanguages:(NSString *)languageName;

- (NSMutableArray *)getLanguages;
@end