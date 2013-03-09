//
//  Person+LiveSync.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/9/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Person.h"

@interface Person (LiveSync)

+ (Person *)personWithLiveInfo:(NSDictionary *)personInfo
                        inManagedObjectContext:(NSManagedObjectContext *)context;


@end
