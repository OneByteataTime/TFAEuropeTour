//
//  Category+LiveSync.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/23/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Category+LiveSync.h"
#import "JTCCategoryFetcher.h"

@implementation Category (LiveSync)

+ (Category *)categoryWithLiveSync:(NSDictionary *)categoryInfo inManagedObjectContext:(NSManagedObjectContext *)context
{
    Category *category = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Category"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", [categoryInfo objectForKey:CATEGORY_UNIQUE]];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"unique" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
        
        category = [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:context];
        
        category.name = categoryInfo[CATEGORY_NAME];
        category.imageName = categoryInfo[CATEGORY_IMAGE];
        category.unique = categoryInfo[CATEGORY_UNIQUE];
    } else {
        category = [matches lastObject];
    }
    
    return category;
   
}
@end
