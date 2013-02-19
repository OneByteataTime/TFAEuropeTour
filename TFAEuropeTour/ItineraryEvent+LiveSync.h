//
//  ItineraryEvent+LiveSync.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/18/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "ItineraryEvent.h"

@interface ItineraryEvent (LiveSync)

+ (ItineraryEvent *)itineraryEventWithLiveInfo:(NSDictionary *)eventInfo
          inManagedObjectContext:(NSManagedObjectContext *)context;

@end
