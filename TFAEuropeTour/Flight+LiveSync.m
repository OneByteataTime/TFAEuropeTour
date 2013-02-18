//
//  Flight+LiveSync.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/17/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Flight+LiveSync.h"
#import "Airline+LiveSync.h"
#import "Airport+LiveSync.h"
#import "JTCFlightFetcher.h"

@implementation Flight (LiveSync)

+ (Flight *)flightWithLiveInfo:(NSDictionary *)flightInfo inManagedObjectContext:(NSManagedObjectContext *)context
{
    Flight *flight = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Flight"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", [flightInfo objectForKey:FLIGHT_NUMBER]];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"departureDate" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd/yyyy hh:mm a"];

        flight = [NSEntityDescription insertNewObjectForEntityForName:@"Flight" inManagedObjectContext:context];
        flight.seatNumber = flightInfo[FLIGHT_SEAT_NUMBER];
        flight.number = flightInfo[FLIGHT_NUMBER];
        flight.unique = flightInfo[FLIGHT_NUMBER];
        flight.departureDate = [dateFormatter dateFromString:flightInfo[FLIGHT_DEPART_DATE]];
        flight.arrivalDate = [dateFormatter dateFromString:flightInfo[FLIGHT_ARRIVE_DATE]];
        
        flight.fromAirport = [Airport airportWithLiveInfo:flightInfo inManagedObjectContext:context];
        flight.withAirline = [Airline airlineWithLiveInfo:flightInfo inManagedObjectContext:context];
    } else {
        flight = [matches lastObject];
    }
    
    return flight;

}
@end
