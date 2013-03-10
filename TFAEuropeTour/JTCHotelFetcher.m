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
                           @"02834 - 9 14 10", HOTEL_PHONE,
                           @"Germany", HOTEL_COUNTRY, nil];
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Ibis Brugge Centrum", HOTEL_NAME,
                           @"http://www.accorhotels.com/gb/hotel-1047-ibis-brugge-centrum/index.shtml", HOTEL_URL,
                           @"(+32)50/930801", HOTEL_PHONE,
                           @"Belgium", HOTEL_COUNTRY, nil];
    NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"The Dolphine", HOTEL_NAME,
                           @"http://www.dolphinhotelcambs.co.uk", HOTEL_URL,
                           @"01480 466966", HOTEL_PHONE,
                           @"England", HOTEL_COUNTRY, nil];
    
    NSArray *hotels = [NSArray arrayWithObjects:dict1,dict2,dict3,nil];
    
    return hotels;
    
}

@end
