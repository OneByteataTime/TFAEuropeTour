//
//  Airport+Create.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/16/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Airport.h"
#import "JTCFlightViewModel.h"

@interface Airport (Create)

+ (Airport *)airportFromViewModel:(JTCFlightViewModel *)flightViewModel
           inManagedObjectContext:(NSManagedObjectContext *)context;

@end
