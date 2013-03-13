//
//  JTCHotelFetcher.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/10/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HOTEL_NAME @"name"
#define HOTEL_URL @"url"
#define HOTEL_COUNTRY @"country"
#define HOTEL_PHONE @"phone"
#define HOTEL_LATITUDE @"latitude"
#define HOTEL_LONGITUDE @"logintude"

@interface JTCHotelFetcher : NSObject

+ (NSArray *)hotelsForTrip:(NSString *)tripName;

@end