//
//  ItineraryEvent.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/9/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Category, CheckIn;

@interface ItineraryEvent : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) NSString * time;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * unique;
@property (nonatomic, retain) NSNumber * timeInterval;
@property (nonatomic, retain) Category *belongsToCategory;
@property (nonatomic, retain) NSSet *mapPins;
@end

@interface ItineraryEvent (CoreDataGeneratedAccessors)

- (void)addMapPinsObject:(CheckIn *)value;
- (void)removeMapPinsObject:(CheckIn *)value;
- (void)addMapPins:(NSSet *)values;
- (void)removeMapPins:(NSSet *)values;

@end
