//
//  Airport+LiveSync.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/17/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Airport.h"

@interface Airport (LiveSync)

+ (Airport *)airportWithLiveInfo:(NSDictionary *)flightInfo
        inManagedObjectContext:(NSManagedObjectContext *)context;
@end
