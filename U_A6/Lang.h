//
//  Lang.h
//  U_A6
//
//  Created by Ridho Laksono on 11/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

@interface Lang : NSObject

@property NSString * language;
@property NSString * text;

- (instancetype)initWithLanguage:(NSString *)aLanguage text:(NSString *)aText;
+ (instancetype)translationWithLanguage:(NSString *)aLanguage text:(NSString *)aText;

@end
