//
//  Airport+LiveSync.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/17/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Airport+LiveSync.h"
#import "JTCFlightFetcher.h"

@implementation Airport (LiveSync)

+ (Airport *)airportWithLiveInfo:(NSDictionary *)flightInfo inManagedObjectContext:(NSManagedObjectContext *)context
{
    Airport *airport = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Airport"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", flightInfo[FLIGHT_AIRPORT_CODE]];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"code" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        airport = [NSEntityDescription insertNewObjectForEntityForName:@"Airport" inManagedObjectContext:context];
        airport.name = flightInfo[FLIGHT_AIRPORT];
        airport.code = flightInfo[FLIGHT_AIRPORT_CODE];
        airport.unique = flightInfo[FLIGHT_AIRPORT_CODE];
        
    } else {
        airport = [matches lastObject];
    }
    
    return airport;

}

@end
