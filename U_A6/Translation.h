//
//  Translation.h
//  U_A6
//
//  Created by Rohan Asmat on 09/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Translation : NSObject {
@private
    NSString * language;
    NSString * text;
}

@property (copy) NSString * language;
@property (copy) NSString * text;

- (instancetype)initWithLanguage:(NSString *)aLanguage text:(NSString *)aText;
+ (instancetype)translationWithLanguage:(NSString *)aLanguage text:(NSString *)aText;


@end
