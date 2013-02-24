//
//  Flight.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/23/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Airline, Airport;

@interface Flight : NSManagedObject

@property (nonatomic, retain) NSDate * arrivalDate;
@property (nonatomic, retain) NSDate * departureDate;
@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) NSString * seatNumber;
@property (nonatomic, retain) NSString * unique;
@property (nonatomic, retain) Airport *fromAirport;
@property (nonatomic, retain) Airline *withAirline;

@end
