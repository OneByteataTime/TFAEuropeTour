//
//  JTCPersonFetcher.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/9/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PERSON_FIRST_NAME @"firstName"
#define PERSON_LAST_NAME @"lastName"
#define PERSON_ROLE @"role"
#define PERSON_UNIQUE @"unique"

@interface JTCPersonFetcher : NSObject

+ (NSArray *)defaultTravelers:(NSString *)tripName;
@end
