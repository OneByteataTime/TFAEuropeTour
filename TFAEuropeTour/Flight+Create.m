//
//  Flight+Create.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/16/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Flight+Create.h"
#import "Airline+Create.h"
#import "Airport+Create.h"

@implementation Flight (Create)

+ (Flight *)flightfromViewModel:(JTCFlightViewModel *)flightViewModel inManagedObjectContext:(NSManagedObjectContext *)context
{
    Flight *flight = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Flight"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", flightViewModel.flightNumber];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"departureDate" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        flight = [NSEntityDescription insertNewObjectForEntityForName:@"Flight" inManagedObjectContext:context];
        flight.seatNumber = flightViewModel.seatNumber;
        flight.departureDate = flightViewModel.departureDate;
        flight.arrivalDate = flightViewModel.arrivalDate;
        flight.number = flightViewModel.flightNumber;
        flight.unique = flightViewModel.flightNumber;
        
        flight.fromAirport = [Airport airportFromViewModel:flightViewModel inManagedObjectContext:context];
        flight.withAirline = [Airline airlineFromViewModel:flightViewModel inManagedObjectContext:context];
    } else {
        flight = [matches lastObject];
    }
    
    return flight;
}
@end
