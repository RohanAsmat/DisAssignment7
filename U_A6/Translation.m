//
//  Translation.m
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import "Translation.h"


@implementation Translation

@synthesize language;
@synthesize text;

- (instancetype)initWithLanguage:(NSString *)aLanguage text:(NSString *)aText {
    self = [super init];
    if (self) {
        language = aLanguage;
        text = aText;
    }

    return self;
}

+ (instancetype)translationWithLanguage:(NSString *)aLanguage text:(NSString *)aText {
    return [[self alloc] initWithLanguage:aLanguage text:aText];
}

@end
