//
//  JTCItineraryFetcher.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/17/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

#define EVENT_TITLE @"title"
#define EVENT_SUMMARY @"summary"
#define EVENT_DATE @"date"
#define EVENT_KEY @"key"
#define EVENT_TIME @"time"

@interface JTCItineraryFetcher : NSObject

+ (NSArray *)itineraryForTrip:(NSString *)tripName;

@end
