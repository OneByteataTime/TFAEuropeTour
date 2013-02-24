//
//  JTCCategoryFetcher.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/23/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCCategoryFetcher.h"

@implementation JTCCategoryFetcher

+ (NSArray *)defaultCategories:(NSString *)tripName
{
    
    NSDictionary *category1 = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"Breakfast",CATEGORY_NAME,
                             @"coffee.jpg", CATEGORY_IMAGE,
                             @"cat1", CATEGORY_UNIQUE,
                             nil];
    
    NSDictionary *category2 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"Dinner",CATEGORY_NAME,
                               @"dinner.jpg", CATEGORY_IMAGE,
                               @"cat2", CATEGORY_UNIQUE,
                               nil];
    NSDictionary *category3 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"Soccer Match",CATEGORY_NAME,
                               @"soccer_pitch.jpg", CATEGORY_IMAGE,
                               @"cat3", CATEGORY_UNIQUE,
                               nil];
    NSDictionary *category4 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"Free Time",CATEGORY_NAME,
                               @"43-film-roll.png", CATEGORY_IMAGE,
                               @"cat4", CATEGORY_UNIQUE,
                               nil];
    NSDictionary *category5 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"Travel",CATEGORY_NAME,
                               @"bus.jpg", CATEGORY_IMAGE,
                               @"cat5", CATEGORY_UNIQUE,
                               nil];
    NSDictionary *category6 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"Practice",CATEGORY_NAME,
                               @"124-bullhorn.png", CATEGORY_IMAGE,
                               @"cat6", CATEGORY_UNIQUE,
                               nil];
    NSDictionary *category7 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"Game",CATEGORY_NAME,
                               @"101-gameplan.png", CATEGORY_IMAGE,
                               @"cat7", CATEGORY_UNIQUE,
                               nil];
    
    NSArray *categories = [NSArray arrayWithObjects:category1, category2, category3, category4, category5, category6, category7, nil];
    
    return categories;
}
@end
