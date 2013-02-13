//
//  JTCFlightsDataController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/12/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCFlightsDataController.h"
#import "JTCFlight.h"

@implementation JTCFlightsDataController

@synthesize flightList = _flightList;

- (NSUInteger)countOfFlightList
{
    return self.flightList.count;
}

- (JTCFlight *)objectInFlightListAtIndex:(NSUInteger)index
{
    return [self.flightList objectAtIndex:index];
}

- (void)addFlightWithName:(NSString *)airlineName flightNumber:(NSString *)flightNumber
{
    JTCFlight *flight;
    flight = [[JTCFlight alloc] initWithName:airlineName flightNumber:flightNumber];
    [self.flightList addObject:flight];
}
@end
