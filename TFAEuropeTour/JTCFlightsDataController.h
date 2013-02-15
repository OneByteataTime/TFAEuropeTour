//
//  JTCFlightsDataController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/12/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JTCFlight;

@interface JTCFlightsDataController : NSObject

@property (nonatomic, copy) NSMutableArray *flightList;

- (NSUInteger)countOfFlightList;
- (JTCFlight *)objectInFlightListAtIndex:(NSUInteger)index;
- (void)addFlightWithFlight:(JTCFlight *)flight;

@end
