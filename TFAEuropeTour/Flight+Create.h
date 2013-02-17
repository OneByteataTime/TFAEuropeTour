//
//  Flight+Create.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/16/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Flight.h"
#import "JTCFlightViewModel.h"

@interface Flight (Create)

+ (Flight *)flightfromViewModel:(JTCFlightViewModel *)flightViewModel
      inManagedObjectContext:(NSManagedObjectContext *)context;


@end
