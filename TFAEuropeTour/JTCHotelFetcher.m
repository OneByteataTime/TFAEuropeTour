//
//  JTCHotelFetcher.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/10/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCHotelFetcher.h"

@implementation JTCHotelFetcher

+ (NSArray *)hotelsForTrip:(NSString *)tripName
{
    // Hotels
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Straelener Hof", HOTEL_NAME,
                           @"http://www.straelenerhof.de/startseite.html", HOTEL_URL,
                           @"+49 02834 91410", HOTEL_PHONE,
                           @"51.44151", HOTEL_LATITUDE,
                           @"6.26566", HOTEL_LONGITUDE,
                           @"Germany", HOTEL_COUNTRY, nil];
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Ibis Brugge Centrum", HOTEL_NAME,
                           @"http://www.accorhotels.com/gb/hotel-1047-ibis-brugge-centrum/index.shtml", HOTEL_URL,
                           @"+32 50 33 75 75", HOTEL_PHONE,
                           @"51.20199", HOTEL_LATITUDE,
                           @"3.22694", HOTEL_LONGITUDE,
                           @"Belgium", HOTEL_COUNTRY, nil];
    NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"The Dolphine", HOTEL_NAME,
                           @"http://www.dolphinhotelcambs.co.uk", HOTEL_URL,
                           @"+44 1480 466 966", HOTEL_PHONE,
                           @"52.32206", HOTEL_LATITUDE,
                           @"-0.07527", HOTEL_LONGITUDE,
                           @"England", HOTEL_COUNTRY, nil];
    
    NSArray *hotels = [NSArray arrayWithObjects:dict1,dict2,dict3,nil];
    
    return hotels;
    
}

@end
