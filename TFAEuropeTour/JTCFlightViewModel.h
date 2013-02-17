//
//  JTCFlightViewModel.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/16/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTCFlightViewModel : NSObject

@property (strong, nonatomic) NSString *flightNumber;
@property (strong, nonatomic) NSString *seatNumber;
@property (strong, nonatomic) NSString *airlineName;
@property (strong, nonatomic) NSString *airportName;
@property (strong, nonatomic) NSString *airportCode;
@property (strong, nonatomic) NSDate *departureDate;
@property (strong, nonatomic) NSDate *arrivalDate;

@end
