//
//  Airline+Create.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/16/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Airline.h"
#import "JTCFlightViewModel.h"

@interface Airline (Create)

+ (Airline *)airlineFromViewModel:(JTCFlightViewModel *)flightViewModel
         inManagedObjectContext:(NSManagedObjectContext *)context;


@end
