//
// Created by Ridho Laksono on 12/06/2014.
// Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol RNSArrayControllerEvents <NSObject>
- (void)onBeforeAddObject:(id)object;
- (void)onEditObject:(id)value forKey:(NSString *)key;
- (void)onRemoveObject:(id)object;
@end

@interface RNSArrayController : NSArrayController
@property (strong) id<RNSArrayControllerEvents> delegate;
@end