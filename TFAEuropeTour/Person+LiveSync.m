//
//  Person+LiveSync.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/9/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Person+LiveSync.h"
#import "JTCPersonFetcher.h"

@implementation Person (LiveSync)

+ (Person *)personWithLiveInfo:(NSDictionary *)personInfo inManagedObjectContext:(NSManagedObjectContext *)context
{
    Person *person = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", [personInfo objectForKey:PERSON_UNIQUE]];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"unique" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        
        person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];

        [person setFirst_name:personInfo[PERSON_FIRST_NAME]];
        [person setLast_name:personInfo[PERSON_LAST_NAME]];
        [person setRole:personInfo[PERSON_ROLE]];
        [person setUnique:personInfo[PERSON_UNIQUE]];
    } else {
        person = [matches lastObject];
    }
    
    return person;
}

@end
