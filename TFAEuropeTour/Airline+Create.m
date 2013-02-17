//
//  Airline+Create.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/16/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Airline+Create.h"

@implementation Airline (Create)

+ (Airline *)airlineFromViewModel:(JTCFlightViewModel *)flightViewModel inManagedObjectContext:(NSManagedObjectContext *)context
{
    Airline *airline = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Airline"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", flightViewModel.airlineName];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        airline = [NSEntityDescription insertNewObjectForEntityForName:@"Airline" inManagedObjectContext:context];
        airline.name = flightViewModel.airlineName;
        airline.unique = flightViewModel.airlineName;
    } else {
        airline = [matches lastObject];
    }
    
    return airline;
}
@end
