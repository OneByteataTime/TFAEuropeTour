//
//  CheckIn+Create.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/24/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "CheckIn+Create.h"
#import "ItineraryEvent.h"

@implementation CheckIn (Create)

+ (CheckIn *)checkInFromLocation:(MKUserLocation *)location itineraryEvent:(ItineraryEvent *)itineraryEvent inManagedObjectContext:(NSManagedObjectContext *)context
{
    CheckIn *checkIn = nil;
    
    double longitude = location.coordinate.longitude;
    double latitude = location.coordinate.latitude;
    
    NSString *uniqueKey = [NSString stringWithFormat:@"%f:%f", latitude, longitude];
    NSLog(@"Check-In key:@", uniqueKey);
    
    NSSet *itineraryCheckins =
    [itineraryEvent.mapPins filteredSetUsingPredicate:
    [NSPredicate predicateWithFormat:@"unique == %@", uniqueKey]];
    
    if ([itineraryCheckins count] == 0) {
        checkIn = [NSEntityDescription insertNewObjectForEntityForName:@"CheckIn" inManagedObjectContext:context];
        
        checkIn.longitude = [NSNumber numberWithFloat:longitude];
        checkIn.latitude = [NSNumber numberWithFloat:latitude];
        checkIn.name = itineraryEvent.title;
        checkIn.unique = uniqueKey;
        
        checkIn.locationForEvent = itineraryEvent;
    }
    else {
        checkIn = [itineraryCheckins anyObject];
    }

    return checkIn;
}
@end
