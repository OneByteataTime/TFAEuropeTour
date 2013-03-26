//
//  JTCItineraryFetcher.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/17/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCItineraryFetcher.h"

@implementation JTCItineraryFetcher

+ (NSArray *)itineraryForTrip:(NSString *)tripName
{
    // Friday
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"0329-1", EVENT_KEY,
                           @"03/29/2013", EVENT_DATE,
                           @"7:25 PM", EVENT_TIME,
                           @"Flight to Germany", EVENT_TITLE,
                           @"cat1", EVENT_CATEGORY,
                           @"Depart Detroit on overrnight flight to Germany", EVENT_SUMMARY, nil];
    
    // Saturday
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"0330-1", EVENT_KEY,
                           @"03/30/2013", EVENT_DATE,
                           @"8:50 AM", EVENT_TIME,
                           @"Arrive in Germany", EVENT_TITLE,
                           @"cat5", EVENT_CATEGORY,
                           @"Arrive in Frankfurt and transfer to Straelen", EVENT_SUMMARY, nil];

    NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"0330-2", EVENT_KEY,
                           @"03/30/2013", EVENT_DATE,
                           @"9:00 AM", EVENT_TIME,
                           @"Rudensheim", EVENT_TITLE,
                           @"cat4", EVENT_CATEGORY,
                           @"A sightseeing stop in the beautiful town of Rudesheim", EVENT_SUMMARY, nil];

    NSDictionary *dict4 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"0330-3", EVENT_KEY,
                           @"03/30/2013", EVENT_DATE,
                           @"2:00 PM", EVENT_TIME,
                           @"Straelener Hof Hotel", EVENT_TITLE,
                           @"cat4", EVENT_CATEGORY,
                           @"Check into the Straelenerhof Hotel", EVENT_SUMMARY, nil];

    NSDictionary *dict5 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"0330-4", EVENT_KEY,
                           @"03/30/2013", EVENT_DATE,
                           @"3:00 PM", EVENT_TIME,
                           @"Practice", EVENT_TITLE,
                           @"cat6", EVENT_CATEGORY,
                           @"Practice at SV Straelen - 800 yards from hotel", EVENT_SUMMARY, nil];

    NSDictionary *dict6 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"0330-5", EVENT_KEY,
                           @"03/30/2013", EVENT_DATE,
                           @"6:00 PM", EVENT_TIME,
                           @"Dinner", EVENT_TITLE,
                           @"cat2", EVENT_CATEGORY,
                           @"Dinner at Hotel", EVENT_SUMMARY, nil];

    // Sunday
    NSDictionary *dict7 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"0331-1", EVENT_KEY,
                           @"03/31/2013", EVENT_DATE,
                           @"9:00 AM", EVENT_TIME,
                           @"Breakfast", EVENT_TITLE,
                           @"cat1", EVENT_CATEGORY,
                           @"Breakfast at Hotel", EVENT_SUMMARY, nil];

    NSDictionary *dict8 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"0331-2", EVENT_KEY,
                           @"03/31/2013", EVENT_DATE,
                           @"9:30 AM", EVENT_TIME,
                           @"Depart for Cologne", EVENT_TITLE,
                           @"cat5", EVENT_CATEGORY,
                           @"Depart hotel for city of Cologne", EVENT_SUMMARY, nil];
    NSDictionary *dict9 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"0331-3", EVENT_KEY,
                           @"03/31/2013", EVENT_DATE,
                           @"11:30 AM", EVENT_TIME,
                           @"Free time", EVENT_TITLE,
                           @"cat4", EVENT_CATEGORY,
                           @"Free time in Cologne until 2PM", EVENT_SUMMARY, nil];
    NSDictionary *dict10 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"0331-4", EVENT_KEY,
                           @"03/31/2013", EVENT_DATE,
                           @"2:30 PM", EVENT_TIME,
                           @"Bundesliga 2 Game", EVENT_TITLE,
                            @"cat3", EVENT_CATEGORY,
                           @"Soccer match - Cologne vs Regensburg", EVENT_SUMMARY, nil];
    NSDictionary *dict11 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"0331-5", EVENT_KEY,
                           @"03/31/2013", EVENT_DATE,
                           @"6:00 PM", EVENT_TIME,
                           @"Dinner", EVENT_TITLE,
                            @"cat2", EVENT_CATEGORY,
                           @"Dinner at Hotel", EVENT_SUMMARY, nil];
    
    // Monday
    NSDictionary *dict12 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0401-1", EVENT_KEY,
                            @"04/01/2013", EVENT_DATE,
                            @"8:00 AM", EVENT_TIME,
                            @"Breakfast", EVENT_TITLE,
                            @"cat1", EVENT_CATEGORY,
                            @"Breakfast at Hotel", EVENT_SUMMARY, nil];
    NSDictionary *dict13 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0401-2", EVENT_KEY,
                            @"04/01/2013", EVENT_DATE,
                            @"9:30 AM", EVENT_TIME,
                            @"Soccer Practice", EVENT_TITLE,
                            @"cat6", EVENT_CATEGORY,
                            @"Morning practice session", EVENT_SUMMARY, nil];
    NSDictionary *dict14 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0401-3", EVENT_KEY,
                            @"04/01/2013", EVENT_DATE,
                            @"11:00 AM", EVENT_TIME,
                            @"Profesional stadium", EVENT_TITLE,
                            @"cat3", EVENT_CATEGORY,
                            @"Vist Bundesliga stadium and pro team training at Borussia Moenchengladbach", EVENT_SUMMARY, nil];
    NSDictionary *dict15 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0401-4", EVENT_KEY,
                            @"04/01/2013", EVENT_DATE,
                            @"2:00 PM", EVENT_TIME,
                            @"Free time", EVENT_TITLE,
                            @"cat4", EVENT_CATEGORY,
                            @"Afternoon free time - posssible Go Kart Racing", EVENT_SUMMARY, nil];
    NSDictionary *dict16 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0401-5", EVENT_KEY,
                            @"04/01/2013", EVENT_DATE,
                            @"3:00 PM", EVENT_TIME,
                            @"Game", EVENT_TITLE,
                            @"cat3", EVENT_CATEGORY,
                            @"Soccer match - TFA vs Straelen", EVENT_SUMMARY, nil];
    NSDictionary *dict17 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0401-6", EVENT_KEY,
                            @"04/01/2013", EVENT_DATE,
                            @"6:00 PM", EVENT_TIME,
                            @"Dinner", EVENT_TITLE,
                            @"cat2", EVENT_CATEGORY,
                            @"Dinner at Hotel", EVENT_SUMMARY, nil];

    // Tuesday
    NSDictionary *dict18 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0402-1", EVENT_KEY,
                            @"04/02/2013", EVENT_DATE,
                            @"8:00 AM", EVENT_TIME,
                            @"Breakfast", EVENT_TITLE,
                            @"cat1", EVENT_CATEGORY,
                            @"Breakfast at Hotel", EVENT_SUMMARY, nil];
    NSDictionary *dict19 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0402-2", EVENT_KEY,
                            @"04/02/2013", EVENT_DATE,
                            @"9:00 AM", EVENT_TIME,
                            @"Brugge", EVENT_TITLE,
                            @"cat5", EVENT_CATEGORY,
                            @"Travel to the city of Brugge, Belgium", EVENT_SUMMARY, nil];
    NSDictionary *dict20 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0402-3", EVENT_KEY,
                            @"04/02/2013", EVENT_DATE,
                            @"11:00 AM", EVENT_TIME,
                            @"Check-in to hotel", EVENT_TITLE,
                            @"cat4", EVENT_CATEGORY,
                            @"Check-in to the Ibis Hotel Brugge",  EVENT_SUMMARY,nil];
    NSDictionary *dict21 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0402-4", EVENT_KEY,
                            @"04/02/2013", EVENT_DATE,
                            @"1:00 PM", EVENT_TIME,
                            @"Free time", EVENT_TITLE,
                            @"cat4", EVENT_CATEGORY,
                            @"Free time in Brugge", EVENT_SUMMARY, nil];
    NSDictionary *dict22 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0402-5", EVENT_KEY,
                            @"04/02/2013", EVENT_DATE,
                            @"3:30 PM", EVENT_TIME,
                            @"Games", EVENT_TITLE,
                            @"cat7", EVENT_CATEGORY,
                            @"Games in Brugge area", EVENT_SUMMARY, nil];
    NSDictionary *dict23 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0402-6", EVENT_KEY,
                            @"04/02/2013", EVENT_DATE,
                            @"6:00 PM", EVENT_TIME,
                            @"Dinner", EVENT_TITLE,
                            @"cat2", EVENT_CATEGORY,
                            @"Dinner at Hotel", EVENT_SUMMARY, nil];

    // Wednesday
    NSDictionary *dict24 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0403-1", EVENT_KEY,
                            @"04/03/2013", EVENT_DATE,
                            @"8:00 AM", EVENT_TIME,
                            @"Breakfast", EVENT_TITLE,
                            @"cat1", EVENT_CATEGORY,
                            @"Breakfast at Hotel", EVENT_SUMMARY, nil];
    NSDictionary *dict25 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0403-2", EVENT_KEY,
                            @"04/03/2013", EVENT_DATE,
                            @"9:00 AM", EVENT_TIME,
                            @"German Bunkers", EVENT_TITLE,
                            @"cat4", EVENT_CATEGORY,
                            @"Visit to WW1/WW2 German bunkers and Ostend", EVENT_SUMMARY, nil];

    NSDictionary *dict26 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0403-3", EVENT_KEY,
                            @"04/03/2013", EVENT_DATE,
                            @"2:00 PM", EVENT_TIME,
                            @"Game", EVENT_TITLE,
                            @"cat7", EVENT_CATEGORY,
                            @"Soccer Game - TFA vs KV Oostend", EVENT_SUMMARY, nil];

    NSDictionary *dict27 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0403-4", EVENT_KEY,
                            @"04/03/2013", EVENT_DATE,
                            @"6:00 PM", EVENT_TIME,
                            @"Dinner", EVENT_TITLE,
                            @"cat2", EVENT_CATEGORY,
                            @"Dinner at Hotel", EVENT_SUMMARY, nil];

    
    // Thursday
    NSDictionary *dict28 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0404-1", EVENT_KEY,
                            @"04/04/2013", EVENT_DATE,
                            @"8:00 AM", EVENT_TIME,
                            @"Breakfast", EVENT_TITLE,
                            @"cat1", EVENT_CATEGORY,
                            @"Breakfast at Hotel", EVENT_SUMMARY, nil];
    NSDictionary *dict29 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0404-2", EVENT_KEY,
                            @"04/04/2013", EVENT_DATE,
                            @"10:00 AM", EVENT_TIME,
                            @"Travel to England", EVENT_TITLE,
                            @"cat5", EVENT_CATEGORY,
                            @"Ferry crossing to England", EVENT_SUMMARY, nil];
    NSDictionary *dict30 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0404-3", EVENT_KEY,
                            @"04/04/2013", EVENT_DATE,
                            @"1:00 PM", EVENT_TIME,
                            @"Cambridge England", EVENT_TITLE,
                            @"cat5", EVENT_CATEGORY,
                            @"Transfer to city of Cambridge",  EVENT_SUMMARY,nil];
    NSDictionary *dict31 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0404-4", EVENT_KEY,
                            @"04/04/2013", EVENT_DATE,
                            @"2:00 PM", EVENT_TIME,
                            @"Shopping and Sightseeing", EVENT_TITLE,
                            @"cat4", EVENT_CATEGORY,
                            @"Shopping and Sightseeing in the city center", EVENT_SUMMARY, nil];
    NSDictionary *dict32 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0404-5", EVENT_KEY,
                            @"04/04/2013", EVENT_DATE,
                            @"4:00 PM", EVENT_TIME,
                            @"Travel to Dolphine Hotel", EVENT_TITLE,
                            @"cat5", EVENT_CATEGORY,
                            @"Travel to the Dolphine Hotel St. Ives", EVENT_SUMMARY, nil];
    NSDictionary *dict33 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0404-6", EVENT_KEY,
                            @"04/04/2013", EVENT_DATE,
                            @"6:00 PM", EVENT_TIME,
                            @"Dinner", EVENT_TITLE,
                            @"cat2", EVENT_CATEGORY,
                            @"Dinner at Hotel", EVENT_SUMMARY, nil];
    
    // Friday
    NSDictionary *dict34 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0405-1", EVENT_KEY,
                            @"04/05/2013", EVENT_DATE,
                            @"8:00 AM", EVENT_TIME,
                            @"Breakfast", EVENT_TITLE,
                            @"cat1", EVENT_CATEGORY,
                            @"Breakfast at Hotel", EVENT_SUMMARY, nil];
    NSDictionary *dict35 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0405-2", EVENT_KEY,
                            @"04/05/2013", EVENT_DATE,
                            @"9:00 AM", EVENT_TIME,
                            @"Sightseeing", EVENT_TITLE,
                            @"cat4", EVENT_CATEGORY,
                            @"Full day sightseeing in London", EVENT_SUMMARY, nil];
    NSDictionary *dict36 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0405-3", EVENT_KEY,
                            @"04/05/2013", EVENT_DATE,
                            @"6:00 PM", EVENT_TIME,
                            @"Dinner", EVENT_TITLE,
                            @"cat2", EVENT_CATEGORY,
                            @"Dinner at Hotel", EVENT_SUMMARY, nil];
    
    // Saturday
    NSDictionary *dict37 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0406-1", EVENT_KEY,
                            @"04/06/2013", EVENT_DATE,
                            @"8:00 AM", EVENT_TIME,
                            @"Breakfast", EVENT_TITLE,
                            @"cat1", EVENT_CATEGORY,
                            @"Breakfast at Hotel", EVENT_SUMMARY, nil];
    NSDictionary *dict38 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0406-2", EVENT_KEY,
                            @"04/06/2013", EVENT_DATE,
                            @"10:30 AM", EVENT_TIME,
                            @"Soccer Game", EVENT_TITLE,
                            @"cat3", EVENT_CATEGORY,
                            @"Morning game with local team", EVENT_SUMMARY, nil];
    NSDictionary *dict39 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0406-3", EVENT_KEY,
                            @"04/06/2013", EVENT_DATE,
                            @"2:00 PM", EVENT_TIME,
                            @"Soccer Match", EVENT_TITLE,
                            @"cat7", EVENT_CATEGORY,
                            @"Afternoon EPL game at Spurs, Fulham, or Reading", EVENT_SUMMARY, nil];
    NSDictionary *dict40 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0406-4", EVENT_KEY,
                            @"04/06/2013", EVENT_DATE,
                            @"6:00 PM", EVENT_TIME,
                            @"Dinner", EVENT_TITLE,
                            @"cat2", EVENT_CATEGORY,
                            @"Dinner at Hotel", EVENT_SUMMARY, nil];
    
    
    // Sunday
    NSDictionary *dict41 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0407-1", EVENT_KEY,
                            @"04/07/2013", EVENT_DATE,
                            @"8:00 AM", EVENT_TIME,
                            @"Breakfast", EVENT_TITLE,
                            @"cat1", EVENT_CATEGORY,
                            @"Breakfast at Hotel", EVENT_SUMMARY, nil];
    NSDictionary *dict42 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"0407-2", EVENT_KEY,
                            @"04/07/2013", EVENT_DATE,
                            @"10:30 AM", EVENT_TIME,
                            @"Flight to Detroit", EVENT_TITLE,
                            @"cat5", EVENT_CATEGORY,
                            @"Depart London Heathrow for flight to Detroit", EVENT_SUMMARY, nil];

    
    NSArray *events = [NSArray arrayWithObjects:dict1, dict2, dict3, dict4, dict5, dict6, dict7, dict8, dict9, dict10, dict11,dict12, dict13, dict14,dict15,dict16,dict17,dict18,dict19,dict20,dict21,dict22,dict23,dict24, dict25, dict26, dict27,dict28,dict29,dict30,dict31,dict32,dict33,dict34,dict35,dict36,dict37,dict38,dict39,dict40,dict41, dict42, nil];
    
    return events;
}

@end
