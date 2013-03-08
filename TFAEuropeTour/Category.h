//
//  Category.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/7/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ItineraryEvent;

@interface Category : NSManagedObject

@property (nonatomic, retain) NSString * imageName;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * unique;
@property (nonatomic, retain) NSSet *groupsEvents;
@end

@interface Category (CoreDataGeneratedAccessors)

- (void)addGroupsEventsObject:(ItineraryEvent *)value;
- (void)removeGroupsEventsObject:(ItineraryEvent *)value;
- (void)addGroupsEvents:(NSSet *)values;
- (void)removeGroupsEvents:(NSSet *)values;

@end
