//
//  Flight+LiveSync.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/17/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Flight.h"

@interface Flight (LiveSync)

+ (Flight *)flightWithLiveInfo:(NSDictionary *)flightInfo
        inManagedObjectContext:(NSManagedObjectContext *)context;


@end
