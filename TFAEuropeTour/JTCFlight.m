//
//  JTCFlight.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/12/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCFlight.h"

@implementation JTCFlight

@synthesize airline = _airline;
@synthesize number = _number;
@synthesize airportCode = _airportCode;
@synthesize airportName = _airportName;
@synthesize departureTime = _departureTime;
@synthesize arrivalTime = _arrivalTime;
@synthesize date = _date;

-(id)initWithName:(NSString *)airlineName flightNumber:(NSString *)flightNumber
{
    self = [super init];
    if (self) {
        _airline = airlineName;
        _number = flightNumber;
        return self;
    }
    return nil;
}
@end
