//
// Created by Ridho Laksono on 12/06/2014.
// Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import "RNSArrayController.h"


@implementation RNSArrayController {

}

- (void)addObject:(id)object {
    [super addObject:object];

    [self.delegate onBeforeAddObject:object];
}

- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];

    [self.delegate onEditObject:value forKey:key];
}

- (void)removeObject:(id)object {
    [super removeObject:object];

    [self.delegate onRemoveObject:object];
}

@end