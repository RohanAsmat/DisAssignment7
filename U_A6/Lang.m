//
//  Lang.m
//  U_A6
//
//  Created by Ridho Laksono on 11/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import "Lang.h"


@implementation Lang

- (instancetype)initWithLanguage:(NSString *)aLanguage text:(NSString *)aText {
    self = [super init];
    if (self) {
        self.language = aLanguage;
        self.text = aText;
    }
    
    return self;
}

+ (instancetype)translationWithLanguage:(NSString *)aLanguage text:(NSString *)aText {
    return [[self alloc] initWithLanguage:aLanguage text:aText];
}


@end
