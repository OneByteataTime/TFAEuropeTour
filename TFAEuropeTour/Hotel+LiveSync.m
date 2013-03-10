//
//  Hotel+LiveSync.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/10/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Hotel+LiveSync.h"
#import "JTCHotelFetcher.h"

@implementation Hotel (LiveSync)

+ (Hotel *)hotelWithLiveInfo:(NSDictionary *)hotelInfo inManagedObjectContext:(NSManagedObjectContext *)context
{
    Hotel *hotel = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
    request.predicate = [NSPredicate predicateWithFormat:@"name = %@", [hotelInfo objectForKey:HOTEL_NAME]];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        
        hotel = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:context];
        
        [hotel setCountry:hotelInfo[HOTEL_COUNTRY]];
        [hotel setName:hotelInfo[HOTEL_NAME]];
        [hotel setUrl:hotelInfo[HOTEL_URL]];
        [hotel setPhone_number:hotelInfo[HOTEL_PHONE]];
    } else {
        hotel = [matches lastObject];
    }
    
    return hotel;
}

@end
