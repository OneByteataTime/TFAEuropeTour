//
//  JTCPersonFetcher.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/9/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCPersonFetcher.h"

@implementation JTCPersonFetcher

+ (NSArray *)defaultTravelers:(NSString *)tripName
{
    // Parents
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Steve", PERSON_FIRST_NAME,
                           @"Jackson", PERSON_LAST_NAME,
                           @"P", PERSON_ROLE,
                           @"PJACKSON", PERSON_UNIQUE, nil];
    
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Brian", PERSON_FIRST_NAME,
                           @"Stuckey", PERSON_LAST_NAME,
                           @"P", PERSON_ROLE,
                           @"PSTUCKEY", PERSON_UNIQUE, nil];

    NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Tony", PERSON_FIRST_NAME,
                           @"Niccoli", PERSON_LAST_NAME,
                           @"P", PERSON_ROLE,
                           @"PNICCOLI", PERSON_UNIQUE, nil];

    NSDictionary *dict4 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Cindy", PERSON_FIRST_NAME,
                           @"Ratajczak", PERSON_LAST_NAME,
                           @"P", PERSON_ROLE,
                           @"PRATAJCZAK", PERSON_UNIQUE, nil];
    
    NSDictionary *dict5 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Pam", PERSON_FIRST_NAME,
                           @"Black", PERSON_LAST_NAME,
                           @"P", PERSON_ROLE,
                           @"PBLACK", PERSON_UNIQUE, nil];

    NSDictionary *dict6 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Anne", PERSON_FIRST_NAME,
                           @"Bores", PERSON_LAST_NAME,
                           @"P", PERSON_ROLE,
                           @"PBORES", PERSON_UNIQUE, nil];

    NSDictionary *dict7 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Allen", PERSON_FIRST_NAME,
                           @"Bott", PERSON_LAST_NAME,
                           @"P", PERSON_ROLE,
                           @"PBOTT", PERSON_UNIQUE, nil];

    NSDictionary *dict8 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Michele", PERSON_FIRST_NAME,
                           @"Free", PERSON_LAST_NAME,
                           @"P", PERSON_ROLE,
                           @"PFREE", PERSON_UNIQUE, nil];

    NSDictionary *dict9 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Victor", PERSON_FIRST_NAME,
                           @"Guardiola", PERSON_LAST_NAME,
                           @"P", PERSON_ROLE,
                           @"PGUARDIOLA", PERSON_UNIQUE, nil];

    NSDictionary *dict10 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Leisa", PERSON_FIRST_NAME,
                           @"Isenberg", PERSON_LAST_NAME,
                           @"P", PERSON_ROLE,
                           @"PISENBERG", PERSON_UNIQUE, nil];

    NSDictionary *dict11 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Beth", PERSON_FIRST_NAME,
                           @"Parlette", PERSON_LAST_NAME,
                           @"P", PERSON_ROLE,
                           @"PPARLETTE", PERSON_UNIQUE, nil];

    NSDictionary *dict12 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Paul", PERSON_FIRST_NAME,
                           @"Holdgate", PERSON_LAST_NAME,
                           @"P", PERSON_ROLE,
                           @"PHOLDGATE", PERSON_UNIQUE, nil];

    
    NSDictionary *dict13 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Eric", PERSON_FIRST_NAME,
                            @"Stuckey", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SSTUCKEY", PERSON_UNIQUE, nil];
    NSDictionary *dict14 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Ethan", PERSON_FIRST_NAME,
                            @"Ratajczak", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SRATAJCZAK", PERSON_UNIQUE, nil];
    NSDictionary *dict15 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Brice", PERSON_FIRST_NAME,
                            @"Jackson", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SJACKSON", PERSON_UNIQUE, nil];
    
    NSDictionary *dict16 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Yezon", PERSON_FIRST_NAME,
                            @"Al-hamwy", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SALH-HAMWY", PERSON_UNIQUE, nil];
    NSDictionary *dict17 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Evan", PERSON_FIRST_NAME,
                            @"Black", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SBLACK", PERSON_UNIQUE, nil];
    NSDictionary *dict18 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Jacob", PERSON_FIRST_NAME,
                            @"Bores", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SBORES", PERSON_UNIQUE, nil];
    
    NSDictionary *dict19 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Garrett", PERSON_FIRST_NAME,
                            @"Bott", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SBOTT", PERSON_UNIQUE, nil];
    NSDictionary *dict20 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Colin", PERSON_FIRST_NAME,
                            @"Doyle", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SDOYLE", PERSON_UNIQUE, nil];
    NSDictionary *dict21 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Alex", PERSON_FIRST_NAME,
                            @"Free", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SFREE", PERSON_UNIQUE, nil];
    
    NSDictionary *dict22 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Todd", PERSON_FIRST_NAME,
                            @"Guardiola", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SGUARDIOLA", PERSON_UNIQUE, nil];
    NSDictionary *dict23 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Reese", PERSON_FIRST_NAME,
                            @"Isenberg", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SISENBERG", PERSON_UNIQUE, nil];
    NSDictionary *dict24 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Jake", PERSON_FIRST_NAME,
                            @"Jankowski", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SJANKOWSKI", PERSON_UNIQUE, nil];
    
    NSDictionary *dict25 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Jarrett", PERSON_FIRST_NAME,
                            @"Karalfa", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SKARALFA", PERSON_UNIQUE, nil];
    NSDictionary *dict26 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Alex", PERSON_FIRST_NAME,
                            @"Parlette", PERSON_LAST_NAME,
                            @"S", PERSON_ROLE,
                            @"SPARLETTE", PERSON_UNIQUE, nil];

    
    NSArray *travelers = [NSArray arrayWithObjects:dict1,dict2,dict3,dict4,dict5,dict6,dict7,dict8,dict9,dict10,dict11,dict12,dict13,dict14,dict15,dict16,dict17,dict18,dict19,dict20,dict21,dict22,dict23,dict24,dict25,dict26, nil];
    
    return travelers;
}

@end
