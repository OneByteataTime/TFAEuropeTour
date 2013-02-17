//
//  JTCFlightsDataController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/12/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Flight;

@interface JTCFlightsDataController : NSObject

@property (nonatomic, copy) NSMutableArray *flightList;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (NSUInteger)countOfFlightList;
- (Flight *)objectInFlightListAtIndex:(NSUInteger)index;
- (void)addFlightWithFlight:(Flight *)flight;

@end
