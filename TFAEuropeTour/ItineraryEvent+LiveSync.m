//
//  ItineraryEvent+LiveSync.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/18/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "ItineraryEvent+LiveSync.h"
#import "JTCItineraryFetcher.h"
#import "Category+LiveSync.h"

@implementation ItineraryEvent (LiveSync)

+ (Category *)findCategory:(NSString *)categoryKey inManagedObjectContext:(NSManagedObjectContext *)context
{
    Category *category = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Category"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique=%@", categoryKey];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"unique" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] == 0)) {
        // handle error
    }
    else {
        category = [matches lastObject];
    }
   
    return category;
}

+ (ItineraryEvent *)itineraryEventWithLiveInfo:(NSDictionary *)eventInfo inManagedObjectContext:(NSManagedObjectContext *)context
{
    ItineraryEvent *itineraryEvent = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ItineraryEvent"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", [eventInfo objectForKey:EVENT_KEY]];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"unique" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd/yyyy"];
        
        itineraryEvent = [NSEntityDescription insertNewObjectForEntityForName:@"ItineraryEvent" inManagedObjectContext:context];
        
        itineraryEvent.title = eventInfo[EVENT_TITLE];
        itineraryEvent.summary = eventInfo[EVENT_SUMMARY];
        itineraryEvent.date = [dateFormatter dateFromString:eventInfo[EVENT_DATE]];
        itineraryEvent.time = eventInfo[EVENT_TIME];
        itineraryEvent.unique = eventInfo[EVENT_KEY];
        
        
        itineraryEvent.belongsToCategory = [self findCategory:eventInfo[EVENT_CATEGORY] inManagedObjectContext:context];
        
    } else {
        itineraryEvent = [matches lastObject];
    }
    
    return itineraryEvent;

}
@end
