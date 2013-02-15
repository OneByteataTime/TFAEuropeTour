//
//  JTCFlight.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/12/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTCFlight : NSManagedObject;

@property (nonatomic, copy) NSString *airline;
@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *airportCode;
@property (nonatomic, copy) NSString *airportName;
@property (nonatomic, copy) NSString *departureTime;
@property (nonatomic, copy) NSString *arrivalTime;
@property (nonatomic, strong) NSDate *date;

-(id)initWithName:(NSString *)airlineName flightNumber:(NSString *)flightNumber;

@end
