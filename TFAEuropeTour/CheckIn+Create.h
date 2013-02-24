//
//  CheckIn+Create.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/24/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "CheckIn.h"
#import <MapKit/MapKit.h>

@interface CheckIn (Create)

+ (CheckIn *)checkInFromLocation:(MKUserLocation *)location itineraryEvent:(ItineraryEvent *)itineraryEvent inManagedObjectContext:(NSManagedObjectContext *)context;

@end
