//
//  JTCCategoryFetcher.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/23/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CATEGORY_NAME @"name"
#define CATEGORY_IMAGE @"imageName"
#define CATEGORY_UNIQUE @"unique"

@interface JTCCategoryFetcher : NSObject

+ (NSArray *)defaultCategories:(NSString *)tripName;

@end
