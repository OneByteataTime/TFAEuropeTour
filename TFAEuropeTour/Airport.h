//
//  Airport.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/23/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Flight;

@interface Airport : NSManagedObject

@property (nonatomic, retain) NSString * code;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * unique;
@property (nonatomic, retain) NSSet *hasTakeoffs;
@end

@interface Airport (CoreDataGeneratedAccessors)

- (void)addHasTakeoffsObject:(Flight *)value;
- (void)removeHasTakeoffsObject:(Flight *)value;
- (void)addHasTakeoffs:(NSSet *)values;
- (void)removeHasTakeoffs:(NSSet *)values;

@end
