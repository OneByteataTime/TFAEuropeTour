//
//  Airline+LiveSync.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/17/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Airline+LiveSync.h"
#import "JTCFlightFetcher.h"

@implementation Airline (LiveSync)

+ (Airline *)airlineWithLiveInfo:(NSDictionary *)flightInfo
          inManagedObjectContext:(NSManagedObjectContext *)context
{
    Airline *airline = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Airline"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", flightInfo[FLIGHT_AIRLINE]];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        airline = [NSEntityDescription insertNewObjectForEntityForName:@"Airline" inManagedObjectContext:context];
        airline.name = flightInfo[FLIGHT_AIRLINE];
        airline.unique = flightInfo[FLIGHT_AIRLINE];
    } else {
        airline = [matches lastObject];
    }
    
    return airline;
}

@end
