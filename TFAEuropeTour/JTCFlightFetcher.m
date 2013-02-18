//
//  JTCFlightFetcher.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/17/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCFlightFetcher.h"

@implementation JTCFlightFetcher

+ (NSArray *)flightsForTrip:(NSString *)tripName
{
    NSDictionary *flight1 = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"LH443",FLIGHT_NUMBER,
                             @"Lufthansa", FLIGHT_AIRLINE,
                             @"Detroit", FLIGHT_AIRPORT,
                             @"DTW", FLIGHT_AIRPORT_CODE,
                             @"3/29/2013 7:25 PM", FLIGHT_DEPART_DATE,
                             @"3/30/2013 8:50 AM", FLIGHT_ARRIVE_DATE,
                             @"", FLIGHT_SEAT_NUMBER,
                             nil];
    
    NSDictionary *flight2 = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"LH903",FLIGHT_NUMBER,
                             @"Lufthansa", FLIGHT_AIRLINE,
                             @"London Heathrow", FLIGHT_AIRPORT,
                             @"LHR", FLIGHT_AIRPORT_CODE,
                             @"4/7/2013 9:45 AM", FLIGHT_DEPART_DATE,
                             @"4/7/2013 12:30 PM", FLIGHT_ARRIVE_DATE,
                             @"", FLIGHT_SEAT_NUMBER,
                             nil];

    NSDictionary *flight3 = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"LH442",FLIGHT_NUMBER,
                             @"Lufthansa", FLIGHT_AIRLINE,
                             @"Frnakfurt", FLIGHT_AIRPORT,
                             @"FRA", FLIGHT_AIRPORT_CODE,
                             @"4/7/2013 2:10 PM", FLIGHT_DEPART_DATE,
                             @"4/7/2013 5:20 PM", FLIGHT_ARRIVE_DATE,
                             @"", FLIGHT_SEAT_NUMBER,
                             nil];
    
    NSArray *flights = [NSArray arrayWithObjects:flight1, flight2, flight3, nil];
    
    return flights;
}
@end
