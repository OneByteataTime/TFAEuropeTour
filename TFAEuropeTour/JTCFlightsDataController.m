//
//  JTCFlightsDataController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/12/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCFlightsDataController.h"
#import "Flight.h"

@interface JTCFlightsDataController()

-(void)initializeDefaultDataList;

@end

@implementation JTCFlightsDataController

@synthesize flightList = _flightList;
@synthesize managedObjectContext = _managedObjectContext;

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

- (void)setFlightList:(NSMutableArray *)newList {
    if (_flightList != newList) {
        _flightList = [newList mutableCopy];
    }
}

- (void)initializeDefaultDataList
{
    /*
    NSMutableArray *flights = [[NSMutableArray alloc] init];
    self.flightList = flights;
    JTCFlight *flight;
    
    flight = [[JTCFlight alloc] initWithName:@"Lufthansa" flightNumber:@"LH443"];
    [self addFlightWithFlight:flight];
    */
}

- (NSUInteger)countOfFlightList
{
    return self.flightList.count;
}

- (Flight *)objectInFlightListAtIndex:(NSUInteger)index
{
    return [self.flightList objectAtIndex:index];
}

- (void)addFlightWithFlight:(Flight *)flight
{
    [self.flightList addObject:flight];
}

@end
