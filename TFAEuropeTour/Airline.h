//
//  Airline.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/16/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Flight;

@interface Airline : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * unique;
@property (nonatomic, retain) NSSet *offersFlights;
@end

@interface Airline (CoreDataGeneratedAccessors)

- (void)addOffersFlightsObject:(Flight *)value;
- (void)removeOffersFlightsObject:(Flight *)value;
- (void)addOffersFlights:(NSSet *)values;
- (void)removeOffersFlights:(NSSet *)values;

@end
