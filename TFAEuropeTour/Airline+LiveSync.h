//
//  Airline+LiveSync.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/17/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Airline.h"

@interface Airline (LiveSync)

+ (Airline *)airlineWithLiveInfo:(NSDictionary *)flightInfo
        inManagedObjectContext:(NSManagedObjectContext *)context;

@end
