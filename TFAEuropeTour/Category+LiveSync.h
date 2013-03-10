//
//  Category+LiveSync.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/23/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Category.h"

@interface Category (LiveSync)

+ (Category *)categoryWithLiveSync:(NSDictionary *)categoryInfo
            inManagedObjectContext:(NSManagedObjectContext *)context;

+ (Category *)categoryFromKey:(NSString *)key inManagedObjectContext:(NSManagedObjectContext *)context;
@end
