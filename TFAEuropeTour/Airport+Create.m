//
//  Airport+Create.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/16/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Airport+Create.h"

@implementation Airport (Create)

+ (Airport *)airportFromViewModel:(JTCFlightViewModel*)flightViewModel inManagedObjectContext:(NSManagedObjectContext *)context
{
    Airport *airport = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Airport"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", flightViewModel.airportCode];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"code" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        airport = [NSEntityDescription insertNewObjectForEntityForName:@"Airport" inManagedObjectContext:context];
        airport.name = flightViewModel.airportName;
        airport.code = flightViewModel.airportCode;
        airport.unique = flightViewModel.airportCode;
        
    } else {
        airport = [matches lastObject];
    }
    
    return airport;
}

@end
