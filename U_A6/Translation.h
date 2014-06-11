//
//  Translation.h
//  U_A6
//
//  Created by Ridho Laksono on 11/06/2014.
//  Copyright (c) 2014 Rohan Asmat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Translation : NSManagedObject

@property (nonatomic, retain) NSString * language;
@property (nonatomic, retain) NSString * text; 

@end
