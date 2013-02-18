//
//  JTCFlightFetcher.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/17/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FLIGHT_NUMBER @"flightNumber"
#define FLIGHT_AIRPORT @"airport"
#define FLIGHT_AIRLINE @"airline"
#define FLIGHT_AIRPORT_CODE @"airportCode"
#define FLIGHT_DEPART_DATE @"departDate"
#define FLIGHT_ARRIVE_DATE @"arriveDate"
#define FLIGHT_SEAT_NUMBER @"seatNumber"

@interface JTCFlightFetcher : NSObject

+ (NSArray *)flightsForTrip:(NSString *)tripName;

@end
